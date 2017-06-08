--• Define an integrity constraint to prohibit the possibility of two employees to own the same firstname, lastname and phone number. Use the alter table statement

ALTER TABLE EMP
ADD UNIQUE (ENAME,EFIRST,TEL);

-- • More and more employees have two phone numbers: a fixed and a mobilephone. Unfortunately, the database allows us to store one phone number. Bringthe necessary modifications to the database. Set up an integrity constraint in order to make sure that the enteredmobile number begins with 06.

ALTER TABLE EMP
ADD TEL_MOBILE CHAR(10 BYTE) NULL
ADD CONSTRAINT condition_number
CHECK (REGEXP_LIKE (TEL_MOBILE, '^06'));

--In practice, we realize that when one wants to delete an employee, it is necessary to remove all his dependants. How is it possible to make such removal dynamic. Do not forget to first remove the referential constraint fk_ depenent_emp that already exists

ALTER TABLE DEPENDENTS
DROP CONSTRAINT FK_DEPENDENT_EMP;

ALTER TABLE DEPENDENTS
ADD CONSTRAINT FK_DEPENDENT_FK
FOREIGN KEY (EMPNO)
REFERENCES EMP(EMPNO)
ON DELETE CASCADE;

--• Define a sequence to make easy creation of a new dependent. This sequence has to start with the value 8000 and an increment gap of 1.

--The instruction to create a sequence:
--CREATE SEQUENCE ma_sequence [START WITH] ... [INCREMENT BY]...
--[MINVALUE]...[MAXVALUE]...[CYCLE|NOCYCLE];



CREATE SEQUENCE MA_SEQUENCE
START WITH 8000
INCREMENT BY 1;

--• Add some tuples to the DEPENDENT table using the previous sequence Use
ma_sequence.NEXTVAL to get the values from the sequence

INSERT INTO EMP VALUES
(MA_SEQUENCE.NEXTVAL, 'appy', 'trivedi', 'student', 7839,
TO_DATE ('24-02-1996', 'DD-MM-YYYY'), 1167, NULL, '0699999999', 30,'0623423423');
INSERT INTO DEPENDENTS VALUES (1, 'ENGINEER', 'PARIS',
MA_SEQUENCE.CURRVAL);

INSERT INTO EMP VALUES
(MA_SEQUENCE.NEXTVAL, 'mainak', 'mishra', 'student', 7698,
TO_DATE ('25-09-1995', 'DD-MM-YYYY'), 1169, NULL, '0600000000', 30,'0699009988');
INSERT INTO DEPENDENTS VALUES (2, 'ENGINEER', 'PARIS',
MA_SEQUENCE.CURRVAL);





