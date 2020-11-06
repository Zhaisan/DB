CREATE DATABASE lab1; --1
CREATE TABLE users(   --2
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);
ALTER TABLE users     --3
    ADD COLUMN isadmin BIT;

ALTER TABLE users     --4
    ALTER COLUMN isadmin TYPE BOOLEAN
USING (isadmin::INT::BOOLEAN);

ALTER TABLE users     --5
    ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users   --6
    ADD PRIMARY KEY (id);

CREATE TABLE tasks( --7
    id SERIAL,
    name VARCHAR(50),
    user_id INTEGER
);


DROP TABLE tasks; --8

DROP DATABASE lab1;  --9






