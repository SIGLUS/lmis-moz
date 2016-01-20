#!/usr/bin/python
import psycopg2
import sys
import pprint

def main():
    conn_string = "host='localhost' dbname='open_lmis' user='postgres' password=''"

    print "Connecting to database\n ->%s" % (conn_string)

    conn = psycopg2.connect(conn_string)

    cursor = conn.cursor()
    print "Connected!\n"

    cursor.execute("INSERT INTO losses_adjustments_types (name, description, additive) VALUES('UNPACK_KIT', 'Unpack kit', FALSE)")

    conn.commit()

if __name__ == "__main__":
    main()
