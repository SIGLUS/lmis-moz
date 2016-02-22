#!/usr/bin/env ruby
sqloutput=`psql -U openlmis --file data/integrity_check/check_prodsim_soh.sql -w open_lmis -h 52.193.130.59 -p 5432`
if sqloutput.include? "0 rows"
  puts "no soh mismatch found"
else
  puts "mismatches found, here they are: "
  puts sqloutput
  exit 1 #make the script fail#
end