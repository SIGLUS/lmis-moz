DELETE FROM facility_approved_products  WHERE programProductId = (SELECT id FROM products WHERE code = '99X99');
DELETE FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '99X99');
DELETE FROM products where code='99X99';

UPDATE products set primaryName='Manual de procedimentos  do Deposito Distital de Medicamentos Sem Dosagem Papel',modifieddate=now() WHERE code = '25D03';
