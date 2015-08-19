DELETE FROM program_rnr_columns;
INSERT INTO program_rnr_columns
(masterColumnId, programId, visible, position, label) VALUES
(1, (SELECT id FROM programs WHERE code = 'MMIA'),  TRUE, 1,  'Product Code'),
(3, (SELECT id FROM programs WHERE code = 'MMIA'),  TRUE, 2,  'Beginning Balance'),
(4, (SELECT id from programs WHERE code = 'MMIA'),  TRUE, 3,  'Total Received Quantity'),
(5, (SELECT id from programs WHERE code = 'MMIA'),  TRUE, 4,  'Total Consumed Quantity'),
(6, (SELECT id from programs WHERE code = 'MMIA'),  TRUE, 5,  'Total Losses / Adjustments'),
(7, (SELECT id from programs WHERE code = 'MMIA'), TRUE, 6, 'Requested Quantity'),
(8, (SELECT id from programs WHERE code = 'MMIA'), TRUE, 7, 'Expiration Date');

UPDATE programs SET templateConfigured = TRUE WHERE id = (SELECT id FROM programs WHERE code = 'MMIA');