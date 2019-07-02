CREATE TABLE StudentCourse
(
	IdStudent INT NOT NULL,
	IdCourse INT NOT NULL,

	PRIMARY KEY (IdStudent, IdCourse),
	FOREIGN KEY (IdStudent) REFERENCES Student,
	FOREIGN KEY (IdCourse) REFERENCES Course
)
