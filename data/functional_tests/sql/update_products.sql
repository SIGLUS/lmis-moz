INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId) values
('99X99', 'New Drug', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '0,25mg', (SELECT id from product_forms where code='Comprimidos'));

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder) VALUES
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '99X99'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14);

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock) VALUES
((SELECT id FROM facility_types WHERE code = 'CSRUR-II'),(SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '99X99')), 1);

UPDATE products set primaryName='Updated Drug',modifieddate=now() WHERE code = '25D03';

UPDATE products set active = FALSE, modifieddate=now() WHERE code = '08S32Z';

UPDATE products set active=FALSE, modifieddate=now() WHERE code = '12D03Z';