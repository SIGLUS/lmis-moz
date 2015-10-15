INSERT INTO geographic_levels (code, name, levelNumber) VALUES
('country', 'Country', 1);


INSERT INTO geographic_zones
(code, name, levelId, parentId) VALUES
('Root', 'Root', (SELECT id FROM geographic_levels WHERE code = 'country'), NULL);
INSERT INTO geographic_zones
(code, name, levelId, parentId) VALUES
('Mozambique', 'Mozambique', (SELECT id FROM geographic_levels WHERE code = 'country'), (select id from geographic_zones where code ='Root'));


INSERT INTO facility_types (code, name, description, levelId, nominalMaxMonth, nominalEop,
  displayOrder, active) VALUES
('health_facility','Health Facility', 'Multi-program clinic', null, 3, 0.5, 1, TRUE),
('ddm','DDM', 'DDM', null, 3, 0.5, 2, TRUE),
('dps','DPS', 'DPS', null, 3, 0.5, 3, TRUE);

INSERT INTO facilities
(code, name, description, geographiczoneid, typeId,
  sdp, active, goLiveDate, enabled, virtualFacility) VALUES
('F10', 'Health Facility 1', 'health facility 1', (SELECT id FROM geographic_zones WHERE code = 'Mozambique'),
  (SELECT id FROM facility_types WHERE code = 'health_facility'), TRUE, TRUE, '11/11/12', TRUE, FALSE),
('F20', 'Health Facility 2', 'health facility 2', (SELECT id FROM geographic_zones WHERE code = 'Mozambique'),
  (SELECT id FROM facility_types WHERE code = 'health_facility'), TRUE, TRUE, '11/11/12', TRUE, FALSE),
('F30', 'Health Facility 3', 'health facility 3', (SELECT id FROM geographic_zones WHERE code = 'Mozambique'),
  (SELECT id FROM facility_types WHERE code = 'health_facility'), TRUE, TRUE, '11/11/12', TRUE, FALSE),
('D01', 'DDM 1', 'DDM1', (SELECT id FROM geographic_zones WHERE code = 'Mozambique'),
  (SELECT id FROM facility_types WHERE code = 'ddm'), TRUE, TRUE, '11/11/12', TRUE, FALSE),
('D02', 'DPS 1', 'DPS1', (SELECT id FROM geographic_zones WHERE code = 'Mozambique'),
  (SELECT id FROM facility_types WHERE code = 'dps'), TRUE, TRUE, '11/11/12', TRUE, FALSE);

INSERT INTO programs_supported (facilityId, programId, startDate, active) VALUES
((SELECT id FROM facilities WHERE code = 'F10'), (SELECT id FROM programs WHERE code = 'MMIA'),
  '11/11/12', TRUE),
((SELECT id FROM facilities WHERE code = 'F10'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'),
  '11/11/12', TRUE),
((SELECT id FROM facilities WHERE code = 'F20'), (SELECT id FROM programs WHERE code = 'MMIA'),
  '11/11/12', TRUE),
((SELECT id FROM facilities WHERE code = 'F20'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'),
  '11/11/12', TRUE),
((SELECT id FROM facilities WHERE code = 'F30'), (SELECT id FROM programs WHERE code = 'MMIA'),
  '11/11/12', TRUE),
((SELECT id FROM facilities WHERE code = 'F30'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'),
  '11/11/12', TRUE),
((SELECT id FROM facilities WHERE code = 'D01'), (SELECT id FROM programs WHERE code = 'MMIA'),
  '11/11/12', TRUE),
((SELECT id FROM facilities WHERE code = 'D01'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'),
  '11/11/12', TRUE),
((SELECT id FROM facilities WHERE code = 'D02'), (SELECT id FROM programs WHERE code = 'MMIA'),
  '11/11/12', TRUE),
((SELECT id FROM facilities WHERE code = 'D02'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'),
  '11/11/12', TRUE);
