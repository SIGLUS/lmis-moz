
INSERT INTO processing_schedules (code, name, description) VALUES ('M', 'Monthly', 'Month');

INSERT INTO processing_periods
(name, description, startDate, endDate, numberOfMonths, scheduleId, modifiedBy) VALUES
('Jan2014', 'Jan2014', '2014-01-01', '2014-01-31 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Feb2014', 'Feb2014', '2014-02-01', '2014-02-28 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Mar2014', 'Mar2014', '2014-03-01', '2014-03-31 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Apr2014', 'Apr2014', '2014-04-01', '2014-04-30 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('May2014', 'May2014', '2014-05-01', '2014-05-31 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('June2014', 'June2014', '2014-06-01', '2014-06-30 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('July2014', 'July2014', '2014-07-01', '2014-07-31 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Aug2014', 'Aug2014', '2014-08-01', '2014-08-31 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Sep2014', 'Sep2014', '2014-09-01', '2014-09-30 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Oct2014', 'Oct2014', '2014-10-01', '2014-10-31 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Nov2014', 'Nov2014', '2014-11-01', '2014-11-30 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1)),
('Dec2014', 'Dec2014', '2014-12-01', '2014-12-31 23:59:59', 1,
  (SELECT id FROM processing_schedules WHERE code = 'M'), (SELECT id FROM users LIMIT 1));