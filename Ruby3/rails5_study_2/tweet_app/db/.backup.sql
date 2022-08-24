PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20220801062058');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2022-08-01 06:24:18.710929','2022-08-01 06:24:18.710929');
CREATE TABLE IF NOT EXISTS "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO posts VALUES(1,'Belajar Rails bersama Progate!','2022-08-01 06:25:02.838417','2022-08-01 06:25:02.838417');
INSERT INTO posts VALUES(2,'Mencoba menampilkan post!','2022-08-01 06:25:34.174796','2022-08-01 06:25:34.174796');
INSERT INTO posts VALUES(3,'Belajar coding itu sangat menyenangkan!','2022-08-01 06:31:41.552770','2022-08-01 06:31:41.552770');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('posts',3);
COMMIT;