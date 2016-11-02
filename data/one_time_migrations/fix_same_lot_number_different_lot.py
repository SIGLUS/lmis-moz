#!/usr/bin/python
import psycopg2
import sys
import pprint

def main():
    conn_string = "host='localhost' dbname='open_lmis' user='openlmis' password=''"

    print "Connecting to database\n ->%s" % (conn_string)

    conn = psycopg2.connect(conn_string)

    cursor = conn.cursor()
    print "Connected!\n"

    query = "SELECT sc.productid, t1.lotproductid, t1.lotid, t1.lotnumber, sc.id, t1.lotonhandid \
            FROM stock_cards sc \
            JOIN \
               (SELECT lots.productid AS lotproductid, lots.id AS lotid, lots.lotnumber AS lotnumber, \
                   lots_on_hand.stockcardid AS loh_sc, lots_on_hand.id AS lotonhandid \
               FROM lots JOIN lots_on_hand ON lots_on_hand.lotid = lots.id) t1 \
            ON sc.id = t1.loh_sc \
            WHERE sc.productid != t1.lotproductid \
            ORDER BY t1.lotonhandid"

    cursor.execute(query)
    mismatched_info = cursor.fetchall()

    print('productid, wrongproductid, oldlotid, lotnumber, stockcardid, lotonhandid')

    for entry in mismatched_info:

        print("===================")

        productid = entry[0]
        wrongproductid = entry[1]
        old_lotid = entry[2]
        lotnumber = entry[3]
        stockcardid = entry[4]
        lotonhandid = entry[5]

        pprint.pprint(entry)

        #create new lot if does not exist
        cursor.execute("INSERT INTO lots \
                            (productid, lotnumber, expirationdate, createdby, createddate, modifiedby, modifieddate) \
                            SELECT %d, \'%s\', '2018-11-30 00:00:00+02', 1, NOW(), 1, NOW() \
                            WHERE \
                               NOT EXISTS ( \
                               SELECT productid, lotnumber FROM lots WHERE productid = %d AND lotnumber = \'%s\' )" % (productid, lotnumber, productid, lotnumber))

        cursor.execute("SELECT id FROM lots WHERE productid = %d AND lotnumber = \'%s\'" % (productid, lotnumber))
        new_lotid = cursor.fetchall()[0][0]
        print("new lot id:" + str(new_lotid))

        cursor.execute("UPDATE lots_on_hand SET lotid = %d WHERE id = %d" % (new_lotid, lotonhandid))

        cursor.execute("SELECT stock_card_entries.id FROM stock_card_entries \
                        JOIN stock_cards \
                        ON stock_cards.id = stock_card_entries.stockcardid \
                        WHERE stock_cards.id = %d" % stockcardid)

        for stock_entry in cursor.fetchall():
            print("--------------------")

            stock_entry_id = stock_entry[0]

            cursor.execute("UPDATE stock_card_entry_lot_items \
                            SET lotid =  %d \
                            WHERE lotid = %d and stockcardentryid = %d" % (new_lotid, old_lotid, stock_entry_id))

            cursor.execute("SELECT keycolumn, valuecolumn FROM stock_card_entry_key_values \
                            WHERE stockcardentryid = %d AND keycolumn = \'%s\'" % (stock_entry_id, 'LOT#' + str(old_lotid)))
            wrong_lot_soh_entry = cursor.fetchall()
            pprint.pprint(wrong_lot_soh_entry)

            if len(wrong_lot_soh_entry) > 0:

                cursor.execute("SELECT keycolumn, valuecolumn FROM stock_card_entry_key_values \
                                WHERE stockcardentryid = %d AND keycolumn = \'%s\'" % (stock_entry_id, 'LOT#' + str(new_lotid)))
                existing_lot_soh_entry = cursor.fetchall()
                pprint.pprint(existing_lot_soh_entry)

                lot_soh = int(wrong_lot_soh_entry[0][1])

                if len(existing_lot_soh_entry) > 0:
                    lot_soh += int(existing_lot_soh_entry[0][1])

                    cursor.execute("UPDATE stock_card_entry_key_values \
                                    SET valuecolumn = %d \
                                    WHERE stockcardentryid = %d AND keycolumn = \'%s\'" % (lot_soh, stock_entry_id, 'LOT#' + str(new_lotid)))

                    cursor.execute("DELETE FROM stock_card_entry_key_values \
                                    WHERE stockcardentryid = %d AND keycolumn = \'%s\'" % (stock_entry_id, 'LOT#' + str(old_lotid)))
                else:
                    cursor.execute("UPDATE stock_card_entry_key_values \
                                    SET keycolumn = \'%s\' \
                                    WHERE stockcardentryid = %d AND keycolumn = \'%s\'" % ('LOT#' + str(new_lotid), stock_entry_id, 'LOT#' + str(old_lotid)))

        conn.commit()

if __name__ == "__main__":
    main()
