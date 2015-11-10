### Data Setup

### On CI
1. CI moz-build sets up data with all the data in data/sql/dev
2. To re-set up data on CI, run the job setup-web-dev-data

### On QA
1. Run the script under data/sql/dev/cleandata.sql on QA if you want to do cleanup
2. Run sql scripts in sql/qa/seed.sql to set up programs, geographic_levels and facility_type
3. On openlmis web portal, set up Processing schedule with code "M"
4. Upload csv V1 to V13 in order on QA's upload screen