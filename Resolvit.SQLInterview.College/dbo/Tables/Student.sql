﻿CREATE TABLE Student (
	IdStudent INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Name NVARCHAR(500) NOT NULL,
	BirthDate DATE,
	CreatedDate SMALLDATETIME DEFAULT(GETDATE())
)