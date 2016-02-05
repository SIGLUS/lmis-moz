INSERT INTO facilities
(code, name, description, geographicZoneId, typeId, active, goLiveDate, enabled, sdp, virtualFacility)
VALUES
('HF1','Facility-1','',(SELECT id FROM geographic_zones WHERE code = 'MARRACUENE'),
  (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),TRUE,'11/21/2015',TRUE,TRUE,FALSE),
('HF2','Facility-2','',(SELECT id FROM geographic_zones WHERE code = 'MARRACUENE'),
  (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),TRUE,'11/21/2015',TRUE,TRUE,FALSE),
('DDM1','DDM','DDM', (SELECT id FROM geographic_zones WHERE code = 'MARRACUENE'),
  (SELECT id FROM facility_types WHERE code = 'DDM'),TRUE,'11/21/2015',TRUE,TRUE,FALSE),
('DPM1','DPM','DPM', (SELECT id FROM geographic_zones WHERE code = 'MATOLA'),
  (SELECT id FROM facility_types WHERE code = 'DPM'),TRUE,'11/21/2015',TRUE,TRUE,FALSE);

INSERT INTO programs_supported (facilityId, programId, active, startDate) VALUES
((SELECT id FROM facilities WHERE code = 'HF1'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'),TRUE,'11/21/2015'),
((SELECT id FROM facilities WHERE code = 'HF1'), (SELECT id FROM programs WHERE code = 'MMIA'),TRUE,'11/21/2015'),
((SELECT id FROM facilities WHERE code = 'HF2'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'),TRUE,'11/21/2015'),
((SELECT id FROM facilities WHERE code = 'HF2'), (SELECT id FROM programs WHERE code = 'MMIA'),TRUE,'11/21/2015');

INSERT INTO supervisory_nodes
(facilityId, name, code, parentId) VALUES
((SELECT id FROM facilities WHERE code = 'DDM1'), 'DDM supervisory node', 'N1', NULL),
((SELECT id FROM facilities WHERE code = 'DPM1'), 'DPM supervisory node', 'N2', NULL);

INSERT INTO requisition_groups (code, name, supervisoryNodeId) VALUES
('RG1','Requistion Group VIA', (SELECT id FROM supervisory_nodes WHERE code ='N1')),
('RG2','Requistion Group MMIA', (SELECT id FROM supervisory_nodes WHERE code ='N2'));

INSERT INTO requisition_group_program_schedules
(requisitionGroupId, programId, scheduleId, directDelivery ) VALUES
((SELECT id FROM requisition_groups WHERE code='RG1'), (SELECT id FROM programs WHERE code='ESS_MEDS'),
  (SELECT id FROM processing_schedules WHERE code='M'), TRUE),
((SELECT id FROM requisition_groups WHERE code='RG2'), (SELECT id FROM programs WHERE code='MMIA'),
  (SELECT id FROM processing_schedules WHERE code='M'), TRUE);

INSERT INTO requisition_group_members (requisitionGroupId, facilityId) VALUES
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF1')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF2')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='HF1')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='HF2'));

INSERT INTO users
(userName, password, facilityId, firstName, lastName, email, verified, active, restrictLogin, isMobileUser) VALUES
('facility1-user', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'HF1'), 'Facility1', 'User', NULL,
  TRUE, TRUE, FALSE, TRUE),
('facility2-user', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'HF2'), 'Facility2', 'User', NULL,
  TRUE, TRUE, FALSE, TRUE);

INSERT INTO role_assignments
(userId, roleId, programId, supervisoryNodeId) VALUES
((SELECT ID FROM USERS WHERE username = 'facility1-user'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'facility1-user'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'facility2-user'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'facility2-user'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'Admin123'),
  (SELECT id FROM roles WHERE name = 'Supervisor'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'),
  (SELECT id FROM supervisory_nodes WHERE code = 'N1')),
((SELECT ID FROM USERS WHERE username = 'Admin123'),
  (SELECT id FROM roles WHERE name = 'Supervisor'), (SELECT id FROM programs WHERE code = 'MMIA'),
  (SELECT id FROM supervisory_nodes WHERE code = 'N2')),
((SELECT ID FROM USERS WHERE username = 'Admin123'),
  (SELECT id FROM roles WHERE name = 'ReportViewer'), NULL, NULL);

UPDATE users SET email = 'openlmis.test.dpm@gmail.com' WHERE userName = 'Admin123';

