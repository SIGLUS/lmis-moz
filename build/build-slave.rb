#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'buildSteps'

puts "Building artifact for slave prod server"
r = build_slave_project
exit 1 if !r
puts "Finished building artifact"
