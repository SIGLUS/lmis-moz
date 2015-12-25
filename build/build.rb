#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'buildSteps'

ENVIRONMENT = ARGV[0] || "ci"

puts "Updating openlmis code..."
r1 = update_openlmis
exit 1 if !r1
puts "Finished updating openlmis code"

puts "Replacing files..."
r2 = replace_files
exit 1 if !r2
puts "Finished replacing files"

if ENVIRONMENT == 'ci'
  puts "Removing properties files..."
  r3 = remove_openlmis_properties_files
  exit 1 if !r3
  puts "Finished removing properties files"
end

puts "Running tests and building artifact..."
r4 = build_project
exit 1 if !r4
puts "Finished running tests and building artifact"

puts "Building data"
r5 = build_data
exit 1 if !r5
puts "Finished setting up data"