#!/usr/bin/python
import psycopg2
import sys
import pprint

def insert_stock_movement_signatures():
    conn_string = "host='localhost' dbname='open_lmis' user='openlmis' password=''"
    print "Connecting to database\n ->%s" % (conn_string)
    conn = psycopg2.connect(conn_string)
    cursor = conn.cursor()
    print "Connected!\n"
    cursor.execute("SELECT id FROM stock_cards")
    stock_card_ids = cursor.fetchall()
    for stock_card_id in stock_card_ids:
        query = "SELECT stockcardentryid, valuecolumn FROM stock_card_entry_key_values WHERE stockcardentryid IN (SELECT stock_card_entries.id FROM stock_card_entries LEFT JOIN stock_cards ON stock_cards.id = stock_card_entries.stockcardid WHERE stock_cards.id = %s ORDER BY id DESC LIMIT 1) AND keycolumn = 'soh'" % stock_card_id[0]
        cursor.execute(query)
        columns = [column[0] for column in cursor.description]
        for row in cursor.fetchall():
            stock_entry_soh = dict(zip(columns, row))
            pprint.pprint(stock_entry_soh)
            query = "UPDATE stock_cards SET totalquantityonhand = %s WHERE stock_cards.id = %s" % (stock_entry_soh['valuecolumn'], stock_card_id[0])
            cursor.execute(query)
            pprint.pprint(query)
            conn.commit()

if __name__ == "__main__":
    insert_stock_movement_signatures()