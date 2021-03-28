
CREATE DATABASE school;
go
USE school;
 
go
 CREATE TABLE teachers(
  id int PRIMARY KEY ,
  [name] varchar(50),
  second_name varchar(50),
  salary float
 );
 
 CREATE TABLE students(
 id int PRIMARY KEY ,
 [name] varchar(50),
 second_name varchar(50),
 number_of_index int,
 date_of_birth varchar(20),
 sex varchar(1)
 );
 
 CREATE TABLE type_subjects(
 id int PRIMARY KEY,
 name_subject varchar(50)
 )
 
  CREATE TABLE [subject](
 id int PRIMARY KEY ,
 [name] varchar(50),
 id_type_subject int,
 id_teacher int,
 [year] int,
 semester int,
 FOREIGN KEY (id_teacher) REFERENCES teachers(id),
 FOREIGN KEY (id_type_subject) REFERENCES type_subjects(id)
 );
 
 CREATE TABLE final_grades(
 id_subject int,
 id_student int,
 grade float,
 FOREIGN KEY (id_subject) REFERENCES subject(id),
 FOREIGN KEY (id_student) REFERENCES students(id)
 );
 
 INSERT INTO teachers
VALUES(1,'Ben','Thomas',2500),
(2,'Karen','Parker',2200),
(3,'Bob','Brown',1800),
(4,'Theresa','Thompson',2000);

INSERT INTO type_subjects
VALUES (1,'wykład'),
(2,'laboratorium'),
(3,'ćwiczenia');

INSERT INTO subject
VALUES (1,'Sieci komputerowe',2,1,3,5),
(2,'Sieci komputerowe',1,1,3,6),
(3,'Wstęp do algorytmów',3,2,1,2),
(4,'Opgrogramowanie użytkowe',2,3,2,4);

INSERT INTO students
VALUES(1,'Todd','Kent',12345,'10/05/1982','M'),
(2,'Paul','James',67890,'25/06/1981','M'),
(3,'Denise','Warner',19283,'12/09/1980','K');

INSERT INTO final_grades
VALUES (1,1,4),
(1,2,4.5),
(1,3,5),
(2,1,3),
(2,2,5),
(2,3,4),
(3,1,4),
(3,2,3),
(3,3,3);


