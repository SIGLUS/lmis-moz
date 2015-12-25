#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'buildSteps'

puts "Updating openlmis code..."
r1 = update_openlmis
exit 1 if !r1
puts "Finished updating openlmis code"

puts "Replacing files..."
r2 = replace_files
exit 1 if !r2
puts "Finished replacing files"