#!/usr/bin/env ruby
sqloutput=`psql -U openlmis --file data/integrity_check/check_prodsim_soh.sql -w open_lmis -h 52.193.130.59 -p 5432`
def count_em(string, substring)
  string.scan(/(?=#{substring})/).count
end
if count_em(sqloutput,"0 rows")== 3
  puts "no soh mismatch found, sql output is:"
  puts sqloutput
else
  puts "mismatches found, here they are: "
  puts sqloutput
  exit 1 #make the script fail#
end