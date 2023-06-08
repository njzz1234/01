--------------------------------------------------------
--  颇老捞 积己凳 - 格夸老-6岿-08-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table DEPT
--------------------------------------------------------

  CREATE TABLE "C##JAVA"."DEPT" 
   (	"DEPTNO" NUMBER(2,0), 
	"DNAME" VARCHAR2(14 BYTE), 
	"LOC" VARCHAR2(13 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into C##JAVA.DEPT
SET DEFINE OFF;
Insert into C##JAVA.DEPT (DEPTNO,DNAME,LOC) values (10,'ACCOUNTING','NEW YORK');
Insert into C##JAVA.DEPT (DEPTNO,DNAME,LOC) values (20,'RESEARCH','DALLAS');
Insert into C##JAVA.DEPT (DEPTNO,DNAME,LOC) values (30,'SALES','CHICAGO');
Insert into C##JAVA.DEPT (DEPTNO,DNAME,LOC) values (40,'OPERATIONS','BOSTON');
Insert into C##JAVA.DEPT (DEPTNO,DNAME,LOC) values (80,'COUNTER','KOREA');
