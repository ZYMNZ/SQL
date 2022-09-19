CREATE TABLE DEPARTMENT
( DEPT_ID CHAR(6) CONSTRAINT DEPARTMENT_DEPT_ID_PK PRIMARY KEY,
DEPT_NAME VARCHAR(30) CONSTRAINT DEPARTMENT_DEPT_NAME NOT NULL,
DEPT_LOCATION VARCHAR(25) NOT NULL,
PROF_ID CHAR(9) UNIQUE);

CREATE TABLE PROFESSOR
( PROF_ID CHAR(9) CONSTRAINT PROFESSOR_PROF_ID_PK PRIMARY KEY,
FNAME VARCHAR(25) NOT NULL,
LNAME VARCHAR(25) NOT NULL,
DEPT_ID CHAR(6), 
CONSTRAINT PROFESSSOR_DEPT_ID_FK FOREIGN KEY(DEPT_ID) REFERENCES DEPARTMENT ON DELETE SET NULL);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT DEPARTMENT_PROF_ID_FK FOREIGN KEY(PROF_ID) REFERENCES PROFESSOR ON DELETE SET NULL;

CREATE TABLE COURSE 
(COURSE_ID CHAR(6) CONSTRAINT COURSE_COURSE_ID_PK PRIMARY KEY,
COURSE_TITLE VARCHAR(35) NOT NULL UNIQUE,
PROF_ID CHAR(9),
DEPT_ID CHAR(6),
CONSTRAINT COURSE_PROF_ID_FK FOREIGN KEY(PROF_ID) REFERENCES PROFESSOR ON DELETE SET NULL,
CONSTRAINT COURSE_DEPT_ID_FK FOREIGN KEY(DEPT_ID) REFERENCES DEPARTMENT ON DELETE CASCADE);

CREATE TABLE PROF_SKILLS
(PROF_ID CHAR(9),
SKILL VARCHAR(30),
PRIMARY KEY(PROF_ID, SKILL),
CONSTRAINT SKILLS_PROF_ID_FK FOREIGN KEY(PROF_ID) REFERENCES PROFESSOR ON DELETE CASCADE);

CREATE TABLE STUDENT
( STUDENT_ID CHAR(9) CONSTRAINT STUDENT_STUDENT_ID_PK PRIMARY KEY,
FNAME VARCHAR(25) NOT NULL,
LNAME VARCHAR(25) NOT NULL,
DOB DATE);

CREATE TABLE ENROLL
( STUDENT_ID CHAR(9) REFERENCES STUDENT,
COURSE_ID CHAR(6) REFERENCES COURSE,
PRIMARY KEY(STUDENT_ID, COURSE_ID),
GRADE NUMERIC (5,2) CHECK (GRADE BETWEEN 0 AND 100));

INSERT INTO DEPARTMENT VALUES('CS100', 'COMPUTER SC.', 'D', NULL);
INSERT INTO DEPARTMENT VALUES('HR100', 'HR DEPARTMENT', 'H', NULL);
INSERT INTO DEPARTMENT VALUES('AC100', 'ACADEMIC DEPARTMENT', 'N', NULL);

INSERT INTO PROFESSOR VALUES('12345', 'ALEX', 'SMITH', 'CS100');
INSERT INTO PROFESSOR VALUES('12346', 'NAGAT', 'DARWEL', 'CS100');
INSERT INTO PROFESSOR VALUES('12375', 'ALI', 'SAIID', 'HR100');
INSERT INTO PROFESSOR VALUES('12348', 'JOHN', 'SMITH', 'HR100');

DELETE DEPARTMENT
WHERE DEPT_ID = 'CS100';

INSERT INTO COURSE VALUES('DB100', 'DATABASE', '12346', 'CS100');
INSERT INTO COURSE VALUES('DB100', 'ADV. DATABASE', '12346', 'CS100');

INSERT INTO STUDENT VALUES('1', 'AAAA', 'BBBB', NULL);
INSERT INTO STUDENT VALUES('2', 'AAAA', 'BBBB', NULL);
INSERT INTO STUDENT VALUES('3', 'AAAA', 'BBBB', NULL);
INSERT INTO STUDENT VALUES('4', 'AAAA', 'BBBB', NULL);
INSERT INTO STUDENT VALUES('5', 'AAAA', 'BBBB', NULL);
INSERT INTO STUDENT VALUES('6', 'AAAA', 'BBBB', NULL);

INSERT INTO ENROLL VALUES('1', 'DB100', 66.3);
INSERT INTO ENROLL VALUES('1', 'DB200', 66.3);
INSERT INTO ENROLL VALUES('2', 'DB100', 66.3);
INSERT INTO ENROLL VALUES('2', 'DB200', 66.3);



--- Some more class notes --

insert into copy_student name
select fname, lname from student


update student
set lname = 'alex'
where student_id = '100'

delete course
where course_id = 'db100'


insert into enroll values ('100', 'DB100', 78)
insert into enroll values ('200', 'DB100', 78.5)
insert into enroll values ('300', 'DB100', 80)
