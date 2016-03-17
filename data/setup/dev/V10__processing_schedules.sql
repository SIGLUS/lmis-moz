INSERT INTO processing_schedules (code, name, description) VALUES ('M', 'Monthly', 'Month');

INSERT INTO processing_periods
(name, description, startDate, endDate, numberOfMonths, scheduleId, modifiedBy) VALUES
('Jan2016', 'Jan2016', '2016-01-21', '2016-02-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Feb2016', 'Feb2016', '2016-02-21', '2016-03-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Mar2016', 'Mar2016', '2016-03-21', '2016-04-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Apr2016', 'Apr2016', '2016-04-21', '2016-05-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('May2016', 'May2016', '2016-05-21', '2016-06-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('June2016', 'June2016', '2016-06-21', '2016-07-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('July2016', 'July2016', '2016-07-21', '2016-08-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Aug2016', 'Aug2016', '2016-08-21', '2016-09-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Sep2016', 'Sep2016', '2016-09-21', '2016-10-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Oct2016', 'Oct2016', '2016-10-21', '2016-11-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Nov2016', 'Nov2016', '2016-11-21', '2016-12-20 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1));