INSERT INTO requisition_groups (code, name, supervisoryNodeId) VALUES
('RG1','Requistion Group 1', (SELECT id FROM supervisory_nodes WHERE code ='SN1'));

INSERT INTO requisition_group_members (requisitionGroupId, facilityId) VALUES
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='F10')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='F20')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='F30')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='D01'));

INSERT INTO requisition_group_program_schedules (requisitionGroupId, programId, scheduleId, directDelivery ) VALUES
((SELECT id FROM requisition_groups WHERE code='RG1'), (SELECT id FROM programs WHERE code='MMIA'),
  (SELECT id FROM processing_schedules WHERE code='M'), TRUE);