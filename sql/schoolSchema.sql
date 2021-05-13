# 1) Create a database for a school. It should include at least three tables - students, classes, enrolments (see https://qa-community.co.uk/~/_/learning/databases-introduction/databases--entity-relationship-diagrams for reference) 
CREATE DATABASE IF NOT EXISTS schooldb;
use schooldb;

CREATE TABLE Students(
	student_id INT NOT NULL AUTO_INCREMENT,
    first_name varchar(20) NOT NULL,
    last_name varchar(20) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(student_id)
);

CREATE TABLE Classes(
	class_id INT NOT NULL AUTO_INCREMENT,
	subject varchar(20) NOT NULL,
    description varchar(20) NOT NULL,
    level INT NOT NULL,
    PRIMARY KEY (class_id)
);

CREATE TABLE Enrollment(
	enrollment_id INT NOT NULL AUTO_INCREMENT,
    fk_student_id INT NOT NULL,
    fk_class_id INT NOT NULL,
    PRIMARY KEY (enrollment_id),
    FOREIGN KEY (fk_student_id) REFERENCES Students(student_id),
    FOREIGN KEY (fk_class_id) REFERENCES Classes(class_id)
);



SHOW TABLES;
# 2) You should insert at least 3 students and classes into your tables. 
INSERT INTO students(first_name, last_name, age) VALUES ('John', 'Mable', 19);
INSERT INTO students(first_name, last_name, age) VALUES ('Mark', 'Sky', 21);
INSERT INTO students(first_name, last_name, age) VALUES ('Julie', 'Poppins', 20);
SELECT * FROM Students;
DESC students;
ALTER TABLE classes
MODIFY description varchar(100) NOT NULL;
INSERT INTO classes(subject, description, level) VALUES ('MATH 1031', 'Freshman Level Algebra', 1);
INSERT INTO classes(subject, description, level) VALUES ('PHYS 3033', 'Junior Level Physics', 3);
INSERT INTO classes(subject, description, level) VALUES ('GOVT 2050', 'Sophmore Level Government', 2);
INSERT INTO classes(subject, description, level) VALUES ('LITR 1031', 'Freshman Level Literature', 1);
INSERT INTO classes(subject, description, level) VALUES ('CSCI 3033', 'Junior Level Computer Science', 3);
INSERT INTO classes(subject, description, level) VALUES ('GOVT 1050', 'Freshman Level Government', 2);

SELECT * FROM classes;

# 3) Each student should be enrolled in at least 2 classes. 
INSERT INTO enrollment(fk_student_id, fk_class_id) VALUES (1, 1);
INSERT INTO enrollment(fk_student_id, fk_class_id) VALUES (1, 6);
INSERT INTO enrollment(fk_student_id, fk_class_id) VALUES (1, 3);
INSERT INTO enrollment(fk_student_id, fk_class_id) VALUES (2, 2);
INSERT INTO enrollment(fk_student_id, fk_class_id) VALUES (2, 5);
INSERT INTO enrollment(fk_student_id, fk_class_id) VALUES (2, 4);
INSERT INTO enrollment(fk_student_id, fk_class_id) VALUES (3, 1);
INSERT INTO enrollment(fk_student_id, fk_class_id) VALUES (3, 2);
INSERT INTO enrollment(fk_student_id, fk_class_id) VALUES (3, 6);

SELECT * FROM enrollment;
DROP TABLE enrollment;

# 4) Use joins to find out which classes they should attend.
-- SELECT s.student_id, s.first_name, s.last_name, c.subject
-- from students s, classes c, enrollment e
-- where e.fk_student_id = s.student_id and e.fk_class_id = c.class_id;

SELECT s.student_id, s.first_name, s.last_name, c.subject
from students s
	INNER JOIN enrollment e ON s.student_id = e.fk_student_id
    INNER JOIN classes c ON e.fk_class_id = c.class_id
