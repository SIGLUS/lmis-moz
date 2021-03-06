DELETE FROM moz_app_info WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47);

DELETE FROM stock_card_entry_lot_items_key_values WHERE stockcardentrylotitemid IN (SELECT id FROM stock_card_entry_lot_items WHERE stockcardentryid IN (SELECT id FROM stock_card_entries WHERE stockcardid IN (SELECT id FROM stock_cards WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47))));
DELETE FROM stock_card_entry_lot_items WHERE stockcardentryid IN (SELECT id FROM stock_card_entries WHERE stockcardid IN (SELECT id FROM stock_cards WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47)));
DELETE FROM stock_card_entry_key_values WHERE stockcardentryid IN (SELECT id FROM stock_card_entries WHERE stockcardid IN (SELECT id FROM stock_cards WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47)));
DELETE FROM stock_card_entries WHERE stockcardid IN (SELECT id FROM stock_cards WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47));
DELETE FROM lots_on_hand WHERE stockcardid IN (SELECT id FROM stock_cards WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47));
DELETE FROM stock_cards WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47);

DELETE FROM requisition_signatures WHERE rnrid IN (SELECT id FROM requisitions WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47));
-- DELETE FROM signatures WHERE id IN (3, 4, 13 ,14, 15, 16, 17, 18, 29, 30, 31, 32, 33, 34, 39, 40, 41, 42, 51, 52, 53, 54);

DELETE FROM patient_quantification_line_items WHERE rnrid IN (SELECT id FROM requisitions WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47));

DELETE FROM regimen_line_items WHERE rnrid IN (SELECT id FROM requisitions WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47));

DELETE FROM requisition_line_items WHERE rnrid IN (SELECT id FROM requisitions WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47));
DELETE FROM requisition_status_changes WHERE rnrid IN (SELECT id FROM requisitions WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47));
DELETE FROM requisition_periods WHERE rnrid IN (SELECT id FROM requisitions WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47));
DELETE FROM requisitions WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47);

DELETE FROM archived_products WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47)

DELETE FROM requisition_group_members WHERE facilityid IN (2, 3, 5, 6, 7, 8, 9, 10, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47);

DELETE FROM user_password_reset_tokens WHERE userid IN (2, 4, 5, 6, 7, 8, 13, 14, 15, 33, 34, 35, 36, 37, 49);
DELETE FROM role_assignments WHERE userid = (SELECT id FROM users WHERE username = 'chai_testuser');
DELETE FROM role_assignments WHERE userid = (SELECT id FROM users WHERE username = 'Vu_test');
DELETE FROM role_assignments WHERE userid = (SELECT id FROM users WHERE username = 'test_sync_user');
DELETE FROM role_assignments WHERE userid = (SELECT id FROM users WHERE username = 'test_ddm_user');
DELETE FROM role_assignments WHERE userid = (SELECT id FROM users WHERE username = 'TEST_SUPERVISOR');
DELETE FROM role_assignments WHERE userid = (SELECT id FROM users WHERE username = 'ALloyd');

DELETE FROM users WHERE username = 'Renee';
DELETE FROM users WHERE username = 'Renee2';
DELETE FROM users WHERE username = 'chai_testuser';
DELETE FROM users WHERE username = 'Vu_test';
DELETE FROM users WHERE username = 'test_sync_user';
DELETE FROM users WHERE username = 'test_ddm_user';
DELETE FROM users WHERE username = 'TEST_SUPERVISOR';
DELETE FROM users WHERE username = 'Internet';
DELETE FROM users WHERE username = 'Jaime';
DELETE FROM users WHERE username = 'Alex';
DELETE FROM users WHERE username = '1';
DELETE FROM users WHERE username = 'Jonn';
DELETE FROM users WHERE username = 'ALloyd';
DELETE FROM users WHERE username = 'CHAI';
DELETE FROM users WHERE username = 'Thomas';

DELETE FROM programs_supported WHERE facilityid IN (1, 13, 14);
DELETE FROM facilities WHERE code IN ('TEST1', 'TEST2', 'TEST_SYNC');

