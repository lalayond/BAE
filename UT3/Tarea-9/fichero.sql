PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE comments (
    post_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    website_url TEXT NULL,
    comment TEXT NOT NULL );
INSERT INTO comments VALUES(1,'Shivam Mamgain','xyz@gmail.com','shivammg.blogspot.com','Great tutorial for beginners.');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('comments',1);
COMMIT;
