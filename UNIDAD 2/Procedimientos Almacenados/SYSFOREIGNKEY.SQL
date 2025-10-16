--Contiene informacion referente a las llaves externas de las tablas,
--Contenido infromacion de las tablas que participan

constid: clave de la restriccion
rkeyid: clave de la tabla padre
rkey: posicion de la columna en la tabla padre
fkeyid:calve de la tabla hijo
fkey: posicion de la columna en la tabla hija

select nombreFK = constid,
TablaPadre = rkeyid, columnaPadre = rkey,
TablaHijo = fkeyid, columnaHija = fkey

from sysforeignkeys


SELECT
nombreFK = OBJECT_NAME(constid),
TablaPadre = OBJECT_NAME(rkeyid),
columnaPadre = rkey,
TablaHijo = OBJECT_NAME(fkeyid),
columnaHija = fkey
from sysforeignkeys

select id, colorder, name from syscolumns where object_id('Products') = id

--Restricciones done products es hijo
select nombreFK= OBJECT_NAME(constid),
Padre = OBJECT_NAME(rkeyid),
columnaPadre = rkey,
Hijo = OBJECT_NAME(fkeyid),
columnaHija= fkey
from
sysforeignkeys
where fkeyid = OBJECT_ID('products')

--RESTRICCION DONDE PRODUCTO ES PADRE

select nombreFK = OBJECT_NAME(constid),
Padre = OBJECT_NAME(rkeyid),
columnaPadre = rkey,
Hijo=OBJECT_NAME(fkeyid),
columnaHija=fkey
from sysforeignkeys
where rkeyid = OBJECT_ID('products')


--Obtener las tbalas que nunca seran padre , son las tablass centrales

select id, name from sysobjects
where xtype = 'u'
and id not in(select rkeyid from sysforeignkeys)
and name not like 'sys%' and name not like 'ms%'
order by id


--agarramos una tabla central y se agrega a sus padres

select nombreFK =OBJECT_NAME(constid),
Padre = OBJECT_NAME(rkeyid),
Hijo = OBJECT_NAME(fkeyid)
from sysforeignkeys
where fkeyid = OBJECT_ID('order details')







