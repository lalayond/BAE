CREATE TABLE comments (
    post_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    website_url TEXT NULL,
    comment TEXT NOT NULL );
CREATE TABLE sqlite_sequence(name,seq);
