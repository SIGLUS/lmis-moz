DELETE FROM programs;
INSERT INTO programs (code, name, description, active, templateConfigured,
  regimenTemplateConfigured, budgetingApplies, usesDar, push) VALUES
('MMIA', 'MMIA', 'MMIA', TRUE, FALSE, TRUE, FALSE, FALSE, TRUE),
('ESS_MEDS', 'VIA ESSENTIAL', 'VIA ESSENTIAL', TRUE, FALSE, FALSE, FALSE, FALSE, FALSE);