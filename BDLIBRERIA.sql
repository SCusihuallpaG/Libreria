CREATE DATABASE Libreria
GO

USE Libreria
GO

CREATE TABLE TipoEmpleado(
TipoEmpleadoID int Identity(1,1) not null primary key,
Descripcion varchar(20) not null,
Contrasena varchar(20) not null
)
GO

CREATE TABLE Empleado(
EmpleadoID int Identity(1,1) not null primary key,
TipoEmpleadoID int not null,
CodigoEmpleado varchar(20) unique not null,
Nombre varchar(50) not null,
ApellidoPaterno varchar(50) not null,
ApellidoMaterno varchar(50) not null,
Sueldo decimal(10,1) not null,
Direccion varchar(150) not null,
Telefono varchar(10) not null,
DistritoID int not null
)
GO

CREATE TABLE Distrito(
DistritoID int Identity(1,1) not null primary key,
NombreDist varchar(50),
)
GO

CREATE TABLE Cliente(
ClienteID int Identity(1,1) not null primary key,
Nombre varchar(50) not null,
ApellidoPaterno varchar(50) not null,
ApellidoMaterno varchar(50) not null,
Direccion varchar(150) not null,
Telefono varchar(10) not null,
TipoDocumentoID int not null,
DistritoID int not null
)
GO

CREATE TABLE TipoDocumento(
TipoDocumentoID int Identity(1,1) not null primary key,
Descripcion varchar(30) not null
)
GO

CREATE TABLE Boleta(
BoletaID int Identity(1,1) not null primary key,
EmpleadoID int not null,
ClienteID int not null
)
GO

CREATE TABLE Producto(
ProductoID int Identity(1,1) not null primary key,
Nombre varchar(30) not null,
MarcaID int not null,
Precio decimal(5,2) not null,
Stock int not null,
Foto image,
TipoProdId int not null
)
GO

CREATE TABLE DetalleBoleta(
ProductoID int not null,
BoletaID int not null,
IGV decimal(3,2) not null,
Cantidad int not null,
Precio decimal(5,2) not null,
total decimal(9,2) not null,
primary key (ProductoID,BoletaID)
)
GO

CREATE TABLE TipoProducto(
TipoProdID int Identity not null primary key,
Codigo varchar(5) Unique not null,
Nombre varchar(30),
Descripcion varchar(60) not null
)
GO

CREATE TABLE Marca(
MarcaID int Identity not null primary key,
Nombre varchar(30),
)
GO

ALTER TABLE Boleta
add constraint fk_Boleta_cliente
foreign key(EmpleadoID)
references Empleado(EmpleadoID)
GO
ALTER TABLE Empleado
add constraint fk_TipoEmpleado_Empleado
foreign key(TipoEmpleadoID)
references TipoEmpleado(TipoEmpleadoID)
GO

ALTER TABLE Cliente
add constraint  fk_Distrito_cliente
foreign key(DistritoID)
references Distrito(DistritoID)
GO

ALTER TABLE Cliente
add constraint  fk_TipoDocumento_cliente
foreign key(TipoDocumentoID)
references TipoDocumento(TipoDocumentoID)
GO

ALTER TABLE Empleado
add constraint  fk_Distrito_Empleado
foreign key(DistritoID)
references Distrito(DistritoID)
GO

ALTER TABLE Boleta
add constraint  fk_Cliente_Boleta
foreign key(ClienteID)
references Cliente(ClienteID)
GO

ALTER TABLE Producto
add constraint fk_Producto_tipo
foreign key (TipoProdId)
references TipoProducto(TipoProdId)
GO

ALTER TABLE Producto
add constraint fk_Producto_Marca
foreign key (MarcaID)
references Marca(MarcaID)
GO


ALTER TABLE DetalleBoleta
add constraint fk_detalle_Boleta
foreign key (BoletaID)
references Boleta(BoletaID)
GO

ALTER TABLE DetalleBoleta
add constraint fk_detalle_Producto
foreign key (ProductoID)
references Producto(ProductoID)
GO

INSERT INTO TipoEmpleado VALUES ('Administrador','123456789')
GO
INSERT INTO TipoEmpleado VALUES ('Vendedor','123456')
GO
INSERT INTO Distrito VALUES ('LIMA')
GO
INSERT INTO Distrito VALUES ('VMT')
GO
INSERT INTO Distrito VALUES ('VES')
GO
INSERT INTO Distrito VALUES ('SURCO')
GO
INSERT INTO Distrito VALUES ('SURQUILLO')
GO
INSERT INTO Distrito VALUES ('COMAS')
GO
INSERT INTO Distrito VALUES ('MIRAFLORES')
GO
INSERT INTO Distrito VALUES ('CHORRILLOS')
GO
INSERT INTO Distrito VALUES ('MAGDALENA')
GO

INSERT INTO TipoProducto VALUES ('TP001','Oficina','asdasdsad')
GO
INSERT INTO TipoProducto VALUES ('TP002','Escolares','asdasdsad')
GO
INSERT INTO TipoProducto VALUES ('TP003','Arte','asdasdsad')
GO
INSERT INTO TipoProducto VALUES ('TP004','Computación','asdasdsad')
GO
INSERT INTO TipoProducto VALUES ('TP005','Electrónica','asdasdsad')
GO
INSERT INTO TipoProducto VALUES ('TP006','Manualidades','asdasdsad')
GO
INSERT INTO TipoProducto VALUES ('TP007','Regalería','asdasdsad')
GO

INSERT INTO Empleado VALUES(1,'EMP01','Samuel','Cusihuallpa','Guillen',100.1,'Av. Simon Bolivar','2833029',1)
GO
INSERT INTO Empleado VALUES(2,'EMP02','Danilo','Zamudio','Arevalo XD!',2000,'Av. Lurin','4257821',3)
GO

---PROCEDIMIENTOS ALMACENADOS

USE Libreria
GO 

CREATE PROCEDURE [dbo].[InsertarBoleta]
@EMPLEADOID INT,
@CLIENTEID INT
AS
INSERT INTO Boleta(EmpleadoID,ClienteID)
VALUES(@EMPLEADOID,@CLIENTEID)
return @@identity
GO

CREATE PROCEDURE [dbo].[InsertarDistrito]
@NOMBRE varchar(50)
AS
INSERT INTO Distrito(NombreDist)
VALUES(@NOMBRE)
GO

CREATE PROCEDURE [dbo].[InsertarEmpleado]
@TIPOEMPLEADOID INT,
@CODIGOEMPLEADO VARCHAR(5),
@NOMBRE VARCHAR(50),
@APELLIDOPATERNO VARCHAR(50),
@APELLIDOMATERNO VARCHAR(50),
@SUELDO DECIMAL(10,1),
@DIRECCION VARCHAR(150),
@TELEFONO VARCHAR(10),
@DISTRITOID INT
AS
INSERT INTO Empleado(TipoEmpleadoID,CodigoEmpleado,Nombre,ApellidoPaterno,Sueldo,ApellidoMaterno,direccion,telefono,DistritoID)
VALUES(@TIPOEMPLEADOID,@CODIGOEMPLEADO,@NOMBRE,@APELLIDOPATERNO,@SUELDO,@APELLIDOMATERNO,@DIRECCION,@TELEFONO,@DISTRITOID)
GO

CREATE PROCEDURE [dbo].[InsertarCliente]
@NOMBRE VARCHAR(50),
@APELLIDOPATERNO VARCHAR(50),
@APELLIDOMATERNO VARCHAR(50),
@DIRECCION VARCHAR(150),
@TELEFONO VARCHAR(10),
@TIPODOCUMENTOID CHAR(11),
@DISTRITOID INT
AS
INSERT INTO Cliente(Nombre,ApellidoPaterno,ApellidoMaterno,Direccion,Telefono,TipoDocumentoID,DistritoID)
VALUES(@NOMBRE,@APELLIDOPATERNO,@APELLIDOMATERNO,@DIRECCION,@TELEFONO,@TIPODOCUMENTOID,@DISTRITOID)
GO

CREATE PROCEDURE [dbo].[InsertarTipoProducto]
@CODIGO VARCHAR(5),
@NOMBRE VARCHAR(30),
@DECRIPCION VARCHAR(60)
AS
INSERT INTO TipoProducto(Codigo,Nombre,Descripcion)
VALUES(@CODIGO,@NOMBRE,@DECRIPCION)
GO

CREATE PROCEDURE [dbo].[InsertarProducto]
@NOMBRE VARCHAR(30),
@MARCAID VARCHAR(30),
@PRECIO DECIMAL(5,2),
@STOCK INT,
@FOTO IMAGE,
@TIPOPRODID INT
AS
INSERT INTO Producto(Nombre,MarcaID,Precio,Stock,Foto,TipoProdID)
VALUES(@NOMBRE,@MARCAID,@PRECIO,@STOCK,@FOTO,@TIPOPRODID)
GO

CREATE PROCEDURE [dbo].[InsertarDetalleBoleta]
@PRODUCTOID INT,
@BOLETAID INT,
@IGV DECIMAL(3,2),
@CANTIDAD INT,
@PRECIO DECIMAL(5,2),
@TOTAL DECIMAL(9,2)
AS
INSERT INTO DetalleBoleta(ProductoID,BoletaID,IGV,Cantidad,Precio,total)
VALUES(@PRODUCTOID,@BOLETAID,@IGV,@CANTIDAD,@PRECIO,@TOTAL)
GO

CREATE PROCEDURE [dbo].[ListarEmpleados]
AS
SELECT EmpleadoID [ID],
E.TipoEmpleadoID,''[TipoEmpleadoID],
T.Descripcion [TipoEmpleado],
ISNULL(E.CodigoEmpleado,'')[Codigo],
ISNULL(E.Nombre ,'')[Nombre],
ISNULL(ApellidoPaterno,'')[ApellidoPaterno],
ISNULL(ApellidoMaterno,'')[ApellidoMaterno],
ISNULL(Sueldo,'')[Sueldo],
ISNULL(Direccion,'')[Direccion],
ISNULL(Telefono,'')[Telefono],
E.DistritoID,''[DistritoID],
D.NombreDist [Distrito]
FROM Empleado E INNER JOIN Distrito D
ON E.DistritoID=D.DistritoID
INNER JOIN TipoEmpleado T
ON E.TipoEmpleadoID=T.TipoEmpleadoID
GO

CREATE PROCEDURE [dbo].[ListarCliente]
AS 
SELECT ClienteID [ID],
ISNULL(C.Nombre,'')[Nombre],
ISNULL(ApellidoPaterno,'')[ApellidoPaterno],
ISNULL(ApellidoMaterno,'')[ApellidoMaterno],
ISNULL(Direccion,'')[Direccion],
ISNULL(Telefono,'')[Telefono],
C.TipoDocumentoID,''[TipoDocumentoID],
T.Descripcion [TipoDocumento],
C.DistritoID,''[DictritoID],
D.NombreDist [Distrito]
FROM Cliente C INNER JOIN Distrito D
ON C.DistritoID=D.DistritoID
INNER JOIN TipoDocumento T
ON C.TipoDocumentoID=T.TipoDocumentoID
GO

CREATE PROCEDURE [dbo].[ListarProducto]
AS 
SELECT ProductoID [ID],
ISNULL(P.Nombre,'')[Nombre],
P.MarcaID,''[MarcaID],
M.Nombre[Marca],
ISNULL(Precio,'')[Precio],
ISNULL(Stock,'')[Stock],
Foto,
P.TipoProdID,''[TipoProdID],
T.Descripcion[TipoProducto]
FROM Producto P INNER JOIN TipoProducto T
ON P.TipoProdId=T.TipoProdId
INNER JOIN Marca M
ON P.MarcaID=M.MarcaID
GO

CREATE PROCEDURE [dbo].[ListarTipoProducto]
AS  
SELECT  TipoProdID [ID],
ISNULL(Codigo,'')[Codigo],
ISNULL(Nombre,'')[Nombre],
ISNULL(Descripcion,'')[Descripcion]
FROM TipoProducto
GO

CREATE PROCEDURE [dbo].[ListarDistrito]
AS  
SELECT DistritoID [ID],
ISNULL(NombreDist,'')[NombreDist]
FROM  Distrito
GO
CREATE PROCEDURE [dbo].[ListarTipoEmpleado]
AS  
SELECT TipoEmpleadoID [ID],
ISNULL(Descripcion,'')[Descripcion],
ISNULL(Contrasena,'')[Contrasena]
FROM  TipoEmpleado
GO

CREATE PROCEDURE [dbo].[login]
@Descripcion VARCHAR(20),
@Contrasena VARCHAR(20)
AS
SELECT * FROM TipoEmpleado 
WHERE Descripcion =@Descripcion and Contrasena =@Contrasena 
GO

CREATE PROCEDURE [dbo].[ModificarProducto]
@ID INT,
@NOMBRE VARCHAR(30),
@MARCAID VARCHAR(30),
@PRECIO DECIMAL(5,2),
@STOCK INT,
@FOTO IMAGE,
@TIPOPRODID INT
AS
UPDATE Producto SET Nombre=@NOMBRE,
MarcaID=@MARCAID,
Precio=@PRECIO,
Stock=@STOCK,
Foto=@FOTO,
TipoProdId=@TIPOPRODID
WHERE ProductoID=@ID
GO

CREATE PROCEDURE [dbo].[ModificarEmpleado]
@ID INT,
@TIPOEMPLEADOID INT,
@CODIGOEMPLEADO VARCHAR(5),
@NOMBRE VARCHAR(50),
@APELLIDOPATERNO VARCHAR(50),
@APELLIDOMATERNO VARCHAR(50),
@SUELDO DECIMAL(10,1),
@DIRECCION VARCHAR(150),
@TELEFONO VARCHAR(10),
@DISTRITOID INT
AS
UPDATE Empleado SET TipoEmpleadoID=@TIPOEMPLEADOID,
CodigoEmpleado=@CODIGOEMPLEADO,
Nombre=@NOMBRE,
ApellidoPaterno=@APELLIDOPATERNO,
ApellidoMaterno=@APELLIDOMATERNO,
Sueldo = @SUELDO,
Direccion=@DIRECCION,
Telefono=@TELEFONO,
DistritoID=@DISTRITOID
WHERE EmpleadoID=@ID
GO
--************************************************************************
CREATE PROCEDURE [dbo].[ModificarDistrito]
@ID INT,
@NOMBRE VARCHAR(50)
AS
UPDATE Distrito SET NombreDist = @NOMBRE
WHERE DistritoID = @ID
GO

--************************************************************************

CREATE PROCEDURE [dbo].[ModificarCliente]
@ID INT,
@NOMBRE VARCHAR(50),
@APELLIDOPATERNO VARCHAR(50),
@APELLIDOMATERNO VARCHAR(50),
@DIRECCION VARCHAR(150),
@TELEFONO VARCHAR(10),
@TIPODOCUMENTOID CHAR(11),
@DISTRITOID INT
AS
UPDATE Cliente SET Nombre=@NOMBRE,
ApellidoPaterno=@APELLIDOPATERNO,
ApellidoMaterno=@APELLIDOMATERNO,
Direccion=@DIRECCION,
Telefono=@TELEFONO,
TipoDocumentoID=@TIPODOCUMENTOID,
DistritoID=@DISTRITOID
WHERE ClienteID=@ID
GO
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[EliminarEmpleado]
@ID INT
AS
DELETE FROM Empleado
WHERE EmpleadoID = @ID
GO
------------------------------------------
CREATE PROCEDURE [dbo].[EliminarCliente]
@ID INT
AS
DELETE FROM Cliente
WHERE ClienteID = @ID

GO
------------------------------------------
CREATE PROCEDURE [dbo].[EliminarProducto]
@ID INT
AS
DELETE FROM Producto
WHERE ProductoID = @ID
GO
------------------------------------------

CREATE PROCEDURE [dbo].[EliminarDistrito]
@ID INT
AS 
DELETE FROM Distrito
WHERE DistritoID = @ID
GO
------------------------------------------
