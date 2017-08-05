PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE dates(date_id integer primary key autoincrement not null, date text);
INSERT INTO "dates" VALUES(1,'2017-08-05 13:38:27');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('dates',1);
COMMIT;
