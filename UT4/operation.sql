CREATE TABLE accounts (
    account_no INTEGER NOT NULL PRIMARY KEY,
    balance DECIMAL NOT NULL DEFAULT 0,
    CHECK(balance >=0)
);

CREATE TABLE account_changes ( 
    change_no INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    account_no INTEGER NOT NULL,
    flag TEXT NOT NULL,
    amount DECIMAL NOT NULL,
    changed_at TEXT NOT NULL
);

INSERT INTO accounts (account_no,balance)
VALUES (100,20100);

INSERT INTO accounts (account_no,balance)
VALUES (200,10100);

BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 1000
WHERE account_no = 100;

UPDATE accounts
SET balance = balance  + 1000
WHERE account_no = 200;

INSERT INTO account_changes(account_no,flag,amount,changed_at)
VALUES(100,"-",1000,datetime("now"));

INSERT INTO account_changes(account_no,flag,amount,changed_at)
VALUES(200,"+",1000,datetime("now"));

COMMIT;

BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 20000
WHERE account_no = 100;

INSERT INTO account_changes(account_no, flag, amount, changed_at)
VALUES(100,"-",20000,datetime("no"));


