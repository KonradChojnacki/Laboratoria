CREATE TABLE students(
first_name varchar(50),
last_name varchar(50),
dob date,
pesel varchar(11) PRIMARY KEY
);



CREATE TABLE subjects(
id_subject varchar(4) PRIMARY KEY,
name varchar(50),
type varchar(6),
sylabus bytea
);

CREATE TABLE subjects_students(
pesel varchar(11),
id_subject varchar(4),
grade varchar(1),
year varchar(4),
FOREIGN KEY (pesel) REFERENCES students(pesel),
FOREIGN KEY (id_subject) REFERENCES subjects(id_subject)
);

CREATE TABLE old_grades(
pesel varchar(9),
id_subject varchar(4),
old_grade varchar(1),
year varchar(4),
FOREIGN KEY (pesel) REFERENCES students(pesel),
FOREIGN KEY (id_subject) REFERENCES subjects(id_subject)
);

CREATE INDEX i_pesel
ON students(pesel);

CREATE OR REPLACE FUNCTION subjects_students_UPDATE ()
  RETURNS trigger AS
$BODY$
BEGIN
	IF NEW.grade <> OLD.grade THEN
		 INSERT INTO old_grades
		 VALUES(old.pesel,old.id_subject,old.grade,old.year);
	END IF;
	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER subjects_students_UPDATE
  BEFORE UPDATE
  ON subjects_students
  FOR EACH ROW
  EXECUTE PROCEDURE subjects_students_UPDATE()