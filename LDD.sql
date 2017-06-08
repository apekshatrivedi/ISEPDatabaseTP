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



