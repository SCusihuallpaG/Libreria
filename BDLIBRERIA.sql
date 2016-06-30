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
MarcaID int Identity(1,1) not null primary key,
Nombre varchar(30)not null,
)
GO



CREATE TABLE TipoProducto(
TipoProdID int Identity not null primary key,
Nombre varchar(30),

)
GO



CREATE TABLE Categoria(
CategoriaID char(3) not null primary key,
Nombre varchar(30) not null
)
GO

create table SubCategoria(
SubCatID char(5) not null primary key,
Nombre varchar(30) not null,
CategoriaID char(3)
constraint fk_SubCategoria_Categoria foreign key(CategoriaID ) references Categoria(CategoriaID ),
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
constraint fk_Empleado_TipoEmpleado foreign key(TipoEmpleadoID) references TipoEmpleado(TipoEmpleadoID),
constraint  fk_Empleado_Distrito foreign key(DistritoID) references Distrito(DistritoID),
constraint  fk_Empleado_Usuario foreign key(Usuario) references Usuario(Usuario)
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
constraint  fk_cliente_Distrito foreign key(DistritoID) references Distrito(DistritoID),
constraint  fk_cliente_TipoDocumento foreign key(TipoDocumentoID) references TipoDocumento(TipoDocumentoID),
constraint  fk_Cliente_Usuario foreign key(Usuario) references Usuario(Usuario)

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
ProductoID int Identity(100,3) not null primary key,
Nombre varchar(30) not null,
descripcion varchar(30),
MarcaID int not null,
color varchar(15),
tamaño varchar(10),
UNIDMedida varchar(15),
Precio decimal(5,2) not null,
Stock int not null,
Foto bit,
TipoProdId int not null,
SubCatID char(5)not null,
constraint fk_Producto_tipo foreign key (TipoProdId)references TipoProducto(TipoProdId),
constraint fk_Producto_Marca foreign key (MarcaID)references Marca(MarcaID),
constraint fk_Producto_SubCategoria foreign key(SubCatID ) references SubCategoria(SubCatID ),

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
GO

Select *  from Usuario
GO
INSERT INTO TipoEmpleado VALUES ('Administrador')
INSERT INTO TipoEmpleado VALUES ('Vendedor')
GO
Select *  from TipoEmpleado
GO

INSERT INTO Distrito VALUES ('LIMA')
INSERT INTO Distrito VALUES ('VMT')
INSERT INTO Distrito VALUES ('VES')
INSERT INTO Distrito VALUES ('SURCO')
INSERT INTO Distrito VALUES ('SURQUILLO')
INSERT INTO Distrito VALUES ('COMAS')
INSERT INTO Distrito VALUES ('MIRAFLORES')
INSERT INTO Distrito VALUES ('CHORRILLOS')
INSERT INTO Distrito VALUES ('MAGDALENA')
GO

Select *  from Distrito
GO

INSERT INTO Empleado VALUES(1,'Samuel','Cusihuallpa','Guillen',100.1,'Av. Simon Bolivar','2833029','U0001',1)
INSERT INTO Empleado VALUES(1,'Danilo','Zamudio','Arevalo XD!',2000,'Av. Lurin','4257821','U0002',3)
GO

Select *  from Empleado
GO

INSERT INTO TipoDocumento VALUES ('2345678912')
INSERT INTO TipoDocumento VALUES ('5678923456')
INSERT INTO TipoDocumento VALUES ('7863234912')
GO

Select *  from TipoDocumento
GO

insert into Cliente values('Juan','Perez','Quispe','AV.28 de Julio 168','1235657891','U0004',null,9)
insert into Cliente values('Jose','Salazar','Magariño','AV.Los Faisanes 180','1567567891','U0005',null,2)
insert into Cliente values('Sabrina','Dominguez','Rodriguez','AV.Guardia civil 171','1296367891','U0006',null,3)
insert into Cliente values('Mariela','Alveda','Villar','AV.Huylas 120','1456787891','U0007',1,4)
insert into Cliente values('Monica','Hurtado','Espinoza','AV.Las Gaviotas 145','1963267891','U0008',null,5)
insert into Cliente values('Oscar','Rojas','Molina','AV.Los Manzanales 854','1944567891','U0009',2,6)
insert into Cliente values('Pedro','Alcala','Muñoz','Jr.Los Palcos 192','1951267891','U0010',null,7)
GO

SELECT * FROM Cliente
GO


INSERT INTO Marca VALUES ('ARTESCO')
INSERT INTO Marca VALUES ('ACRIMET')
INSERT INTO Marca VALUES ('ALLEANZA')
INSERT INTO Marca VALUES ('ANGEL')
INSERT INTO Marca VALUES ('ATHLAS')
INSERT INTO Marca VALUES ('ARTI CREATIVO')
INSERT INTO Marca VALUES ('ALPHA')
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
INSERT INTO Marca VALUES ('LEITZ')
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
INSERT INTO Marca VALUES ('NORIS')
INSERT INTO Marca VALUES ('NORMA')
INSERT INTO Marca VALUES ('NOTE FIX')
INSERT INTO Marca VALUES ('OFFICE PAPER')
INSERT INTO Marca VALUES ('OVE')
INSERT INTO Marca VALUES ('OLFA')
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
Go

SELECT * FROM Marca
GO

INSERT INTO Categoria VALUES ('C01','Artículos de Oficina')
INSERT INTO Categoria VALUES ('C02','Atículos Escolares')
INSERT INTO Categoria VALUES ('C03','Computación y Electronica')
INSERT INTO Categoria VALUES ('C04','Cuadernos y Texto')
INSERT INTO Categoria VALUES ('C05','Juguetes e Infantil')
INSERT INTO Categoria VALUES ('C06','Papeleria')
INSERT INTO Categoria VALUES ('C07','Arte y Diseño')

GO

select * from Categoria 
Go

INSERT INTO SubCategoria VALUES ('SC001','Artículos de Escritorio','C01')
INSERT INTO SubCategoria VALUES ('SC002','Boligrafos Finos','C01')
INSERT INTO SubCategoria VALUES ('SC003','Aderentes','C01')
INSERT INTO SubCategoria VALUES ('SC004','Formatos Administrativos y contables','C01')
INSERT INTO SubCategoria VALUES ('SC005','sistema de Archivo','C01')
INSERT INTO SubCategoria VALUES ('SC006','Artículos varios','C01')
INSERT INTO SubCategoria VALUES ('SC007','Escritura','C02')
INSERT INTO SubCategoria VALUES ('SC008','Dibujo y Pintura','C02')
INSERT INTO SubCategoria VALUES ('SC009','Etiqueta, Forros y Tijeras','C02')
INSERT INTO SubCategoria VALUES ('SC010','Folders y Carpetas','C02')
INSERT INTO SubCategoria VALUES ('SC011','Plastilina y Cerámicas','C02')
INSERT INTO SubCategoria VALUES ('SC012','Pegamentos y Limpiatípos','C02')
INSERT INTO SubCategoria VALUES ('SC013','Acsesorios Escolares','C02')
INSERT INTO SubCategoria VALUES ('SC014','tóner, Tintas y Cintas','C03')
INSERT INTO SubCategoria VALUES ('SC015','Almacenamiento','C03')
INSERT INTO SubCategoria VALUES ('SC016','Audio y video','C03')
INSERT INTO SubCategoria VALUES ('SC017','Cables','C03')
INSERT INTO SubCategoria VALUES ('SC018','Calculadoras','C03')
INSERT INTO SubCategoria VALUES ('SC019','Teclado y Mouses','C03')
INSERT INTO SubCategoria VALUES ('SC020','Artículos varios','C03')
INSERT INTO SubCategoria VALUES ('SC021','Videojuegos y Consolas','C03')
INSERT INTO SubCategoria VALUES ('SC022','Cuadernos','C04')
INSERT INTO SubCategoria VALUES ('SC023','Blocks','C04')
INSERT INTO SubCategoria VALUES ('SC024','Cuentos','C04')
INSERT INTO SubCategoria VALUES ('SC025','Agendas y Guías','C04')
INSERT INTO SubCategoria VALUES ('SC026','Juguetes','C05')
INSERT INTO SubCategoria VALUES ('SC027','Bebés','C05')
INSERT INTO SubCategoria VALUES ('SC029','Cartones','C06')
INSERT INTO SubCategoria VALUES ('SC030','Papel Fotocopia','C06')
INSERT INTO SubCategoria VALUES ('SC031','Papel Varios','C06')
INSERT INTO SubCategoria VALUES ('SC032','Cartulinas','C06')
INSERT INTO SubCategoria VALUES ('SC033','Papel Artístico','C07')
INSERT INTO SubCategoria VALUES ('SC034','Acsesorios','C07')
INSERT INTO SubCategoria VALUES ('SC035','Dibujo/ Ilusracíon','C07')
INSERT INTO SubCategoria VALUES ('SC036','Pinceles','C07')
INSERT INTO SubCategoria VALUES ('SC037','Pinturas','C07')
INSERT INTO SubCategoria VALUES ('SC038','Soporte','C07')

GO
select * from SubCategoria
GO

Insert into TipoProducto values('Fechadores')
Insert into TipoProducto values('bandejas')
Insert into TipoProducto values('clips,chinches')
Insert into TipoProducto values('Dispensadores')
Insert into TipoProducto values('Emgrapadoras')
Insert into TipoProducto values('ligas')
Insert into TipoProducto values('Notas Adhesivas')
Insert into TipoProducto values('Organizadoras')
Insert into TipoProducto values('Perforadores')
Insert into TipoProducto values('Tampón')
Insert into TipoProducto values('Tijeras')
Insert into TipoProducto values('Cuchillas')
Insert into TipoProducto values('Guillotinas')
Insert into TipoProducto values('tintas para Tampón')
Insert into TipoProducto values('Plumones')
Insert into TipoProducto values('Reglas')
Insert into TipoProducto values('Correctores')
Insert into TipoProducto values('Lapiceros')
Insert into TipoProducto values('Resaltadores')
Insert into TipoProducto values('Bolígrafos')
Insert into TipoProducto values('Pegamentos')
Insert into TipoProducto values('Cintas Adhesivas')
Insert into TipoProducto values('Etiquetas')
Insert into TipoProducto values('Formatos Contables')
Insert into TipoProducto values('Formatos contínuos')
Insert into TipoProducto values('Archivadores')
Insert into TipoProducto values('Sujetadores')
Insert into TipoProducto values('Files')
Insert into TipoProducto values('Portapapeles')
Insert into TipoProducto values('Sobres')
Insert into TipoProducto values('Tableros')
Insert into TipoProducto values('Separadores')
Insert into TipoProducto values('Articulos de Aseo')
Insert into TipoProducto values('papeleras')
Insert into TipoProducto values('Pizarras')
Insert into TipoProducto values('Señalizacion')
Insert into TipoProducto values('Portaminas')
Insert into TipoProducto values('Colores')
Insert into TipoProducto values('Crayones')
Insert into TipoProducto values('Témperas')
Insert into TipoProducto values('Mota')
Insert into TipoProducto values('Tijeras escolares')
Insert into TipoProducto values('Forro')
Insert into TipoProducto values('Folders')
Insert into TipoProducto values('plastilinas')
Insert into TipoProducto values('Cerámicas en Frío')
Insert into TipoProducto values('colas')
Insert into TipoProducto values('Goma Escarchada')
Insert into TipoProducto values('Gomas Líquidas')
Insert into TipoProducto values('Limpiatipos')
Insert into TipoProducto values('Pegamento en barra')
Insert into TipoProducto values('Siliconas')
Insert into TipoProducto values('Mochilas')
Insert into TipoProducto values('Loncheras')
Insert into TipoProducto values('Cartucheras')
Insert into TipoProducto values('Tintas')
Insert into TipoProducto values('Cintas')
Insert into TipoProducto values('Tóners')
Insert into TipoProducto values('CDs')
Insert into TipoProducto values('Discos Duros Esternos')
Insert into TipoProducto values('DVDs')
Insert into TipoProducto values('Memorias SD')
Insert into TipoProducto values('Porta CDs')
Insert into TipoProducto values('USB')
Insert into TipoProducto values('Audífonos')
Insert into TipoProducto values('Camara web')
Insert into TipoProducto values('Parlantes')
Insert into TipoProducto values('Cables Poder')
Insert into TipoProducto values('Cables USB')
Insert into TipoProducto values('Calculadoras')
Insert into TipoProducto values('Mouse')
Insert into TipoProducto values('Mouse PAd')
Insert into TipoProducto values('Teclados')
Insert into TipoProducto values('Pilas')
Insert into TipoProducto values('Accesorios')
Insert into TipoProducto values('Video juegos')
Insert into TipoProducto values('Cudernos')
Insert into TipoProducto values('Bolcks Anillado')
Insert into TipoProducto values('Blocks')
Insert into TipoProducto values('Blocks de Dibujo')
Insert into TipoProducto values('Blocks Taquigrafía')
Insert into TipoProducto values('Cuaderno Anillado')
Insert into TipoProducto values('Cuentos')
Insert into TipoProducto values('Libro de Actividades')
Insert into TipoProducto values('Agenda')
Insert into TipoProducto values('Libretas')
Insert into TipoProducto values('Guías')
Insert into TipoProducto values('Didacticos')
Insert into TipoProducto values('Niñas')
Insert into TipoProducto values('Niños')
Insert into TipoProducto values('Juegos de Mesa')
Insert into TipoProducto values('Didactico bebé')
Insert into TipoProducto values('Cuidado')
Insert into TipoProducto values('Carton Corrugado')
Insert into TipoProducto values('Carton Duplex')
Insert into TipoProducto values('Papel Fotocopia')
Insert into TipoProducto values('Papel Carbon')
Insert into TipoProducto values('celofán')
Insert into TipoProducto values('Hoja Contómetro')
Insert into TipoProducto values('Papel Lustre')
Insert into TipoProducto values('Papel Oficio')
Insert into TipoProducto values('Papel Periodico')
Insert into TipoProducto values('Papel Seda')
Insert into TipoProducto values('Cartulina Escolar')
Insert into TipoProducto values('Cartulina')
Insert into TipoProducto values('Block')
Insert into TipoProducto values('Accesorios Art')
Insert into TipoProducto values('Bistro')
Insert into TipoProducto values('Carbón')
Insert into TipoProducto values('Grafito')
Insert into TipoProducto values('Lapiz Color')
Insert into TipoProducto values('Marcadores Art')
Insert into TipoProducto values('Lapíz Pastel')
Insert into TipoProducto values('Lapíz Graso')
Insert into TipoProducto values('Tiza Pastel')
Insert into TipoProducto values('Tiza Pastel Óleo')
Insert into TipoProducto values('Pincel Redondo')
Insert into TipoProducto values('Pincel Plano')
Insert into TipoProducto values('Solventes')
Insert into TipoProducto values('Acrílicos')
Insert into TipoProducto values('Oleos')
Insert into TipoProducto values('Acuarelas')
Insert into TipoProducto values('Caballete')
Insert into TipoProducto values('Lienzo')

Select *  from TipoProducto
GO

