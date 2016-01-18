INSERT INTO facilities
(code, name, description, geographicZoneId, typeId, active, goLiveDate, enabled, sdp, virtualFacility)
VALUES('F_LOWSTOCK_CMM','Facility_low_stock','',(SELECT id FROM geographic_zones WHERE code = 'MARRACUENE'),
  (SELECT id FROM facility_types WHERE code = 'CSRUR-II'),TRUE,'9/21/2013',TRUE,TRUE,FALSE);

INSERT INTO programs_supported (facilityId, programId, active, startDate) VALUES ((SELECT id FROM facilities WHERE code = 'F_LOWSTOCK_CMM'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'),TRUE,'9/21/2013');

INSERT INTO users (userName, password, facilityId, firstName, lastName, email, verified, active, restrictLogin, isMobileUser)
 VALUES('low_stock', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',(SELECT id FROM facilities WHERE code = 'F_LOWSTOCK_CMM'), 'Super', 'User', NULL, TRUE, TRUE, FALSE, TRUE);

INSERT INTO role_assignments(userId, roleId, programId, supervisoryNodeId) VALUES
((SELECT ID FROM USERS WHERE username = 'low_stock'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'low_stock'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL);


INSERT INTO stock_cards(
            facilityid, productid, totalquantityonhand, effectivedate,
            notes, createdby, createddate, modifiedby, modifieddate)
    VALUES ((SELECT id FROM facilities where code = 'F_LOWSTOCK_CMM'), (SELECT id FROM products where code = '01A01'), 400, null,
            null, null, (select NOW() - '3 month'::interval), null, NOW());

INSERT INTO stock_card_entries
(id, stockcardid, lotonhandid, type, quantity, stockmovementid, referencenumber, adjustmenttype,
 notes, createdby, createddate, modifiedby, modifieddate, occurred)
 VALUES (1, (SELECT id FROM stock_cards WHERE facilityid = (SELECT id FROM facilities WHERE code = 'F_LOWSTOCK_CMM')), NULL, 'ADJUSTMENT', 1000, NULL, NULL, 'INVENTORY', NULL, (SELECT id FROM facilities WHERE code = 'F_LOWSTOCK_CMM'),
  (select NOW() - '1 month'::interval), (SELECT id FROM users WHERE username = 'low_stock'), (select NOW() - '3 month'::interval), (select NOW() - '3 month'::interval)),
(2, (SELECT id FROM stock_cards WHERE facilityid = (SELECT id FROM facilities WHERE code = 'F_LOWSTOCK_CMM')), NULL, 'ADJUSTMENT', 100, NULL, NULL, 'LABORATORY', NULL, (SELECT id FROM facilities WHERE code = 'F_LOWSTOCK_CMM'),
  (select NOW() - '1 month'::interval), (SELECT id FROM users WHERE username = 'low_stock'), (select NOW() - '3 month'::interval), (select NOW() - '3 month'::interval)),
(3, (SELECT id FROM stock_cards WHERE facilityid = (SELECT id FROM facilities WHERE code = 'F_LOWSTOCK_CMM')), NULL, 'ADJUSTMENT', 200, NULL, NULL, 'LABORATORY', NULL, (SELECT id FROM facilities WHERE code = 'F_LOWSTOCK_CMM'),
  (select NOW() - '1 month'::interval), (SELECT id FROM users WHERE username = 'low_stock'), (select NOW() - '2 month'::interval), (select NOW() - '2 month'::interval)),
(4, (SELECT id FROM stock_cards WHERE facilityid = (SELECT id FROM facilities WHERE code = 'F_LOWSTOCK_CMM')), NULL, 'ADJUSTMENT', 300, NULL, NULL, 'LABORATORY', NULL, (SELECT id FROM facilities WHERE code = 'F_LOWSTOCK_CMM'),
  (select NOW() - '1 month'::interval), (SELECT id FROM users WHERE username = 'low_stock'), (select NOW() - '1 month'::interval), (select NOW() - '1 month'::interval));


INSERT INTO stock_card_entry_key_values (stockcardentryid, keycolumn, valuecolumn, createddate, modifieddate)
VALUES (1, 'soh', '1000', (select NOW() - '3 month'::interval), (select NOW() - '3 month'::interval)),
	   (1, 'signature', 'gtttg', (select NOW() - '3 month'::interval), (select NOW() - '3 month'::interval)),
	   (2, 'soh', '900', (select NOW() - '3 month'::interval), (select NOW() - '3 month'::interval)),
	   (2, 'signature', 'gtttg', (select NOW() - '3 month'::interval), (select NOW() - '3 month'::interval)),
	   (3, 'soh', '700', (select NOW() - '2 month'::interval), (select NOW() - '2 month'::interval)),
	   (3, 'signature', 'gtttg', (select NOW() - '2 month'::interval), (select NOW() - '2 month'::interval)),
	   (4, 'soh', '400', (select NOW() - '1 month'::interval), (select NOW() - '1 month'::interval)),
	   (4, 'signature', 'gtttg', (select NOW() - '1 month'::interval), (select NOW() - '1 month'::interval))