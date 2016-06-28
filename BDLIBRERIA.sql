CREATE DATABASE Libreria
GO

USE Libreria
Go

CREATE TABLE Usuario(
Usuario char(5) primary key,
nick varchar(15) unique not null,
Contrasena char(3)not null
)
GO

CREATE TABLE TipoEmpleado(
TipoEmpleadoID int Identity(1,1) not null primary key,
Descripcion varchar(20) not null
)
GO

CREATE TABLE TipoProducto(
TipoProdID int Identity not null primary key,
Codigo varchar(5) Unique not null,
Nombre varchar(30),
Descripcion varchar(60) not null
)
GO

CREATE TABLE TipoDocumento(
TipoDocumentoID int Identity(1,1) not null primary key,
Descripcion varchar(30) not null
)
GO

CREATE TABLE Marca(
MarcaID int Identity not null primary key,
Nombre varchar(30),
)
GO

CREATE TABLE Distrito(
DistritoID int Identity(1,1) not null primary key,
NombreDist varchar(50),
)
GO


CREATE TABLE Empleado(
EmpleadoID int Identity(1,1) not null primary key,
TipoEmpleadoID int not null,
Nombre varchar(50) not null,
ApellidoPaterno varchar(50) not null,
ApellidoMaterno varchar(50) not null,
Sueldo decimal(10,1) not null,
Direccion varchar(150) not null,
Telefono varchar(10) not null,
Usuario char(5) not null unique,
DistritoID int not null,
constraint fk_TipoEmpleado_Empleado foreign key(TipoEmpleadoID) references TipoEmpleado(TipoEmpleadoID),
constraint  fk_Distrito_Empleado foreign key(DistritoID) references Distrito(DistritoID),
constraint  fk_Usuario_Empleado foreign key(Usuario) references Usuario(Usuario)
)
GO


CREATE TABLE Cliente(
ClienteID int Identity(1,1) not null primary key,
Nombre varchar(50) not null,
ApellidoPaterno varchar(50) not null,
ApellidoMaterno varchar(50) not null,
Direccion varchar(150) not null,
Telefono varchar(10) not null,
Usuario char(5) not null unique,
TipoDocumentoID int not null,
DistritoID int not null,
constraint  fk_Distrito_cliente foreign key(DistritoID) references Distrito(DistritoID),
constraint  fk_TipoDocumento_cliente foreign key(TipoDocumentoID) references TipoDocumento(TipoDocumentoID),
constraint  fk_Usuario_Cliente foreign key(Usuario) references Usuario(Usuario)
)
GO

CREATE TABLE Boleta(
BoletaID int Identity(1,1) not null primary key,
EmpleadoID int not null,
ClienteID int not null,
constraint fk_Boleta_cliente
foreign key(EmpleadoID)
references Empleado(EmpleadoID),
constraint  fk_Cliente_Boleta
foreign key(ClienteID)
references Cliente(ClienteID)
)
GO

CREATE TABLE Producto(
ProductoID int Identity(1,1) not null primary key,
Nombre varchar(30) not null,
MarcaID int not null,
Precio decimal(5,2) not null,
Stock int not null,
Foto image,
TipoProdId int not null,
constraint fk_Producto_tipo
foreign key (TipoProdId)
references TipoProducto(TipoProdId),
constraint fk_Producto_Marca
foreign key (MarcaID)
references Marca(MarcaID)
)
GO

CREATE TABLE DetalleBoleta(
ProductoID int not null,
BoletaID int not null,
IGV decimal(3,2) not null,
Cantidad int not null,
Precio decimal(5,2) not null,
total decimal(9,2) not null,
primary key (ProductoID,BoletaID),
constraint fk_detalle_Boleta
foreign key (BoletaID)
references Boleta(BoletaID),
constraint fk_detalle_Producto
foreign key (ProductoID)
references Producto(ProductoID)
)
GO
--Admi
insert into Usuario values ('U0001','Samu','123')
insert into Usuario values ('U0002','Dani','234')
insert into Usuario values ('U0003','CGloria','345')
--clientes
insert into Usuario values ('U0004','pJuan','456')
insert into Usuario values ('U0005','JoseSala','567')
insert into Usuario values ('U0006','SuperMari','678')
insert into Usuario values ('U0007','HurMonica','789')
insert into Usuario values ('U0008','','891')
insert into Usuario values ('U0009','','912')
insert into Usuario values ('U0010','','101')
insert into Usuario values ('U0011','','102')



INSERT INTO TipoEmpleado VALUES ('Administrador')
INSERT INTO TipoEmpleado VALUES ('Administrador')
INSERT INTO TipoEmpleado VALUES ('Vendedor')

Select *  from TipoEmpleado


INSERT INTO Distrito VALUES ('LIMA')
INSERT INTO Distrito VALUES ('VMT')
INSERT INTO Distrito VALUES ('VES')
INSERT INTO Distrito VALUES ('SURCO')
INSERT INTO Distrito VALUES ('SURQUILLO')
INSERT INTO Distrito VALUES ('COMAS')
INSERT INTO Distrito VALUES ('MIRAFLORES')
INSERT INTO Distrito VALUES ('CHORRILLOS')
INSERT INTO Distrito VALUES ('MAGDALENA')

Select *  from Distrito

INSERT INTO TipoProducto VALUES ('TP001','Oficina','asdasdsad')
INSERT INTO TipoProducto VALUES ('TP002','Escolares','asdasdsad')
INSERT INTO TipoProducto VALUES ('TP003','Arte','asdasdsad')
INSERT INTO TipoProducto VALUES ('TP004','Computación','asdasdsad')
INSERT INTO TipoProducto VALUES ('TP005','Electrónica','asdasdsad')
INSERT INTO TipoProducto VALUES ('TP006','Manualidades','asdasdsad')
INSERT INTO TipoProducto VALUES ('TP007','Regalería','asdasdsad')

Select *  from TipoProducto

INSERT INTO Empleado VALUES(1,'EMP01','Samuel','Cusihuallpa','Guillen',100.1,'Av. Simon Bolivar','2833029',1)
INSERT INTO Empleado VALUES(2,'EMP02','Danilo','Zamudio','Arevalo XD!',2000,'Av. Lurin','4257821',3)


insert into Cliente values('C0001','Perez Quispe','Juan','AV.28 de Julio 168')
insert into Cliente values('C0002','Salazar Magariño','Jose','AV.Los Faisanes 180')
insert into Cliente values('C0003','Dominguez Rodriguez','Sabrina','AV.Guardia civil 171')
insert into Cliente values('C0004','Alveda Villar','Mariela','AV.Huylas 120')
insert into Cliente values('C0005','Hurtado Espinoza','Monica','AV.Las Gaviotas 145')
insert into Cliente values('C0006','Rojas Molina','Oscar','AV.Los Manzanales 854')
insert into Cliente values('C0007','Alcala Muñoz','Pedro','Jr.Los Palcos 192')
insert into Cliente values('C0008','Zamudio Arriola','Mario','Jr.13 de Agosto 689')


SELECT * FROM Cliente
