#!/usr/bin/python
import psycopg2
import sys
import pprint
import datetime
import calendar

conn_string = "host='localhost' dbname='open_lmis' user='openlmis' password=''"
conn = psycopg2.connect(conn_string)
cursor = conn.cursor()

def insert_periods():
    current_date = datetime.date.today()
    period_begin_month_num = current_date.strftime("%m")
    period_begin_month_abb = current_date.strftime("%b")
    period_begin_year = current_date.strftime("%Y")

    if current_date.day < 18:
        current_date = add_months(current_date,-1)
        period_begin_month_num = current_date.strftime("%m")
        period_begin_month_abb = current_date.strftime("%b")
        period_begin_year = current_date.strftime("%Y")

    period_end_month_abb = add_months(current_date,1).strftime("%b")
    period_end_month_num = add_months(current_date,1).strftime("%m")
    period_end_year = add_months(current_date,1).strftime("%Y")
        
    query = "INSERT INTO processing_periods(name, description, startDate, endDate, numberOfMonths, scheduleId, modifiedBy) VALUES('{period_begin_abb}', '{period_end_abb}', '{period_begin_date}-21', '{period_end_date}-18 23:59:59', 1,(SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1))".format(period_begin_abb=period_begin_month_abb+period_begin_year,period_end_abb=period_end_month_abb+period_end_year,period_begin_date=period_begin_year+'-'+period_begin_month_num,period_end_date=period_end_year+'-'+period_end_month_num)
    cursor.execute(query)
    print "insert current period from {period_begin} To {period_end} sucess!".format(period_begin=period_begin_month_abb+period_begin_year,period_end=period_end_month_abb+period_end_year)
    conn.commit()


def add_months(sourcedate,months):
        month = sourcedate.month - 1 + months
        year = int(sourcedate.year + month / 12 )
        month = month % 12 + 1
        day = min(sourcedate.day,calendar.monthrange(year,month)[1])
        return datetime.date(year,month,day)


def main():
    insert_periods()

if __name__ == "__main__":
    main()
