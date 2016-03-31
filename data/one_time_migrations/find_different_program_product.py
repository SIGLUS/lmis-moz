#!/usr/bin/python
import psycopg2
import sys
import pprint

conn_string = "host='localhost' dbname='open_lmis' user='postgres' password=''"
print "Connecting to database\n ->%s" % (conn_string)
conn = psycopg2.connect(conn_string)
cursor = conn.cursor()
print "Connected!\n"

def create_new_product_table_and_copy_from_new_product_csv_file(csv_path):
    cursor.execute(
        "CREATE TABLE IF NOT EXISTS new_products(CODE VARCHAR(100),DESCRIPTION VARCHAR(200),DOSAGE VARCHAR(100),FORM VARCHAR(100),ACTIVE BOOLEAN,PROGRAM VARCHAR(100));")
    pprint.pprint("add new products table!")

    cursor.execute("COPY new_products FROM '%s' DELIMITER ',' CSV;" % (csv_path))
    pprint.pprint("insert data to data base successfully!")
    conn.commit()


def find_diff_between_new_and_old_program_products():
    cursor.execute(
        "SELECT p.code,pr.code,new.program,pp.productid,pp.productcategoryid,pp.dosespermonth,pp.currentprice,pp.createdby,pp.modifiedby,pp.fullsupply "
        "FROM new_products as new ,program_products as pp inner JOIN programs as pr ON pr.id = pp.programid INNER JOIN products as p on pp.productid = p.id "
        "WHERE new.code = p.code AND new.program!= pr.code;")
    diff_program_products = cursor.fetchall()
    count = 0
    for program_product in diff_program_products:
        product_code = program_product[0]
        new_program_code = program_product[2]
        productid = program_product[3]
        productcategoryid = program_product[4]
        dosespermonth = program_product[5]
        currentprice = program_product[6]
        createdby = program_product[7]
        if createdby == None:
            createdby = 'NULL'
        modifiedby = program_product[8]
        fullsupply = program_product[9]

        deactive = "UPDATE program_products SET active = FALSE WHERE productid = (SELECT p.id from products p WHERE p.code ='%s');" % (
        product_code)
        cursor.execute(deactive)
        pprint.pprint(deactive)

        insert = "INSERT INTO program_products(programid,productid,productcategoryid,dosespermonth,isacoefficientsid,active,currentprice,createdby,createddate,modifiedby,modifieddate,fullsupply) " \
                 "VALUES ((SELECT id FROM programs WHERE code = '%s'),%s,%s,%s,NULL,TRUE ,%s,%s,current_timestamp,%s,current_timestamp,%s);" \
                 % (new_program_code, productid, productcategoryid, dosespermonth, currentprice, createdby, modifiedby,
                    fullsupply)
        cursor.execute(insert)
        pprint.pprint(insert)
        count += 1
    pprint.pprint("excute sucess : %s" % count)
    conn.commit()

def update_all_product_modify_date():
    timestamp_ = "UPDATE products SET modifieddate = current_timestamp;"
    cursor.execute(timestamp_)
    conn.commit()

    pprint.pprint("update products modify date successfully!")

def drop_new_drug_table():
    cursor.execute("drop table new_products;")
    conn.commit()
    pprint.pprint("drop new products table!")

def main(args):
    create_new_product_table_and_copy_from_new_product_csv_file(args[0])
    find_diff_between_new_and_old_program_products()
    update_all_product_modify_date()
    drop_new_drug_table()

if __name__ == "__main__":
    main(sys.argv[1:])
