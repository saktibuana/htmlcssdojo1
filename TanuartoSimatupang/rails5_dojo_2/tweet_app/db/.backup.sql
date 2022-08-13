PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20220512024421');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2022-05-12 02:44:26.268623','2022-05-12 02:44:26.268623');
CREATE TABLE IF NOT EXISTS "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO posts VALUES(1,'Post 1','2022-08-07 16:13:03.151726','2022-08-07 16:30:22.276440');
INSERT INTO posts VALUES(2,'test 2 test 2','2022-08-07 16:17:19.359984','2022-08-07 16:17:28.672623');
INSERT INTO posts VALUES(3,'test 3 test 3','2022-08-07 16:17:35.132915','2022-08-07 16:22:26.914655');
INSERT INTO posts VALUES(4,'test 4','2022-08-07 16:24:21.492559','2022-08-07 16:24:21.492559');
INSERT INTO posts VALUES(5,'test 5','2022-08-07 16:26:07.332978','2022-08-07 16:26:07.332978');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('posts',7);
COMMIT;