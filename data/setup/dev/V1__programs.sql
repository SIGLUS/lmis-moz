INSERT INTO programs (code, name, description, active, templateConfigured,
  regimenTemplateConfigured, budgetingApplies, usesDar, push) VALUES
('MMIA', 'MMIA', 'MMIA', TRUE, FALSE, TRUE, FALSE, FALSE, FALSE),
('VIA', 'VIA', 'VIA', TRUE, FALSE, TRUE, FALSE, FALSE, FALSE),
('ESS_MEDS', 'ESSENTIAL MEDICINE', 'ESSENTIAL MEDICINE', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
('TB', 'TB', 'TB', TRUE, FALSE, TRUE, FALSE, FALSE, FALSE),
('NUTRITION', 'NUTRITION', 'NUTRITION', TRUE, FALSE, TRUE, FALSE, FALSE, FALSE);

UPDATE programs SET parentId = (SELECT id FROM programs WHERE code = 'VIA')
WHERE code in ('ESS_MEDS', 'TB', 'NUTRITION');