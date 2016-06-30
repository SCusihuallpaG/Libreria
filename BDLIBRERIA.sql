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
Descripcion varchar(20) unique  not null
)
GO


CREATE TABLE TipoDocumento(
TipoDocumentoID int Identity(1,1) not null primary key,
ruc varchar(10) not null
)
GO


CREATE TABLE Distrito(
DistritoID int Identity(1,1) not null primary key,
NombreDist varchar(50),
)
GO

CREATE TABLE Marca(
MarcaID int Identity not null primary key,
Nombre varchar(30)not null,
)
GO



CREATE TABLE TipoProducto(
TipoProdID int Identity not null primary key,
CodigoTipoProducto varchar(5) Unique not null,
Nombre varchar(30),
Descripcion varchar(60) not null,
SubTipoPro int,
constraint  fk_Tipo_producto foreign key(SubTipoPro) references TipoProducto
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
Usuario char(5) not null unique ,
TipoDocumentoID int,
DistritoID int not null,
constraint  fk_Distrito_cliente foreign key(DistritoID) references Distrito(DistritoID),
constraint  fk_TipoDocumento_cliente foreign key(TipoDocumentoID) references TipoDocumento(TipoDocumentoID),
constraint  fk_Usuario_Cliente foreign key(Usuario) references Usuario(Usuario)

)
GO

CREATE TABLE Pedido(
PedidoID int Identity not null primary key,
Fecha datetime not null,
Observacion text ,
ClienteID int not null,
constraint fk_Pedido_Cliente foreign key (ClienteID)references Cliente(ClienteID)
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

CREATE TABLE DetallePedido(
PedidoID int not null,
ProductoID int not null,
IGV decimal(3,2) not null,
Cantidad int not null,
Precio decimal(5,2) not null,
primary key (ProductoID,PedidoID),
constraint fk_DetPedido_Producto foreign key (ProductoID) references Producto(ProductoID),
constraint fk_DetEPedido_Pedido foreign key (PedidoID) references Pedido(PedidoID)
)
GO


--Admi
insert into Usuario values ('U0001','Samu','123')
insert into Usuario values ('U0002','Dani','234')
insert into Usuario values ('U0003','CGloria','345')
--clientes
insert into Usuario values ('U0004','pJuan','456')
insert into Usuario values ('U0005','JoseSala','567')
insert into Usuario values ('U0006','Sabri','102')
insert into Usuario values ('U0007','SuperMari','678')
insert into Usuario values ('U0008','HurMonica','789')
insert into Usuario values ('U0009','Oscarcito','891')
insert into Usuario values ('U0010','Pedrito','912')



Select *  from Usuario

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

INSERT INTO Empleado VALUES(1,'Samuel','Cusihuallpa','Guillen',100.1,'Av. Simon Bolivar','2833029','U0001',1)
INSERT INTO Empleado VALUES(1,'Danilo','Zamudio','Arevalo XD!',2000,'Av. Lurin','4257821','U0002',3)

Select *  from Empleado

INSERT INTO TipoDocumento VALUES ('2345678912')
INSERT INTO TipoDocumento VALUES ('5678923456')
INSERT INTO TipoDocumento VALUES ('7863234912')

Select *  from TipoDocumento

insert into Cliente values('Juan','Perez','Quispe','AV.28 de Julio 168','1235657891','U0004',null,9)
insert into Cliente values('Jose','Salazar','Magariño','AV.Los Faisanes 180','1567567891','U0005',null,2)
insert into Cliente values('Sabrina','Dominguez','Rodriguez','AV.Guardia civil 171','1296367891','U0006',null,3)
insert into Cliente values('Mariela','Alveda','Villar','AV.Huylas 120','1456787891','U0007',1,4)
insert into Cliente values('Monica','Hurtado','Espinoza','AV.Las Gaviotas 145','1963267891','U0008',null,5)
insert into Cliente values('Oscar','Rojas','Molina','AV.Los Manzanales 854','1944567891','U0009',2,6)
insert into Cliente values('Pedro','Alcala','Muñoz','Jr.Los Palcos 192','1951267891','U0010',null,7)



SELECT * FROM Cliente

INSERT INTO Marca VALUES ('ARTESCO')
INSERT INTO Marca VALUES ('ACRIMET')
INSERT INTO Marca VALUES ('ALLEANZA')
INSERT INTO Marca VALUES ('ANGEL')
INSERT INTO Marca VALUES ('ATHLAS')
INSERT INTO Marca VALUES ('ARTI CREATIVO')
INSERT INTO Marca VALUES ('BIC')
INSERT INTO Marca VALUES ('BANTEX')
INSERT INTO Marca VALUES ('BOOMCO')
INSERT INTO Marca VALUES ('BLUDIO')
INSERT INTO Marca VALUES ('BISILQUE')
INSERT INTO Marca VALUES ('BEAUTONE')
INSERT INTO Marca VALUES ('CARL')
INSERT INTO Marca VALUES ('CROSS')
INSERT INTO Marca VALUES ('COQUITO')
INSERT INTO Marca VALUES ('CANON')
INSERT INTO Marca VALUES ('CANSON MI TEINTES')
INSERT INTO Marca VALUES ('CANSON')
INSERT INTO Marca VALUES ('CASIO')
INSERT INTO Marca VALUES ('COLLEGE')
INSERT INTO Marca VALUES ('CHAMEX')
INSERT INTO Marca VALUES ('DAVID')
INSERT INTO Marca VALUES ('DIVOOM')
INSERT INTO Marca VALUES ('DON PAPEL')
INSERT INTO Marca VALUES ('DURACELL')
INSERT INTO Marca VALUES ('DATA OFFICE')
INSERT INTO Marca VALUES ('ELITE')
INSERT INTO Marca VALUES ('ECOFILE')
INSERT INTO Marca VALUES ('EPSON')
INSERT INTO Marca VALUES ('EISEN')
INSERT INTO Marca VALUES ('EVAFLEX')
INSERT INTO Marca VALUES ('FABER CASTELL')
INSERT INTO Marca VALUES ('FISHER PRICE')
INSERT INTO Marca VALUES ('FLYINGDEER')
INSERT INTO Marca VALUES ('GALLO')
INSERT INTO Marca VALUES ('GENIUS')
INSERT INTO Marca VALUES ('GRAPHOS')
INSERT INTO Marca VALUES ('GRAFIP')
INSERT INTO Marca VALUES ('GENIUS')
INSERT INTO Marca VALUES ('HASBRO')
INSERT INTO Marca VALUES ('HALION')
INSERT INTO Marca VALUES ('HASBRO')
INSERT INTO Marca VALUES ('HP')
INSERT INTO Marca VALUES ('IMATION')
INSERT INTO Marca VALUES ('INCOLMA')
INSERT INTO Marca VALUES ('JUSTUS')
INSERT INTO Marca VALUES ('KINGSTON')
INSERT INTO Marca VALUES ('LAYCONSA')
INSERT INTO Marca VALUES ('LASA CORP')
INSERT INTO Marca VALUES ('LOGITECH')
INSERT INTO Marca VALUES ('LEGO')
INSERT INTO Marca VALUES ('LORO')
INSERT INTO Marca VALUES ('LIQUID PAPER')
INSERT INTO Marca VALUES ('MAPED')
INSERT INTO Marca VALUES ('MEMORIS')
INSERT INTO Marca VALUES ('MATTEL')
INSERT INTO Marca VALUES ('MAPED')
INSERT INTO Marca VALUES ('MINERVA')
INSERT INTO Marca VALUES ('MONGOL')
INSERT INTO Marca VALUES ('MEMOREX')
INSERT INTO Marca VALUES ('MATCHBOX')
INSERT INTO Marca VALUES ('MEMORIS')
INSERT INTO Marca VALUES ('NORTON')
INSERT INTO Marca VALUES ('NJOY TECH')
INSERT INTO Marca VALUES ('NORMA')
INSERT INTO Marca VALUES ('NOTE FIX')
INSERT INTO Marca VALUES ('OFFICE PAPER')
INSERT INTO Marca VALUES ('OVE')
INSERT INTO Marca VALUES ('OTROS')
INSERT INTO Marca VALUES ('OXFORD')
INSERT INTO Marca VALUES ('PLAY-DOH')
INSERT INTO Marca VALUES ('PAPER MATE')
INSERT INTO Marca VALUES ('PEGAFAN')
INSERT INTO Marca VALUES ('PELIKAN')
INSERT INTO Marca VALUES ('PAGODA')
INSERT INTO Marca VALUES ('PILOT')
INSERT INTO Marca VALUES ('PEBEO')
INSERT INTO Marca VALUES ('POSCA')
INSERT INTO Marca VALUES ('POST IT')
INSERT INTO Marca VALUES ('PHILIPS')
INSERT INTO Marca VALUES ('PEBEO')
INSERT INTO Marca VALUES ('ROTRING')
INSERT INTO Marca VALUES ('REY')
INSERT INTO Marca VALUES ('RAPID')
INSERT INTO Marca VALUES ('STABILO')
INSERT INTO Marca VALUES ('SCOTCH')
INSERT INTO Marca VALUES ('SHURTAPE')
INSERT INTO Marca VALUES ('SURCO')
INSERT INTO Marca VALUES ('SHURTAPE')
INSERT INTO Marca VALUES ('SHARPIE')
INSERT INTO Marca VALUES ('SKILL')
INSERT INTO Marca VALUES ('SKIT N NOTES')
INSERT INTO Marca VALUES ('STYLE')
INSERT INTO Marca VALUES ('STAEDTLER')
INSERT INTO Marca VALUES ('STAINL STEEL')
INSERT INTO Marca VALUES ('SONY')
INSERT INTO Marca VALUES ('SCOTCH')
INSERT INTO Marca VALUES ('SUPER')
INSERT INTO Marca VALUES ('SOLDIMIX')
INSERT INTO Marca VALUES ('TACHITOS')
INSERT INTO Marca VALUES ('TOSHIBA')
INSERT INTO Marca VALUES ('TRODAT')
INSERT INTO Marca VALUES ('UHU')
INSERT INTO Marca VALUES ('ULTRA COPY')
INSERT INTO Marca VALUES ('UNIBALL')
INSERT INTO Marca VALUES ('UNI')
INSERT INTO Marca VALUES ('VIKINGO')
INSERT INTO Marca VALUES ('VINIBALL')
INSERT INTO Marca VALUES ('VINIFAN')
INSERT INTO Marca VALUES ('VOXSON')
INSERT INTO Marca VALUES ('UNIBELL')
INSERT INTO Marca VALUES ('V&D')
INSERT INTO Marca VALUES ('WARRIOR')
INSERT INTO Marca VALUES ('WEX')
INSERT INTO Marca VALUES ('WINGO')
INSERT INTO Marca VALUES ('WINSOR & NEWTON')
INSERT INTO Marca VALUES ('XEROX')
INSERT INTO Marca VALUES ('YES')
INSERT INTO Marca VALUES ('YOOBAO')
INSERT INTO Marca VALUES ('ZIGZAG')




INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')
INSERT INTO Marca VALUES ('')



SELECT * FROM Marca

INSERT INTO TipoProducto VALUES ('TP001','Oficina','asdasdsad',null)
INSERT INTO TipoProducto VALUES ('TP002','Escolares','asdasdsad',null)
INSERT INTO TipoProducto VALUES ('TP003','Arte','asdasdsad',null)
INSERT INTO TipoProducto VALUES ('TP004','Computación','asdasdsad',null)
INSERT INTO TipoProducto VALUES ('TP005','Electrónica','asdasdsad',null)
INSERT INTO TipoProducto VALUES ('TP006','Manualidades','asdasdsad',2)
INSERT INTO TipoProducto VALUES ('TP007','Regalería','asdasdsad',null)

Select *  from TipoProducto


--Boleta
INSERT INTO Pedido VALUES ('','')

SELECT * FROM Pedido

--Producto

INSERT INTO Producto VALUES ('','','','','','')

SELECT * FROM Producto

--DetalleBoleta
INSERT INTO DetallePedido VALUES ('','','','','','')

SELECT * FROM DetallePedido

