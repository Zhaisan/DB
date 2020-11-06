CREATE DATABASE lab2; --1

CREATE TABLE countries   --2
(
    country_id   SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    region_id    INTEGER,
    population   INTEGER
);

INSERT INTO countries        --3
    VALUES (DEFAULT, 'PORTUGAL', 19, 11000);

INSERT INTO countries (country_name)  --4
    VALUES ('SPAIN');

INSERT INTO countries (region_id)     --5
    VALUES (NULL);


INSERT INTO countries (country_name, region_id, population) VALUES    --6
    ('ARGENTINA', 12, 44490000),
    ('BRAZILIAN', 11, 210000000),
    ('URUGUAY', 17, 3500000);

ALTER TABLE countries    --7
    ALTER COLUMN country_name
    SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_name)    --8
    VALUES (DEFAULT);

INSERT INTO countries (country_name, region_id, population)   --9
    VALUES (DEFAULT, DEFAULT, DEFAULT);

CREATE TABLE countries_new (    --10
    LIKE countries
);

INSERT INTO countries_new      --11
    SELECT * FROM countries;

UPDATE countries_new   --12
SET region_id = 1
WHERE region_id IS NULL;

UPDATE countries_new      --13
SET population = population * 1.1
RETURNING country_name, population AS New_Population;

DELETE FROM countries  --14
WHERE population < 100000;

DELETE FROM countries_new USING countries   --15
WHERE countries_new.country_id = countries.country_id
RETURNING *;

DELETE FROM countries     --16
RETURNING *;
