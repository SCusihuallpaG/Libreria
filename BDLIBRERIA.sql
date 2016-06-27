CREATE DATABASE Libreria
GO

USE Libreria
GO

CREATE TABLE Empleado(
EmpleadoID int Identity(1,1) not null primary key,
CodigoEmpleado varchar(20) unique not null,
Clave varchar(20) not null, 
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
Usuario varchar(20)unique not null,
Clave varchar(20) not null,
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

INSERT INTO Marca VALUES ('JUSTUS')
GO
INSERT INTO Marca VALUES ('LORO')
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

INSERT INTO Empleado VALUES('EMP01','123456','Samuel','Cusihuallpa','Guillen',3000,'Av. Simon Bolivar','2833029',1)
GO
INSERT INTO Empleado VALUES('EMP02','123','Danilo','Zamudio','XD!',2000,'Av. Lurin','4257821',3)
GO

