﻿
use master
GO

create database CATALOGO_P3_DB
GO

use CATALOGO_P3_DB
GO

USE CATALOGO_P3_DB
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

insert into MARCAS values ('Samsung'), ('Apple'), ('Sony'), ('Huawei'), ('Motorola')
GO

insert into CATEGORIAS values ('Celulares'),('Televisores'), ('Media'), ('Audio')
GO

insert into ARTICULOS values ('S01', 'Galaxy S10', 'Una canoa cara', 1, 1, 69.999),
('M03', 'Moto G Play 7ma Gen', 'Ya siete de estos?', 1, 5, 15699),
('S99', 'Play 4', 'Ya no se cuantas versiones hay', 3, 3, 35000),
('S56', 'Bravia 55', 'Alta tele', 3, 2, 49500),
('A23', 'Apple TV', 'lindo loro', 2, 3, 7850)
GO

insert into imagenes values
(1,'https://images.samsung.com/is/image/samsung/co-galaxy-s10-sm-g970-sm-g970fzyjcoo-frontcanaryyellow-thumb-149016542'),
(2, 'https://www.motorola.cl/arquivos/moto-g7-play-img-product.png?v=636862863804700000'),
(2, 'https://i.blogs.es/9da288/moto-g7-/1366_2000.jpg'),
(3, 'https://www.euronics.cz/image/product/800x800/532620.jpg'),
(4, 'https://intercompras.com/product_thumb_keepratio_2.php?img=images/product/SONY_KDL-55W950A.jpg&w=650&h=450'),
(5, 'https://cnnespanol2.files.wordpress.com/2015/12/gadgets-mc3a1s-populares-apple-tv-2015-18.jpg?quality=100&strip=info&w=460&h=260&crop=1')
GO

select * from IMAGENES
GO

select A.Codigo, A.Nombre, A.Descripcion,C.Id 'IdCategoria',C.Descripcion 'Categoria',M.Id 'IdMarca',M.Descripcion 'Marca',I.ImagenUrl, A.Precio from ARTICULOS A join CATEGORIAS C on C.Id = A.IdCategoria join MARCAS M on M.Id = A.IdMarca left join IMAGENES I on I.IdArticulo = A.Id
GO