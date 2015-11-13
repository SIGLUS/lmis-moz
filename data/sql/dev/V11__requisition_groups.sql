INSERT INTO supervisory_nodes
(facilityId, name, code, parentId) VALUES
((SELECT id FROM facilities WHERE code = 'DDM1'), 'DDM supervisory node', 'N1', NULL),
((SELECT id FROM facilities WHERE code = 'DPM1'), 'DPM supervisory node', 'N2', NULL);

INSERT INTO requisition_groups (code, name, supervisoryNodeId) VALUES
('RG1','Requistion Group VIA', (SELECT id FROM supervisory_nodes WHERE code ='N1')),
('RG2','Requistion Group MMIA', (SELECT id FROM supervisory_nodes WHERE code ='N2'));

INSERT INTO requisition_group_members (requisitionGroupId, facilityId) VALUES
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF1')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF2')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF3')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF4')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF5')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF6')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF7')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF8')),
((SELECT id FROM requisition_groups WHERE code ='RG1'), (SELECT id FROM facilities WHERE code ='HF9')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='HF2')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='HF3')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='HF5')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='HF6')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='HF7')),
((SELECT id FROM requisition_groups WHERE code ='RG2'), (SELECT id FROM facilities WHERE code ='HF9'));

INSERT INTO requisition_group_program_schedules
(requisitionGroupId, programId, scheduleId, directDelivery ) VALUES
((SELECT id FROM requisition_groups WHERE code='RG1'), (SELECT id FROM programs WHERE code='ESS_MEDS'),
  (SELECT id FROM processing_schedules WHERE code='M'), TRUE),
((SELECT id FROM requisition_groups WHERE code='RG2'), (SELECT id FROM programs WHERE code='MMIA'),
  (SELECT id FROM processing_schedules WHERE code='M'), TRUE);