PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE dates(date_id integer primary key autoincrement not null, date text);
INSERT INTO "dates" VALUES(1,'2017-08-05 13:38:27');
INSERT INTO "dates" VALUES(2,'2017-08-05 19:49:06');
INSERT INTO "dates" VALUES(3,'2017-08-06 08:40:36');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('dates',3);
COMMIT;
