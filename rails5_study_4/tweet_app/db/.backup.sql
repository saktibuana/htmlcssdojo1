PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20220331045923');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2022-03-31 05:21:00.324397','2022-03-31 05:21:00.324397');
CREATE TABLE IF NOT EXISTS "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO posts VALUES(1,'Sedang ingin menonton film yang bagus!','2022-03-31 05:24:15.529063','2022-08-02 08:58:42.243933');
INSERT INTO posts VALUES(3,'Belajar Rails bersama Progate!','2022-04-06 07:12:40.797561','2022-04-06 07:12:40.797561');
INSERT INTO posts VALUES(4,'Alhamdulillah Hujan!','2022-08-04 09:50:19.109763','2022-08-04 09:50:19.109763');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('posts',4);
COMMIT;