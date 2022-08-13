PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20220131045923');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2022-01-31 05:21:00.324397','2022-01-31 05:21:00.324397');
CREATE TABLE IF NOT EXISTS "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO posts VALUES(1,'Mencari buku yang bagus untuk dibaca.','2022-01-31 05:24:15.529063','2022-01-31 05:24:15.529063');
INSERT INTO posts VALUES(2,'Makan siang hari ini enak sekali!','2022-01-31 05:24:32.004378','2022-01-31 05:24:32.004378');
INSERT INTO posts VALUES(3,'Belajar Rails bersama Progate!','2022-08-04 06:41:24.282744','2022-08-04 06:41:24.282744');
INSERT INTO posts VALUES(4,'Ini post baru','2022-08-04 10:24:53.908219','2022-08-04 10:24:53.908219');
INSERT INTO posts VALUES(5,'Post lagi lainnya','2022-08-04 10:25:07.912110','2022-08-04 10:25:07.912110');
INSERT INTO posts VALUES(6,'ini terakhirnya','2022-08-04 10:27:03.480870','2022-08-04 10:27:03.480870');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('posts',6);
COMMIT;