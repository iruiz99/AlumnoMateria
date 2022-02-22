CREATE DATABASE VRuizProgramacionNCapas

CREATE TABLE Materia
(
	IdMateria INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR (100),
	Creditos TINYINT,
	Costo DECIMAL
)

INSERT INTO [Materia]([Nombre],[Creditos],[Costo]) VALUES ('POO',18,4500);
INSERT INTO [Materia]([Nombre],[Creditos],[Costo]) VALUES ('INGLES',18,4500);

SELECT Nombre, Creditos, Costo FROM Materia

CREATE PROCEDURE MateriaAdd
	(
		@Nombre varchar(100),
        @Creditos tinyint,
        @Costo decimal
	)
    AS
 BEGIN
	INSERT INTO Materia 
                (Nombre,
                 Creditos,
                 Costo)
        VALUES (@Nombre,
                @Creditos,
                @costo)
    END

	EXEC MateriaAdd @nombre = 'MATE', @creditos = 12, @Costo = 1234;

	CREATE PROCEDURE MateriaDelete (@IdMateria int)
		AS
			BEGIN
			Delete Materia 
			WHERE IdMateria = @IdMateria;
		END 

	EXEC MateriaDelete @IdMateria = 6;

	CREATE PROCEDURE MateriaUpdate
	(
		@IdMateria int,
		@Nombre varchar(100),
        @Creditos tinyint,
        @Costo decimal
	)
    AS
    BEGIN
        UPDATE Materia
		SET Nombre = @Nombre,
			Creditos = @Creditos,
			Costo = @Costo
	WHERE IdMateria = @IdMateria;
	END
	EXEC MateriaUpdate @IdMateria = 3, @Nombre = 'FISICA', @Creditos = 12, @Costo = 1234 

	CREATE PROCEDURE MateriaGetAll
	AS
		SELECT IdMateria,
				Nombre,
				Creditos,
				Costo
		FROM [Materia]
	GO

	CREATE PROCEDURE MateriaGetById
	@IdMateria int
	AS
		SELECT IdMateria,
				Nombre,
				Creditos,
				Costo
		FROM [Materia]
		WHERE IdMateria = @IdMateria
	GO

CREATE TABLE Usuario
(
	IdUsuario INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR (50),
	ApellidoPaterno VARCHAR (50),
	ApellidoMaterno VARCHAR (50),
	Telefono VARCHAR (20),
	Email VARCHAR (320)
)

INSERT INTO [Usuario] ([Nombre],[ApellidoPaterno],[ApellidoMaterno], [Telefono],[Email]) VALUES ('Ulises','Avila','Ruiz','55 78305672','ulises.ar@gmail.com');
INSERT INTO [Usuario] ([Nombre],[ApellidoPaterno],[ApellidoMaterno], [Telefono],[Email]) VALUES ('Aranzazu','Corona','Hernandez','55 12723438','aranzazu.cher@gmail.com');
INSERT INTO [Usuario] ([Nombre],[ApellidoPaterno],[ApellidoMaterno], [Telefono],[Email]) VALUES ('Cointon','McBeith','Baniard','2725286969','cbaniard0@spiegel.de');
INSERT INTO [Usuario] ([Nombre],[ApellidoPaterno],[ApellidoMaterno], [Telefono],[Email]) VALUES ('Erroll',	'Luckcock',	'Kann','6877009129','ekann1@epa.gov');
INSERT INTO [Usuario] ([Nombre],[ApellidoPaterno],[ApellidoMaterno], [Telefono],[Email]) VALUES ('Johnette','Standfield','Perico','2312960426',	'jperico2@github.com');

SELECT Nombre, ApellidoPaterno, ApellidoMaterno, Telefono, Email FROM Usuario

 CREATE TABLE Venta
 (
	IdVenta INT PRIMARY KEY IDENTITY(1,1),
	Fecha DATETIME,
	Total DECIMAL,
	IdUsuario INT, 
	CONSTRAINT fk_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario),
)

SELECT IdVenta, Fecha, Total, IdUsuario FROM Venta

CREATE TABLE VentaMateria
(
	IdVentaMateria INT PRIMARY KEY IDENTITY(1,1),
	IdVenta INT,
	CONSTRAINT fk_Venta FOREIGN KEY (IdVenta) REFERENCES Venta(IdVenta),
	IdMateria INT,
	CONSTRAINT fk_Materia FOREIGN KEY (IdMateria) REFERENCES Materia(IdMateria),
)

SELECT IdVentaMateria, IdVenta, IdMateria FROM VentaMateria 
SELECT * FROM VentaMateria
SELECT * FROM Venta