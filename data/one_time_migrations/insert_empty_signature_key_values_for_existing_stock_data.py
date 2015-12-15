#!/usr/bin/python
import psycopg2
import sys
import pprint

conn_string = "host='localhost' dbname='open_lmis' user='openlmis' password=''"
print "Connecting to database\n ->%s" % (conn_string)
conn = psycopg2.connect(conn_string)
cursor = conn.cursor()
print "Connected!\n"

def insert_stock_movement_signatures():
    cursor.execute("SELECT DISTINCT stockcardentryid FROM stock_card_entry_key_values WHERE stockcardentryid NOT IN (SELECT stockcardentryid FROM stock_card_entry_key_values WHERE keycolumn='signature')")
    no_signature_entries = cursor.fetchall()

    for stock_card_entry_id in no_signature_entries:
        query = "INSERT INTO stock_card_entry_key_values (stockcardentryid, keycolumn, valuecolumn, createdby, modifiedby) VALUES(%s, 'signatures', '', 1, 1)" % (stock_card_entry_id)
        cursor.execute(query)
        pprint.pprint(query)
        conn.commit()
    print "Inserted %s stock card entry signatures" % len(no_signature_entries)

def insert_requisition_signatures():
    cursor.execute("SELECT id FROM requisitions WHERE id NOT IN (SELECT id FROM requisitions LEFT JOIN requisition_signatures ON requisition_signatures.rnrid = requisitions.id)")
    requisitions = cursor.fetchall()
    for requisition_id in requisitions:
        cursor.execute("INSERT INTO signatures (type, text, modifiedby, createdby) VALUES ('SUBMITTER', '', 1, 1)")
        conn.commit()
        cursor.execute("SELECT id FROM signatures ORDER BY id desc LIMIT 1")
        submitter_signature_id = cursor.fetchone()[0]
        cursor.execute("INSERT INTO signatures (type, text, modifiedby, createdby) VALUES ('APPROVER', '', 1, 1)")
        conn.commit()
        cursor.execute("SELECT id FROM signatures ORDER BY id desc LIMIT 1")
        approver_signature_id = cursor.fetchone()[0]
        query = "INSERT INTO requisition_signatures (signatureId, rnrId) VALUES (%s, %s), (%s, %s)" % (submitter_signature_id, requisition_id[0], approver_signature_id, requisition_id[0])
        cursor.execute(query)
        pprint.pprint(query)
        conn.commit()

    print "Inserted %s requisition signatures" % len(requisitions)


def main():
    insert_stock_movement_signatures()
    insert_requisition_signatures()

if __name__ == "__main__":
    main()
