CREATE DATABASE laboratory_work_4;  --1


CREATE TABLE Warehouses (       --2
  code SERIAL PRIMARY KEY,
  location VARCHAR(255) NOT NULL ,
  capacity INTEGER NOT NULL
);

CREATE TABLE Packs (       --3
  code VARCHAR(4) NOT NULL ,
  contents VARCHAR(255) NOT NULL ,
  value REAL NOT NULL ,
  warehouse INTEGER NOT NULL

);


INSERT INTO Warehouses(code,location,capacity) VALUES(1,'Chicago',3);
INSERT INTO Warehouses(code,location,capacity) VALUES(2,'Chicago',4);
INSERT INTO Warehouses(code,location,capacity) VALUES(3,'New York',7);
INSERT INTO Warehouses(code,location,capacity) VALUES(4,'Los Angeles',2);
INSERT INTO Warehouses(code,location,capacity) VALUES(5,'San Francisco',8);

INSERT INTO Packs(code,contents,value,warehouse) VALUES('0MN7','Rocks',180,3);
INSERT INTO Packs(code,contents,value,warehouse) VALUES('4H8P','Rocks',250,1);
INSERT INTO Packs(code,contents,value,warehouse) VALUES('4RT3','Scissors',190,4);
INSERT INTO Packs(code,contents,value,warehouse) VALUES('7G3H','Rocks',200,1);
INSERT INTO Packs(code,contents,value,warehouse) VALUES('8JN6','Papers',75,1);
INSERT INTO Packs(code,contents,value,warehouse) VALUES('8Y6U','Papers',50,3);
INSERT INTO Packs(code,contents,value,warehouse) VALUES('9J6F','Papers',175,2);
INSERT INTO Packs(code,contents,value,warehouse) VALUES('LL08','Rocks',140,4);
INSERT INTO Packs(code,contents,value,warehouse) VALUES('P0H6','Scissors',125,1);
INSERT INTO Packs(code,contents,value,warehouse) VALUES('P2T6','Scissors',150,2);
INSERT INTO Packs(code,contents,value,warehouse) VALUES('TU55','Papers',90,5);

SELECT * FROM Packs;       --4

SELECT * FROM Packs WHERE value > 180;   --5

SELECT DISTINCT on(contents) * FROM Packs;  --6

SELECT warehouse,count(*)
    FROM Packs GROUP BY warehouse; --7

SELECT warehouse,count(*) FROM Packs
        GROUP BY warehouse HAVING count(*) > 2; --8

INSERT INTO Warehouses(code,location, capacity) VALUES(6,'Texas',5); --9

INSERT INTO Packs(code,contents,value,warehouse) VALUES('H5RT','Papers',350,2); --10

UPDATE Packs SET value = value - value*0.18
    WHERE value = (SELECT value FROM Packs
        ORDER BY value DESC OFFSET 2 LIMIT 1);    --11

DELETE FROM Packs WHERE value < 150; --12

DELETE FROM Packs USING Warehouses
    WHERE warehouse = Warehouses.code
        AND Warehouses.location = 'Chicago' RETURNING *;   --13












