CREATE TABLE 
IF NOT EXISTS batches(
 batch_id INT PRIMARY KEY,
 batch_name VARCHAR(20) NOT NULL,
 course_name VARCHAR(50) NOT NULL,
 timing TIME NOT NULL);
 
CREATE TABLE students(
 student_id INT PRIMARY KEY,
 student_name VARCHAR(100) NOT NULL,
 student_mail VARCHAR(100) NOT NULL,
 student_phone INT(10) NOT NULL,
 student_password VARCHAR(100) NOT NULL,
 batch_id INT NOT NULL,
 FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
 );
 
CREATE TABLE mentors(
mentor_id INT PRIMARY KEY,
mentor_name VARCHAR(100) NOT NULL,
mentor_mail VARCHAR(100)NOT NULL,
mentor_phone VARCHAR(10) NOT NULL,
mentor_password VARCHAR(100) NOT NULL,
 batch_id INT NOT NULL,
 FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
); 

CREATE TABLE classes(
class_id INT PRIMARY KEY,
class_date DATE ,
meeting_link VARCHAR(1000),
class_topics TEXT NOT NULL,
 batch_id INT NOT NULL,
 FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
 mentor_id INT ,
 FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id)
);

CREATE TABLE feedbacks(
feedback_id INT PRIMARY KEY,
session_feedback INT NOT NULL,
mentor_feedback INT NOT NULL,
session_desc TEXT NOT NULL,
 class_id INT ,
 FOREIGN KEY (class_id) REFERENCES classes(class_id),
 mentor_id INT ,
 FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id),
 student_id INT ,
 FOREIGN KEY (student_id) REFERENCES students(student_id)
);


CREATE TABLE tasks(
task_id INT PRIMARY KEY,
task_descp text NOT NULL,
task_link VARCHAR(1000) NOT NULL,
 class_id INT ,
 FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

DESCRIBE queries;

CREATE TABLE marks(
mark_id INT PRIMARY KEY,
task_total_mark INT DEFAULT 10,
scored_mark INT NOT NULL,
 task_id INT ,
 FOREIGN KEY (task_id) REFERENCES tasks(task_id),
 student_id INT ,
 FOREIGN KEY (student_id) REFERENCES students(student_id),
  mentor_id INT ,
 FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id)
);

CREATE TABLE queries(
query_id INT PRIMARY KEY,
query_related VARCHAR(100),
query_desc text NOT NULL,
query_solution text,
 student_id INT ,
 FOREIGN KEY (student_id) REFERENCES students(student_id),
  mentor_id INT ,
 FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id)
);


