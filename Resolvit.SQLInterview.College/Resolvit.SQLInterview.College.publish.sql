CREATE TABLE [dbo].[Class] (
    [IdClass]     INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (500) NOT NULL,
    [CreatedDate] SMALLDATETIME  NULL,
    PRIMARY KEY CLUSTERED ([IdClass] ASC)
);


GO
PRINT N'Creating [dbo].[Course]...';


GO
CREATE TABLE [dbo].[Course] (
    [IdCourse]   INT          IDENTITY (1, 1) NOT NULL,
    [Comission]  NVARCHAR (1) NOT NULL,
    [CareerYear] INT          NOT NULL,
    [IdClass]    INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([IdCourse] ASC)
);


GO
PRINT N'Creating [dbo].[Student]...';


GO
CREATE TABLE [dbo].[Student] (
    [IdStudent]   INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (500) NOT NULL,
    [BirthDate]   DATE           NULL,
    [CreatedDate] SMALLDATETIME  NULL,
    PRIMARY KEY CLUSTERED ([IdStudent] ASC)
);


GO
PRINT N'Creating [dbo].[StudentCourse]...';


GO
CREATE TABLE [dbo].[StudentCourse] (
    [IdStudent] INT NOT NULL,
    [IdCourse]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([IdStudent] ASC, [IdCourse] ASC)
);


GO
PRINT N'Creating [dbo].[Teacher]...';


GO
CREATE TABLE [dbo].[Teacher] (
    [Id_Teacher] INT            IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (500) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Teacher] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[Class]...';


GO
ALTER TABLE [dbo].[Class]
    ADD DEFAULT (GETDATE()) FOR [CreatedDate];


GO
PRINT N'Creating unnamed constraint on [dbo].[Student]...';


GO
ALTER TABLE [dbo].[Student]
    ADD DEFAULT (GETDATE()) FOR [CreatedDate];


GO
PRINT N'Creating unnamed constraint on [dbo].[Course]...';


GO
ALTER TABLE [dbo].[Course]
    ADD FOREIGN KEY ([IdClass]) REFERENCES [dbo].[Class] ([IdClass]);


GO
PRINT N'Creating unnamed constraint on [dbo].[StudentCourse]...';


GO
ALTER TABLE [dbo].[StudentCourse]
    ADD FOREIGN KEY ([IdStudent]) REFERENCES [dbo].[Student] ([IdStudent]);


GO
PRINT N'Creating unnamed constraint on [dbo].[StudentCourse]...';


GO
ALTER TABLE [dbo].[StudentCourse]
    ADD FOREIGN KEY ([IdCourse]) REFERENCES [dbo].[Course] ([IdCourse]);


GO
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
GO

GO
