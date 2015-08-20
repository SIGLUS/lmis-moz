DELETE FROM geographic_zones;
DELETE FROM geographic_levels;

INSERT INTO geographic_levels (code, name, levelNumber) VALUES
('country', 'Country', 1);


INSERT INTO geographic_zones
(code, name, levelId, parentId) VALUES
('Root', 'Root', (SELECT id FROM geographic_levels WHERE code = 'country'), NULL),
('Mozambique', 'Mozambique', (SELECT id FROM geographic_levels WHERE code = 'country'), NULL);
