INSERT INTO roles
(name, description) VALUES
('FacilityHead', ''),
('Store In-Charge', '');

INSERT INTO role_rights
(roleId, rightName) VALUES
((SELECT id FROM roles WHERE name = 'FacilityHead'), 'AUTHORIZE_REQUISITION'),
((SELECT id FROM roles WHERE name = 'FacilityHead'), 'VIEW_REQUISITION'),
((SELECT id FROM roles WHERE name = 'Store In-Charge'), 'VIEW_REQUISITION'),
((SELECT id FROM roles WHERE name = 'Store In-Charge'), 'CREATE_REQUISITION'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_GEOGRAPHIC_ZONE'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_SUPERVISORY_NODE'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_REQUISITION_GROUP'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_FACILITY_APPROVED_PRODUCT'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_PRODUCT');

INSERT INTO users
(userName, password, facilityId, firstName, lastName, email, verified, active, restrictLogin) VALUES
('superuser', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'F10'), 'Super', 'User', 'superuser@mail.com',
  TRUE, TRUE, FALSE),
('professor_x', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'D01'), 'Charles', 'Xavier', 'professor_x@xmen.com',
  TRUE, TRUE, FALSE),
('magneto', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'D02'), 'Eric', 'Lensherr', 'magneto@brotherhood.com',
  TRUE, TRUE, FALSE),
('mystique', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'F20'), 'Raven', 'Darkhölme', 'mystique@brotherhood.com',
  TRUE, TRUE, FALSE),
('wolverine', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'F30'), 'Logan', 'H', 'wolverine@xmen.com',
  TRUE, TRUE, FALSE);

INSERT INTO supervisory_nodes
(facilityId, name, code, parentId) VALUES
((SELECT id FROM facilities WHERE code = 'D01'), 'Node 1', 'SN1', NULL),
((SELECT id FROM facilities WHERE code = 'D02'), 'Node 2', 'SN2', NULL);

INSERT INTO role_assignments
(userId, roleId, programId, supervisoryNodeId) VALUES
((SELECT ID FROM USERS WHERE username = 'superuser'),
  (SELECT id FROM roles WHERE name = 'Store In-Charge'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'superuser'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'superuser'),
  (SELECT id FROM roles WHERE name = 'Store In-Charge'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'superuser'),
  (SELECT id FROM roles  WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'professor_x'),
  (SELECT id FROM roles WHERE name = 'Store In-Charge'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'professor_x'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'professor_x'),
  (SELECT id FROM roles WHERE name = 'Store In-Charge'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'professor_x'),
  (SELECT id FROM roles  WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'magneto'),
  (SELECT id FROM roles WHERE name = 'Store In-Charge'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'magneto'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'magneto'),
  (SELECT id FROM roles WHERE name = 'Store In-Charge'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'magneto'),
  (SELECT id FROM roles  WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'mystique'),
  (SELECT id FROM roles WHERE name = 'Store In-Charge'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'mystique'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'mystique'),
  (SELECT id FROM roles WHERE name = 'Store In-Charge'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'mystique'),
  (SELECT id FROM roles  WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'wolverine'),
  (SELECT id FROM roles WHERE name = 'Store In-Charge'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'wolverine'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'wolverine'),
  (SELECT id FROM roles WHERE name = 'Store In-Charge'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'wolverine'),
  (SELECT id FROM roles  WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL);