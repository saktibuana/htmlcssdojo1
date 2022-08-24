PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20220331045923');
INSERT INTO schema_migrations VALUES('20220823141958');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2022-03-31 05:21:00.324397','2022-03-31 05:21:00.324397');
CREATE TABLE IF NOT EXISTS "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO posts VALUES(1,'Mencari buku yang bagus untuk dibaca.','2022-03-31 05:24:15.529063','2022-03-31 05:24:15.529063');
INSERT INTO posts VALUES(2,'Makan siang hari ini enak!','2022-03-31 05:24:32.004378','2022-03-31 05:24:32.004378');
INSERT INTO posts VALUES(3,'Guru Domba mengajariku cara menggunakan Git! Sekarang saya bisa mengajari adik kecilku, Ben.','2022-03-31 06:00:32.004378','2022-03-31 06:00:32.004378');
INSERT INTO posts VALUES(4,'Saudaraku Ken sedang belajar dengan giat! Tampaknya dia ingin menjadi seorang insinyur. Mungkin saya juga harus mencobanya.','2022-03-31 07:24:32.004378','2022-03-31 07:24:32.004378');
INSERT INTO posts VALUES(5,'Belajar ngoding di Progate. Saya baru saja menyelesaikan pelajaran Rails/Study/3!','2022-03-31 09:24:32.004378','2022-03-31 09:24:32.004378');
INSERT INTO posts VALUES(6,'Saya mengikuti sebuah workshop pemrograman di Progate! Saya belajar banyak dan mendapatkan stiker yang lucu sekali :)','2022-03-31 09:24:32.004378','2022-03-31 09:24:32.004378');
CREATE TABLE IF NOT EXISTS "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO users VALUES(1,'Ninja Ken','ken@progate.com','2022-08-23 14:21:21.491807','2022-08-23 14:21:21.491807');
INSERT INTO users VALUES(2,'Guru Domba','gurudomba@progate.com','2022-08-23 14:26:54.173494','2022-08-23 14:26:54.173494');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('posts',6);
INSERT INTO sqlite_sequence VALUES('users',2);
COMMIT;
