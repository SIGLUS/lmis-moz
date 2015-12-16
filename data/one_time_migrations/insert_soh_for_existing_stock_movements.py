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

    cursor.execute("SELECT id FROM facilities")
    facility_ids = cursor.fetchall()

    for facility_id in facility_ids:
        cursor.execute("SELECT id from stock_cards where facilityid = %s" % facility_id)
        stock_card_ids = cursor.fetchall()
        for stock_card_id in stock_card_ids:
            cursor.execute("SELECT id, quantity, stockcardid FROM stock_card_entries where stockcardid = %s order by id" % stock_card_id)
            columns = [column[0] for column in cursor.description]
            stock_card_entries = []
            for row in cursor.fetchall():
                stock_card_entries.append(dict(zip(columns, row)))

            soh = 0
            first_entry = True
            for stock_card_entry in stock_card_entries:
                if first_entry:
                    soh = stock_card_entry['quantity']
                    query = "INSERT INTO stock_card_entry_key_values (stockcardentryid, keycolumn, valuecolumn, createdby, modifiedby) VALUES (%s, 'soh', %s, 1, 1)" % (stock_card_entry['id'], str(soh))
                    cursor.execute(query)
                    pprint.pprint(query)
                    conn.commit()
                    pprint.pprint(stock_card_entry['id'])
                    first_entry = False
                else:
                    soh += stock_card_entry['quantity']
                    query = "INSERT INTO stock_card_entry_key_values (stockcardentryid, keycolumn, valuecolumn, createdby, modifiedby) VALUES (%s, 'soh', %s, 1, 1)" % (stock_card_entry['id'], str(soh))
                    cursor.execute(query)
                    pprint.pprint(query)
                    conn.commit()
                    pprint.pprint(stock_card_entry['id'])

if __name__ == "__main__":
    main()
