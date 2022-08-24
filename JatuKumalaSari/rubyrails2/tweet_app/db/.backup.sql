PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20220801135706');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2022-08-01 14:01:39.091612','2022-08-01 14:01:39.091612');
CREATE TABLE IF NOT EXISTS "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO posts VALUES(1,'Belajar Rails dengan Progate!','2022-08-01 14:09:39.396969','2022-08-01 14:09:39.396969');
INSERT INTO posts VALUES(2,'Mencoba menampilkan post!','2022-08-01 14:10:33.535947','2022-08-01 14:10:33.535947');
INSERT INTO posts VALUES(3,'Belajar code itu sangat menyenangkan!','2022-08-01 14:19:46.774887','2022-08-01 14:19:46.774887');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('posts',3);
COMMIT;