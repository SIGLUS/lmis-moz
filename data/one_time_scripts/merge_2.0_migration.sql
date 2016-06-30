DELETE FROM schema_version;
DROP TABLE migration_schema_version;
DELETE FROM one_time_migration_schema_version;

INSERT INTO schema_version
(version_rank, installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success)
VALUES
(1, 1, '20160203224438968', 'schema 20', 'SQL', '20160203224438968__schema_20.sql', 1564040432, 'openlmis', NOW(), 2834, TRUE),
(2, 2, '20160624160526661', 'moz custom migrations', 'SQL', '20160624160526661__moz_custom_migrations.sql', -338833885, 'openlmis', NOW(), 280, TRUE);

INSERT INTO one_time_migration_schema_version
(version_rank, installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success)
VALUES
(1, 1, '20160630173237840', 'existing one time migrations', 'SQL', '20160630173237840__existing_one_time_migrations.sql', 0, 'openlmis', NOW(), 1000, TRUE),
(2, 2, '20160630173632349', 'update VIA name', 'SQL', '20160630173632349__update_VIA_name.sql', 0, 'openlmis', NOW(), 200, TRUE);
