#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'buildSteps'

# puts "Updating openlmis code..."
# r1 = update_openlmis
# exit 1 if !r1
# puts "Finished updating openlmis code"
#
# puts "Replacing files..."
# r2 = replace_files
# exit 1 if !r2
# puts "Finished replacing files"
#
# puts "Set up db"
# r3 = setup_db
# exit 1 if !r3
# puts "Finished setting up db"
#
# puts "Building data"
# r4 = build_data
# exit 1 if !r4
# puts "Finished setting up data"

puts "Starting jetty"
r5 = start_jetty
exit 1 if !r5
puts "Finished starting jetty"