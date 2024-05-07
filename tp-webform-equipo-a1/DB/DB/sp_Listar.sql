CREATE PROCEDURE [dbo].[sp_Listar]
AS
	select A.Id, A.Codigo, A.Nombre, A.Descripcion,C.Id 'IdCategoria',C.Descripcion 'Categoria',M.Id 'IdMarca',M.Descripcion 'Marca',A.Precio 
	from ARTICULOS A 
	join CATEGORIAS C on C.Id = A.IdCategoria 
	join MARCAS M on M.Id = A.IdMarca

