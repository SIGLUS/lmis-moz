#!/usr/bin/env ruby

BUILD_DIR="#{Dir.pwd}/build"
OPENLMIS_DIR="#{Dir.pwd}/open-lmis"
MOZ_DIR="#{Dir.pwd}/moz"

def update_openlmis
  if !Dir.exists?(OPENLMIS_DIR)
    return openlmis_setup
  else
    return system("cd #{OPENLMIS_DIR} && git checkout . && git pull origin 2.0-moz")
  end
end

def openlmis_setup
  result1 = system("git clone https://github.com/OpenLMIS/open-lmis.git #{OPENLMIS_DIR}")
  return result1 if !result1
  result2 = system("cd #{OPENLMIS_DIR} && git checkout 2.0-moz && git submodule init && git submodule update")
  return result2 if !result2
  result3 = system("cd #{OPENLMIS_DIR}/modules/openlmis-web && npm install")
  return result3 if !result3
end

def file_list
  ['modules/openlmis-web/src/main/resources/messages.properties']
end

def replace_files
  result = false
  file_list.each do |file_path|
    result = system("rm #{OPENLMIS_DIR}/#{file_path} && cp #{MOZ_DIR}/#{file_path} #{OPENLMIS_DIR}/#{file_path}")
    break if !result
    puts "replaced #{file_path}"
  end
  result
end

def build_project
  return system("cd #{OPENLMIS_DIR} && gradle clean build")
end

puts "Updating openlmis code..."
r1 = update_openlmis
exit if !r1
puts "Finished updating openlmis code"

r2 = puts "Replacing files..."
r2 = replace_files
exit if !r2
puts "Finished replacing files"

puts "Running tests and building artifact..."
r3 = build_project
exit if !r3
puts "Finished running tests and building artifact"
