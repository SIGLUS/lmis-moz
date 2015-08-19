DELETE FROM regimen_categories;

INSERT INTO regimen_categories (code, name, displayOrder) VALUES
('ADULTS', 'Adults', 1),
('PAEDIATRICS', 'Paediatrics', 2);

DELETE FROM regimens;
INSERT INTO regimens (programid, categoryid, code, name, active, displayorder) VALUES
((SELECT id FROM programs where code = 'MMIA'), 1, '001', 'AZT+3TC+NVP', TRUE, 1),
((SELECT id FROM programs where code = 'MMIA'), 1, '002', 'TDF+3TC+EFV', TRUE, 2),
((SELECT id FROM programs where code = 'MMIA'), 1, '003', 'AZT+3TC+EFV', TRUE, 3);

DELETE FROM program_regimen_columns;
INSERT INTO program_regimen_columns(name, programId, label, visible, dataType) VALUES
('code', (SELECT id FROM programs where code = 'MMIA'), 'header.code',
  TRUE, 'regimen.reporting.dataType.text'),
('patientsOnTreatment', (SELECT id FROM programs where code = 'MMIA'), 'Number of patients on treatment',
  TRUE, 'regimen.reporting.dataType.numeric');