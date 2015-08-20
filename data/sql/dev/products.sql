DELETE FROM dosage_units;

INSERT INTO dosage_units
(code, displayOrder) VALUES
('mg',1),
('ml',2),
('each',3),
('cc',4),
('gm',5),
('mcg',6),
('IU',7);

DELETE FROM product_categories;
INSERT INTO product_categories
(code, name , displayOrder) VALUES
('C1', 'Antibiotics', 1),
('C2', 'Anaesthetics', 4),
('C3', 'Anti-fungal', 2),
('C4', 'Analgesics', 2),
('C5', 'Vaccines', 2);

DELETE FROM facility_approved_products;
DELETE FROM program_products;
DELETE FROM products;
DELETE FROM product_groups;

INSERT INTO products
(code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer,
  packRoundingThreshold, roundToZero) values
('P1', 'Acetylsalicylic Acid, tablet 300mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE),
('P2', 'Acyclovir, tablet 400mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE),
('P3', 'Aminophylline Injection 250mg/10ml', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE),
('P4', 'Amoxicillin (Trihydrate), Dry powder for suspension 125mg/5ml', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE),
('P5', 'Atenolol 50mg tab', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE),
('P6', 'Penicillin benzathine benzyl, injection 2.4 MU', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE),
('P7', 'Betamethasone eye drops  0.1%', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE),
('P8', 'Benzylpenicillin Sodium, injection 5MU', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE),
('P9', 'Carbamazepine, tablet 200mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE),
('P10', 'Ceftriaxone Sodium, pwd for injection, 250mg vial', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE);

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, displayOrder) VALUES
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'P1'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 1),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'P2'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 2),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'P3'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 3),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'P4'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 4),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'P5'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 5),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = 'P6'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 6),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = 'P7'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 7),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = 'P8'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 8),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = 'P9'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 9),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = 'P10'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 10);

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock) VALUES
((SELECT id FROM facility_types WHERE code = 'health_facility'), 1, 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'), 2, 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'), 3, 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'), 4, 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'), 5, 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'), 6, 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'), 7, 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'), 8, 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'), 9, 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'), 10, 3),
((SELECT id FROM facility_types WHERE code = 'ddm'), 1, 3),
((SELECT id FROM facility_types WHERE code = 'ddm'), 2, 3),
((SELECT id FROM facility_types WHERE code = 'ddm'), 3, 3),
((SELECT id FROM facility_types WHERE code = 'ddm'), 4, 3),
((SELECT id FROM facility_types WHERE code = 'ddm'), 5, 3),
((SELECT id FROM facility_types WHERE code = 'dps'), 6, 3),
((SELECT id FROM facility_types WHERE code = 'dps'), 7, 3),
((SELECT id FROM facility_types WHERE code = 'dps'), 8, 3),
((SELECT id FROM facility_types WHERE code = 'dps'), 9, 3),
((SELECT id FROM facility_types WHERE code = 'dps'), 10, 3);