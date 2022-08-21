PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO "schema_migrations" VALUES('20220331045923');
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "ar_internal_metadata" VALUES('environment','development','2022-03-31 05:21:00.324397','2022-03-31 05:21:00.324397');
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "posts" VALUES(1,'Mencari sebuah buku yang bagus untuk dibaca.','2022-03-31 05:24:15.529063','2022-03-31 05:24:15.529063');
INSERT INTO "posts" VALUES(2,'Makan siang hari ini enak!','2022-03-31 05:24:32.004378','2022-03-31 05:24:32.004378');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('posts',2);
COMMIT;
