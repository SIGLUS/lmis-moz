DELETE FROM dosage_units;

DELETE FROM facility_approved_products where facilityTypeId in (
    SELECT id FROM facility_types WHERE code in ('health_facility','ddm','dps')
);
DELETE FROM program_products where programId in (SELECT id FROM programs WHERE code in ('ESS_MEDS','MMIA'));



DELETE FROM programs_supported where facilityid in ( select id from facilities where code like 'F%' or code like 'D%');
DELETE FROM refrigerators;

delete from role_assignments where roleid in (SELECT id FROM roles WHERE name in ('FacilityHead','Store In-Charge'));
delete from users where username != 'Admin123';
DELETE FROM requisition_group_program_schedules where programid  in (SELECT id FROM programs WHERE code in ('ESS_MEDS','MMIA'));
DELETE FROM requisition_group_members where requisitionGroupId in (SELECT id FROM requisition_groups WHERE code in ('RG1','RG2'));
DELETE FROM requisition_groups where code in ('RG1','RG2');
DELETE FROM supervisory_nodes where code in ('SN1','SN2');
DELETE FROM facilities where code in ('F10','F20','F30','D01','D02');


delete from role_rights where roleid in (SELECT id FROM roles WHERE name in ('FacilityHead', 'Store In-Charge')) ;
delete from role_rights where roleid= (SELECT id FROM roles WHERE name = 'Admin')
   and rightName in ('MANAGE_GEOGRAPHIC_ZONE','MANAGE_SUPERVISORY_NODE','MANAGE_REQUISITION_GROUP','MANAGE_FACILITY_APPROVED_PRODUCT','MANAGE_PRODUCT');

delete from roles where name in ('FacilityHead', 'Store In-Charge');

DELETE FROM program_rnr_columns where programid  in (SELECT id FROM programs WHERE code in ('MMIA'));

DELETE FROM processing_periods where name like '%2014';
DELETE FROM processing_schedules where code in ('M');



DELETE FROM program_regimen_columns where programid in (SELECT id FROM programs where code = 'MMIA');
DELETE FROM regimens where programid  in (SELECT id FROM programs where code = 'MMIA');


DELETE FROM product_groups;
DELETE FROM products;
DELETE FROM programs where code in('MMIA','ESS_MEDS');
DELETE FROM product_categories where code in('C1','C2','C3','C4','C5');
DELETE FROM facility_types where code in ('health_facility','ddm','dps');

