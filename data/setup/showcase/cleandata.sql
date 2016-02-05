DELETE FROM moz_app_info;

DELETE FROM stock_card_entry_key_values;
DELETE FROM stock_card_entries;
DELETE FROM stock_movement_line_items;
DELETE FROM stock_movement_lots;
DELETE FROM stock_movements;
DELETE FROM stock_adjustment_reasons_programs;
DELETE FROM losses_adjustments_types;
DELETE FROM stock_cards;

DELETE FROM requisition_signatures;
DELETE FROM signatures;

DELETE FROM patient_quantification_line_items;
DELETE FROM requisition_line_item_losses_adjustments;

DELETE FROM comments;
DELETE FROM regimen_line_items;
DELETE FROM regimens;
DELETE FROM regimen_categories;
DELETE FROM program_regimen_columns;

DELETE FROM requisition_line_items;
DELETE FROM requisition_status_changes;
DELETE FROM requisitions;

DELETE FROM program_regimen_columns;
DELETE FROM regimens;

DELETE FROM requisition_group_program_schedules;
DELETE FROM requisition_group_members;
DELETE FROM requisition_groups;

DELETE FROM role_assignments WHERE userid != 1;
DELETE FROM user_password_reset_tokens;
DELETE FROM users WHERE username != 'Admin123';

DELETE FROM supervisory_nodes;

DELETE FROM processing_periods;
DELETE FROM processing_schedules;

DELETE FROM program_rnr_columns;

DELETE FROM facility_approved_products;
DELETE FROM program_products;
DELETE FROM kit_products_relation;
DELETE FROM products;
DELETE FROM product_groups;
DELETE FROM product_categories;
DELETE FROM product_forms;
DELETE FROM dosage_units;

DELETE FROM programs_supported;
DELETE FROM facilities;
DELETE FROM refrigerators;
DELETE FROM facility_types;

DELETE FROM geographic_zones;
DELETE FROM geographic_levels;

DELETE FROM programs;

DELETE FROM email_attachments;
DELETE FROM email_notifications;

