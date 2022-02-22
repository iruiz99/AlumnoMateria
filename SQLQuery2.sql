USE [VRuizProgramacionNCapas]
GO

CREATE PROCEDURE VentaAdd
@IdVenta INT OUTPUT,
@Total DECIMAL,
@IdUsuario INT
AS
	INSERT INTO [Venta]
           ([Fecha]
           ,[Total]
           ,[IdUsuario])
     VALUES (GETDATE(), @Total, @IdUsuario)

SET @IdVenta=@@IDENTITY
GO

CREATE PROCEDURE VentaMateriaAdd
	@IdVenta INT,
	@IdMateria INT 
AS
	INSERT INTO [VentaMateria]
	([IdVenta],
	[IdMateria])
     VALUES (@IdVenta, @IdMateria)
GO
