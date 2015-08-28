
INSERT INTO dosage_units
(code, displayOrder) VALUES
('mg',1),
('ml',2),
('each',3),
('cc',4),
('gm',5),
('mcg',6),
('IU',7);

INSERT INTO product_categories
(code, name , displayOrder) VALUES
('C1', 'Antibiotics', 1),
('C2', 'Anaesthetics', 4),
('C3', 'Anti-fungal', 2),
('C4', 'Analgesics', 2),
('C5', 'Vaccines', 2);

INSERT INTO products
(code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer,
  packRoundingThreshold, roundToZero, strength) values
('P1', 'Acetylsalicylic Acid, tablet 300mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('P2', 'Acyclovir, tablet 400mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('P3', 'Aminophylline Injection 250mg/10ml', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('P4', 'Amoxicillin (Trihydrate), Dry powder for suspension 125mg/5ml', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('P5', 'Atenolol 50mg tab', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S42', 'Lamivudina 150mg/Zidovudina 300mg/Nevirapina 200mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S18Y', 'Tenofovir 300mg/Lamivudina 300mg/Efavirenze 600mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S40', 'Lamivudina 150mg/ Zidovudina 300mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S36', 'Lamivudina 150mg/Stavudina 30mg/Nevirapina 200mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S32', 'Lamivudina 150mg/Stavudina 30mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S18Z', 'Tenofovir 300mg/Lamivudina 300mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S39Z', 'Lopinavir/Ritonavir 200mg/50mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S21', 'Efavirenze (EFV) 600mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S01', 'Abacavir (ABC) 300 mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S22', 'Nevirapina (NVP) 200mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S13', 'Lamivudina (3TC) 150mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S15', 'Zidovudina (AZT) 300mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S34b', 'Lamivudina 30mg/Stavudina 6mg/Nevirapina 50mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S32Z', 'Estavudina/Lamivudina 6mg+30mg, 60 Comp (Baby) Embalagem', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S42B', 'Lamivudina 30mg/Zidovudina 60mg/Nevirapina 50mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S40Z', 'Lamivudina 30mg/ Zidovudina 60mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S39B', 'Lopinavir/Ritonavir 100mg/25mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S39Y', 'Lopinavir/Ritonavir 80/20 ml Solução Oral', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S01Z', 'Abacavir 60mg/ Lamivudina 30mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S20', 'Efavirenze (EFV) 200mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S19', 'Efavirenze (EFV) 50mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S23', 'Nevirapina 50mg/5ml Sol Oral', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S17', 'Zidovudina 50mg/5ml Sol Oral', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg');
