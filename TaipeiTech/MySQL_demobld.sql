CREATE TABLE DEPT 
(
  DEPTNO             INT NOT NULL,
  DNAME              VARCHAR(14),
  LOC                VARCHAR(13),
  CONSTRAINT DEPT_PRIMARY_KEY PRIMARY KEY (DEPTNO)
) ENGINE = INNODB;

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE EMP
(
  EMPNO               INT NOT NULL,
  ENAME               VARCHAR(10),
  JOB                 VARCHAR(9),
  MGR                 INT,
  HIREDATE            DATETIME,
  SAL                 DECIMAL(7,2),
  COMM                DECIMAL(7,2),
  DEPTNO              INT NOT NULL,
  CONSTRAINT EMP_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
  CONSTRAINT EMP_MGR_FK FOREIGN KEY (MGR) REFERENCES EMP (EMPNO),
  CONSTRAINT EMP_EMPNO_PK PRIMARY KEY (EMPNO)
)ENGINE = INNODB;

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'19811117',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'19810501',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'19810609',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'19810402',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'19810928',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'19810220',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'19810908',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'19811203',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'19810222',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'19811203',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'19801217',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'19821209',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'19830112',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'19820123',1300,NULL,10);

CREATE TABLE SALGRADE
 (
   GRADE             TINYINT,
   LOSAL             NUMERIC(7,2),
   HISAL             NUMERIC(7,2)
 ) ENGINE = INNODB;

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

CREATE TABLE CUSTOMER 
(
  CUSTID             INT NOT NULL,
  NAME               VARCHAR (45),
  ADDRESS            VARCHAR (40),
  CITY               VARCHAR (30),
  STATE              VARCHAR (2),
  ZIP                VARCHAR (9),
  AREA               NUMERIC (3),
  PHONE              VARCHAR (9),
  REPID              INT NOT NULL,
  CREDITLIMIT   NUMERIC (9,2),
  CONSTRAINT CUSTOMER_CUSTID_PK PRIMARY KEY (CUSTID),
  CONSTRAINT CUSTOMER_CUSTID_CK CHECK (CUSTID > 0)
) ENGINE = INNODB;

INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT, CITY, AREA, ADDRESS)
VALUES ('96711', 'CA', '7844', '598-6609', 'JOCKSPORTS', '100', '5000', 'BELMONT', '415', '345 VIEWRIDGE');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT, CITY, AREA, ADDRESS)
VALUES ('94061', 'CA', '7521', '368-1223', 'TKB SPORT SHOP', '101', '10000', 'REDWOOD CITY', '415', '490 BOLI RD.');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT, CITY, AREA, ADDRESS)
VALUES ('95133', 'CA', '7654', '644-3341', 'VOLLYRITE', '102', '7000', 'BURLINGAME', '415', '9722 HAMILTON');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT, CITY, AREA, ADDRESS)
VALUES ('97544', 'CA', '7521', '677-9312', 'JUST TENNIS', '103', '3000', 'BURLINGAME', '415', 'HILLVIEW MALL');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,  CITY, AREA, ADDRESS)
VALUES ('93301', 'CA', '7499', '996-2323', 'EVERY MOUNTAIN', '104', '10000', 'CUPERTINO', '408', '574 SUYYYYY RD.');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,  CITY, AREA, ADDRESS)
VALUES ('91003', 'CA', '7844', '376-9966', 'K + T SPORTS', '105', '5000', 'SANTA CLARA', '408', '3476 EL PASEO');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,  CITY, AREA, ADDRESS)
VALUES ('94301', 'CA', '7521', '364-9777', 'SHAPE UP', '106', '6000', 'PALO ALTO', '415', '908 SEQUOIA');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,  CITY, AREA, ADDRESS)
VALUES ('93301', 'CA', '7499', '967-4398', 'WOMENS SPORTS', '107', '10000', 'SUNNYVALE', '408', 'VALCO VILLAGE');
INSERT INTO CUSTOMER (ZIP, STATE, REPID, PHONE, NAME, CUSTID, CREDITLIMIT,  CITY, AREA, ADDRESS)
VALUES ('55649', 'MN', '7844', '566-9123', 'NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER', '108', '8000', 'HIBBING', '612', '98 LONE PINE WAY');

CREATE TABLE ORD
(
 ORDID                INT NOT NULL AUTO_INCREMENT,
 ORDERDATE            DATETIME,
 COMMPLAN             CHAR (1),
 CUSTID               INT NOT NULL,
 SHIPDATE             DATETIME,
 TOTAL                NUMERIC (8,2) ,
 CONSTRAINT ORD_CUSTID_FK FOREIGN KEY (CUSTID) REFERENCES CUSTOMER (CUSTID),
 CONSTRAINT ORD_ORDID_PK PRIMARY KEY (ORDID),
 CONSTRAINT ORD_TOTAL_CK CHECK (TOTAL >= 0)
) AUTO_INCREMENT = 601;

INSERT INTO ORD (TOTAL, SHIPDATE, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('101.4','19870108', '19870107','101', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('45','19870111',  '19870111', '102', 'B');
INSERT INTO ORD (TOTAL, SHIPDATE,  ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('5860','19870120',  '19870115', '104', 'C');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('2.4', '19860530',  '19860501', '106', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('56', '19860620',  '19860605', '102', 'B');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('698', '19860630','19860615', '106', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('8324','19860730',  '19860714', '106', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('3.4', '19860730',  '19860714', '100', 'A');
INSERT INTO ORD (TOTAL, SHIPDATE, ORDERDATE, CUSTID, COMMPLAN)
 VALUES ('97.5', '19860815','19860801', '100', 'B'),
                ('5.6', '19860718',  '19860718', '104', 'C'),
                ('35.2', '19860725', '19860725', '104', 'C'),
                ('224','19860605', '19860605', '102', ''),
                ('4450','19870512',  '19870312', '100', ''),
                ('6400', '19870201', '19870201', '108', ''),
                ('23940', '19870205', '19870201', '102', ''),
                ('764', '19870210',  '19870203', '103', ''),
                ('1260','19870204', '19870202', '104', ''),
                ('46370', '19870303', '19870205', '105', ''),
                ('710','19870206', '19870201', '107', ''),
                ('3510.5','19870306', '19870215', '102', 'A'),
                ('730', '19870106', '19870101', '100', 'A');

CREATE TABLE ITEM
(
 ORDID               INT NOT NULL,
 ITEMID              INT NOT NULL,
 PRODID              INT ,
 ACTUALPRICE         NUMERIC (8,2),
 QTY                 NUMERIC (8),
 ITEMTOT             NUMERIC (8,2),
 CONSTRAINT ITEM_ORDID_FK FOREIGN KEY (ORDID) REFERENCES ORD (ORDID),
 CONSTRAINT ITEM_ORDID_ITEMID_PK PRIMARY KEY (ORDID,ITEMID)
)ENGINE = INNODB;

INSERT INTO ITEM (QTY, PRODID, ORDID, ITEMTOT, ITEMID, ACTUALPRICE)
 VALUES ('1', '100890', '610', '58', '3', '58');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '1', '100861', '611', '45', '1', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '100', '100860', '612', '3000', '1', '30');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '1', '200376', '601', '2.4', '1', '2.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '20', '100870', '602', '56', '1', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '3', '100890', '604', '174', '1', '58');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '2', '100861', '604', '84', '2', '42');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '10', '100860', '604', '440', '3', '44');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '4', '100860', '603', '224', '2', '56');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '1', '100860', '610', '35', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '3', '100870', '610', '8.4', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '200', '200376', '613', '440', '4', '2.2');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '444', '100860', '614', '15540', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '1000', '100870', '614', '2800', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '20', '100861', '612', '810', '2', '40.5');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('150', '101863', '612', '1500', '3', '10');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '100860', '620', '350', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1000', '200376', '620', '2400', '2', '2.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('500', '102130', '620', '1700', '3', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ( '100', '100871', '613', '560', '1', '5.6');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('200', '101860', '613', '4800', '2', '24');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('150', '200380', '613', '600', '3', '4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '102130', '619', '340', '3', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '100860', '617', '1750', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '100861', '617', '4500', '2', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1000', '100871', '614', '5600', '3', '5.6');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '100861', '616', '450', '1', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '100870', '616', '140', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('2', '100890', '616', '116', '3', '58');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '102130', '616', '34', '4', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '200376' , '616', '24', '5', '2.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '200380', '619', '400', '1', '4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '200376', '619', '240', '2', '2.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('4', '100861', '615', '180', '1', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1', '100871', '607', '5.6', '1', '5.6');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '100870', '615', '280', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('500', '100870', '617', '1400', '3', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('500', '100871', '617', '2800', '4', '5.6');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('500', '100890', '617', '29000', '5', '58');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '101860', '617', '2400', '6', '24');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('200', '101863', '617', '2500', '7', '12.5');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '102130', '617', '340', '8', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('200', '200376', '617', '480', '9', '2.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('300', '200380', '617', '1200', '10', '4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('5', '100870', '609', '12.5', '2', '2.5');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1', '100890', '609', '50', '3', '50');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('23', '100860', '618', '805', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '100861', '618', '2255.5', '2', '45.11');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '100870', '618', '450', '3', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '100861', '621', '450', '1', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '100870', '621', '280', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '100871', '615', '250', '3', '5');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1', '101860', '608', '24', '1', '24');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('2', '100871', '608', '11.2', '2', '5.6');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1', '100861', '609', '35', '1', '35');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('1', '102130', '606', '3.4', '1', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '100861', '605', '4500', '1', '45');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('500', '100870', '605', '1400', '2', '2.8');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('5', '100890', '605', '290', '3', '58');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '101860', '605', '1200', '4', '24');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '101863', '605', '900', '5', '9');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('10', '102130', '605', '34', '6', '3.4');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('100', '100871', '612', '550', '4', '5.5');
INSERT INTO ITEM ( QTY , PRODID , ORDID , ITEMTOT , ITEMID , ACTUALPRICE)
 VALUES ('50', '100871', '619', '280', '4', '5.6');


CREATE TABLE PRODUCT 
(
  PRODID              INT,
  DESCRIP             VARCHAR (30),
  CONSTRAINT PRODID_PK PRIMARY KEY(PRODID)
) ENGINE = INNODB;

INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('100860', 'ACE TENNIS RACKET I');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('100861', 'ACE TENNIS RACKET II');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('100870', 'ACE TENNIS BALLS-3 PACK');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('100871', 'ACE TENNIS BALLS-6 PACK');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('100890', 'ACE TENNIS NET');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('101860', 'SP TENNIS RACKET');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('101863', 'SP JUNIOR RACKET');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('102130', 'RH: "GUIDE TO TENNIS"');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('200376', 'SB ENERGY BAR-6 PACK');
INSERT INTO PRODUCT (PRODID, DESCRIP)
 VALUES ('200380', 'SB VITA SNACK-6 PACK');



CREATE TABLE PRICE 
(
 PRODID               INT NOT NULL,
 STDPRICE             NUMERIC (8,2),
 MINPRICE             NUMERIC (8,2),
 STARTDATE            DATETIME,
 ENDDATE              DATETIME
)ENGINE = INNODB;

INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('4.8', '19850101', '100871', '3.2', '19851231');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('58','19850101', '100890', '46.4', NULL);
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('54', '19840101', '100890', '40.5', '19840531');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('35','19860601', '100860', '28', NULL);
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('32','19860101', '100860', '25.6', '19860531');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('30', '19850101', '100860', '24', '19851231');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('45','19860601', '100861', '36', NULL);
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('42','19860101', '100861', '33.6', '19860531');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('39', '19850101', '100861', '31.2', '19851231');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('2.8','19860101', '100870', '2.4', NULL);
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('2.4','19850101', '100870', '1.9', '19851201');
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('5.6','19860101', '100871', '4.8', NULL);
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('24', '19850215', '101860', '18', NULL);
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('12.5','19850215', '101863', '9.4', NULL);
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('3.4','19850818', '102130', '2.8', NULL);
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('2.4', '19861115', '200376', '1.75', NULL);
INSERT INTO PRICE (STDPRICE, STARTDATE, PRODID, MINPRICE, ENDDATE)
 VALUES ('4', '19861115', '200380', '3.2', NULL);


CREATE TABLE MY_EMP
(
  ID          numeric(4) NOT NULL,
  LAST_NAME   varchar(25),
  FIRST_NAME  varchar(25),
  USERID      varchar(8),
  SALARY      numeric(9,2)
)ENGINE = INNODB;
 
 
