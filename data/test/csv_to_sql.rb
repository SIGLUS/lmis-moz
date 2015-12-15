require 'csv'

file = "data/csv/qa/V9_products.csv"
products = CSV.read(file)
sql_array = []
products.each do |temp|
  line = "('" + temp[0] + "', '" + temp[1] + "', '" + temp[2] + "', " + temp[3] + "," +
    temp[4] + "," + temp[5] + "," + temp[6] + "," + temp[7] + "," + temp[8] + "," + temp[9] +
    ", '" + temp[10] + "', (SELECT id from product_forms where code='" + temp[11] + "')),"
  sql_array.push(line)
end

sql_string = sql_array.join("\r\n")
File.open("output_products", 'w') { |file| file.write(sql_string) }


file = "data/csv/qa/V10_program_products.csv"
program_products = CSV.read(file)
sql_array = []
program_products.each do |pp|
  line = "((SELECT id FROM programs WHERE code = '" + pp[1] + "'), " +
    "(SELECT id FROM products WHERE code = '" + pp[0] + "'), TRUE, TRUE," +
    "12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  " + pp[6] + "),"
  sql_array.push(line)
end

sql_string = sql_array.join("\r\n")
File.open("output_program_products", 'w') { |file| file.write(sql_string) }


file = "data/csv/qa/V11_facility_approved_products.csv"
facility_products = CSV.read(file)
sql_array = []
facility_products.each do |pp|
  line = "((SELECT id FROM facility_types WHERE code = '" + pp[0] + "')," +
    "(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = ' " +
    pp[2] + "')), 1),"
  sql_array.push(line)
end

sql_string = sql_array.join("\r\n")
File.open("output_facility_type_approved_products", 'w') { |file| file.write(sql_string) }
