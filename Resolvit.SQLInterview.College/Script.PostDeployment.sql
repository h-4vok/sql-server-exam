INSERT Teacher (Name)
VALUES
	('James Kirk'), ('Jean-Luque Picard'), ('Christopher Pike'), ('Philippa Georgiou')

INSERT Student (Name, BirthDate)
VALUES
	('John', NULL), ('Marie', '1999-01-05'), ('Joe', NULL), ('Another Joe', NULL)

INSERT Class (Name)
VALUES
	('Math'), ('Spanish'), ('Physics'), ('Startship Navigation')

INSERT Course (Comission, CareerYear, IdClass)
SELECT
	Comission = auxcomission.Comission,
	CareerYear = auxyear.CareerYear,
	IdClass = auxclass.IdClass
FROM (SELECT Comission = 'A'  UNION ALL SELECT Comission = 'B' UNION ALL SELECT Comission = 'C') auxcomission
CROSS JOIN (
	SELECT CareerYear = 1 UNION ALL 
	SELECT CareerYear = 2 UNION ALL 
	SELECT CareerYear = 3 UNION ALL 
	SELECT CareerYear = 4) auxyear
CROSS JOIN (SELECT IdClass FROM Class) auxclass