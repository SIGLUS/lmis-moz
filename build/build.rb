#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'buildSteps'

BRANCH = ARGV[0] || "2.0-moz"

puts "Updating openlmis code..."
r1 = update_openlmis(BRANCH)
exit 1 if !r1
puts "Finished updating openlmis code"

puts "Replacing files..."
r2 = replace_files
exit 1 if !r2
puts "Finished replacing files"

puts "Removing properties files..."
r3 = remove_openlmis_properties_files
exit 1 if !r3
puts "Finished removing properties files"

puts "Writting latest commit message as version info"
version_written=write_version_info
exit 1 if !version_written
puts "Version info written"

puts "Running tests and building artifact..."
r4 = build_project
exit 1 if !r4
puts "Finished running tests and building artifact"

puts "Building data"
r5 = build_data
exit 1 if !r5
puts "Finished setting up data"