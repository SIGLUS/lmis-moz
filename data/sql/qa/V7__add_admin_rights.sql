INSERT INTO role_rights
(roleId, rightName) VALUES
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_GEOGRAPHIC_ZONE'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_SUPERVISORY_NODE'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_REQUISITION_GROUP'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_FACILITY_APPROVED_PRODUCT'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_PRODUCT');