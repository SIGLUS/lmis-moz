INSERT INTO supervisory_nodes
(facilityId, name, code, parentId) VALUES
((SELECT id FROM facilities WHERE code = 'D01'), 'Node 1', 'SN1', NULL),
((SELECT id FROM facilities WHERE code = 'D02'), 'Node 2', 'SN2', NULL);

INSERT INTO requisition_groups (code, name, supervisoryNodeId) VALUES
('RG1','Requistion Group 1', (SELECT id FROM supervisory_nodes WHERE code ='SN1')),
('RG2','Requistion Group 2', (SELECT id FROM supervisory_nodes WHERE code ='SN2'));

INSERT INTO requisition_group_members (requisitionGroupId, facilityId) VALUES
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='F10')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='F20')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='F30')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='D01')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='F10')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='F20')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='F30')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='D02'));

INSERT INTO requisition_group_program_schedules
(requisitionGroupId, programId, scheduleId, directDelivery ) VALUES
((SELECT id FROM requisition_groups WHERE code='RG1'), (SELECT id FROM programs WHERE code='ESS_MEDS'),
  (SELECT id FROM processing_schedules WHERE code='M'), TRUE),
((SELECT id FROM requisition_groups WHERE code='RG2'), (SELECT id FROM programs WHERE code='MMIA'),
  (SELECT id FROM processing_schedules WHERE code='M'), TRUE);