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

def replace_file_list
  ['modules/openlmis-web/src/main/resources/openlmis_logging.xml',
   'modules/openlmis-web/src/main/resources/applicationContext.xml',
   'modules/openlmis-web/build.gradle',
   'modules/rest-api/build.gradle',
   'modules/db/src/main/resources/db/migration/V5_2__create_product_forms.sql',
   'modules/db/src/main/resources/db/migration/V5_5__create_products.sql',
   'settings.gradle']
end

def properties_files
  ['modules/openlmis-web/src/main/resources/atomfeed.properties',
   'modules/openlmis-web/src/main/resources/bserver/app.properties',
   'modules/openlmis-web/src/main/resources/bserver/mailing.properties',
   'modules/openlmis-web/src/main/resources/ci/app.properties',
   'modules/openlmis-web/src/main/resources/default.properties',
   'modules/openlmis-web/src/main/resources/demo1/app.properties',
   'modules/openlmis-web/src/main/resources/local/app.properties',
   'modules/openlmis-web/src/main/resources/perf/app.properties',
   'modules/openlmis-web/src/main/resources/qa/app.properties',
   'modules/openlmis-web/src/main/resources/uat/app.properties']
end

def tz_specific_modules
  ['modules/report',
   'modules/rest-api/src/main/java/org/openlmis/restapi/controller/LookupController.java',
   'modules/rest-api/src/main/java/org/openlmis/restapi/controller/StockStatusController.java',
   'modules/rest-api/src/test/java/org/openlmis/restapi/controller/LookupControllerTest.java'
  ]
end

def remove_tz_modules
 result = false
  tz_specific_modules.each do |file_path|
    result = system("rm -rf #{OPENLMIS_DIR}/#{file_path}")
    break if !result
    puts "removed #{file_path}"
  end
  result
end

def replace_files
  result = false
  replace_file_list.each do |file_path|
    result = system("rm #{OPENLMIS_DIR}/#{file_path} && cp #{MOZ_DIR}/#{file_path} #{OPENLMIS_DIR}/#{file_path}")
    break if !result
    puts "replaced #{file_path}"
  end
  result
end

def remove_openlmis_properties_files
  result = false
  properties_files.each do |file_path|
    result = system("rm #{OPENLMIS_DIR}/#{file_path}")
    break if !result
    puts "removed #{file_path}"
  end
  result
end

def build_project
  return system("cd #{OPENLMIS_DIR} && export DISPLAY=:1 && gradle clean setupdb setupExtensions seed build")
end

def build_data
  return system("cd #{OPENLMIS_DIR}/.. && ./build/setup-data.sh")
end

puts "Updating openlmis code..."
r1 = update_openlmis
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

puts "Removing tz report module"
r6 = remove_tz_modules
exit 1 if !r6
puts "Finished removing tz report module"

puts "Running tests and building artifact..."
r4 = build_project
exit 1 if !r4
puts "Finished running tests and building artifact"

puts "Building data"
r5 = build_data
exit 1 if !r5
puts "Finished setting up data"