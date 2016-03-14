psql -U postgres --file data/setup/dev/seed.sql -w open_lmis -h localhost
python data/setup/dev/insert_period.py