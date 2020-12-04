CREATE TABLE EMPLOYEE
    ( Fname             VARCHAR(15)       NOT NULL,
      Minit             CHAR,
      Lname             VARCHAR(15)       NOT NULL,
      Ssn               CHAR(9)           NOT NULL,
      Bdate             DATE,
      Address           VARCHAR(30),
      Sex               CHAR,
      Salary            DECIMAL(10,2),
      Super_ssn         CHAR(9),
      Dno               INT               NOT NULL,
    CONSTRAINT EMPLOYEE_PK PRIMARY KEY (Ssn),
    CONSTRAINT EMP_SUP_FK FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn),
    CONSTRAINT EMP_DEPT_FK FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber) );

CREATE TABLE DEPARTMENT
    ( Dname             VARCHAR(15)       NOT NULL,
      Dnumber           INT               NOT NULL,
      Mgr_ssn           CHAR(9)           NOT NULL,
      Mgr_start_date    DATE,
    CONSTRAINT DEPARTMENT_PK PRIMARY KEY (Dnumber),
    UNIQUE (Dname),
    CONSTRAINT DEPT_EMP_FK FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn) );

CREATE TABLE DEPT_LOCATIONS
    ( Dnumber           INT               NOT NULL,
      Dlocation         VARCHAR(15)       NOT NULL,
    CONSTRAINT DEPT_LOCATIONS_PK PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT LOC_DEPT_FK FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber) );

CREATE TABLE PROJECT
    ( Pname             VARCHAR(15)       NOT NULL,
      Pnumber           INT               NOT NULL,
      Plocation         VARCHAR(15),
      Dnum              INT               NOT NULL,
    CONSTRAINT PROJECT_PK PRIMARY KEY (Pnumber),
    UNIQUE (Pname),
    CONSTRAINT PROJ_DEPT_FK FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber) );

CREATE TABLE WORKS_ON
    ( Essn              CHAR(9)           NOT NULL,
      Pno               INT               NOT NULL,
      Hours             DECIMAL(3,1)      NOT NULL,
    CONSTRAINT WORKS_ON_PK PRIMARY KEY (Essn, Pno),
    CONSTRAINT WORKS_EMP_FK FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
    CONSTRAINT WORKS_PROJ_FK FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber) );

CREATE TABLE DEPENDENT
    ( Essn              CHAR(9)           NOT NULL,
      Dependent_name    VARCHAR(15)       NOT NULL,
      Sex               CHAR,
      Bdate             DATE,
      Relationship      VARCHAR(8),
    CONSTRAINT DEPENDENT_PK PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT DEPEND_EMP_FK FOREIGN KEY (Essn)REFERENCESEMPLOYEE(Ssn) );