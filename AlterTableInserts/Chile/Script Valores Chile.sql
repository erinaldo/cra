--select * from PAPERLESS_PASOS_USUARIO2 


update PAPERLESS_PASOS_USUARIO2 set idTipoCarga=1 
GO



update PAPERLESS_PASOS_USUARIO2 set pantalla='ResolverExcepciones' where idPAso=1
update PAPERLESS_PASOS_USUARIO2 set pantalla='ContactarEnbarcador' where idPAso=2
update PAPERLESS_PASOS_USUARIO2 set pantalla='AperturaEmbarcadores' where idPAso=3
update PAPERLESS_PASOS_USUARIO2 set pantalla='PresentarManifiesto' where idPAso=4
GO

Insert into PAPERLESS_PASOS_USUARIO2  values (1,'ResolverExcepciones',1,null,2,2,'ResolverExcepciones')
Insert into PAPERLESS_PASOS_USUARIO2  values (2,'Contactar Embarcador',1,1,3,2,'ContactarEnbarcador')
Insert into PAPERLESS_PASOS_USUARIO2  values (3,'AperturaEmbarcadores',1,2,4,2,'AperturaEmbarcadores')
Insert into PAPERLESS_PASOS_USUARIO2  values (4,'PresentarManifiesto',1,3,null,2,'PresentarManifiesto')
go

Insert into PAPERLESS_PASOS_USUARIO2  values (1,'ResolverExcepciones',1,null,2,3,'ResolverExcepciones')
Insert into PAPERLESS_PASOS_USUARIO2  values (2,'Contactar Embarcador',1,1,3,3,'ContactarEnbarcador')
Insert into PAPERLESS_PASOS_USUARIO2  values (3,'AperturaEmbarcadores',o1,2,4,3,'AperturaEmbarcadores')
Insert into PAPERLESS_PASOS_USUARIO2  values (4,'PresentarManifiesto',1,3,null,3,'PresentarManifiesto')
go

select * from PAPERLESS_PASOS_USUARIO1_v2 

/* Actualizacion de los pasos */
update PAPERLESS_PASOS_USUARIO1_v2 set idTipoCarga=1, pantalla=null
update PAPERLESS_PASOS_USUARIO1 set idTipoCarga=1, pantalla=null

update PAPERLESS_PASOS_USUARIO1_v2 set pantalla='IngresoDeDatos' where numpaso=1
update PAPERLESS_PASOS_USUARIO1_v2 set pantalla='CrearManifiesto' where numpaso=2
update PAPERLESS_PASOS_USUARIO1_v2 set pantalla='RegistrarExcepciones' where numpaso=6
update PAPERLESS_PASOS_USUARIO1_v2 set pantalla='EnvioDisputa' where numpaso=10
update PAPERLESS_PASOS_USUARIO1_v2 set pantalla='EnviarAvisoUsuario2' where numpaso=11
GO

--select * from PAPERLESS_PASOS_USUARIO1_v2 


insert into  PAPERLESS_PASOS_USUARIO1_V2 values (1,	'Ingreso de Datos',	1	,NULL	,2	,2	,'IngresoDeDatos')
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (2,	'Crear Manifiesto',	1	,1	,3	,2	,'CrearManifiesto')
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (3,	'Cargar Copia BL',	1	,2	,4	,2	,NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (4,	'Facturar'	,		1,	3,	5	,2,	NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (5,	'Generar/enviar avisos'	,1,	4,	6,	2,	NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (6,	'Registrar Excepciones'	,1,	5,	7,	2,	'RegistrarExcepciones')
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (7,	'Ingreso de MBl a Netship y contable'	,1,	6,	8,	2,	NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (8,	'Ingreso de invoice a netship y al contable',	1,	7,	9,	2,	NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (9,	'Imprimir etiquetas y BLS',	1,	8,	10,	2,	NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (10,	'Envio de disputa',	1,	9,	11,	2,	'EnvioDisputa')
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (11,'Enviar Aviso a Usuario', 	1,	10	,NULL,	2	,'EnviarAvisoUsuario2')

--FAK

insert into  PAPERLESS_PASOS_USUARIO1_V2 values (1,	'Ingreso de Datos',	1	,NULL	,2	,3	,'IngresoDeDatos')
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (2,	'Crear Manifiesto',	1	,1	,3	,3	,'CrearManifiesto')
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (3,	'Cargar Copia BL',	1	,2	,4	,3	,NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (4,	'Facturar'	,		1,	3,	5	,3,	NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (5,	'Generar/enviar avisos'	,1,	4,	6,	3,	NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (6,	'Registrar Excepciones'	,1,	5,	7,	3,	'RegistrarExcepciones')
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (7,	'Ingreso de MBl a Netship y contable'	,1,	6,	8,	3,	NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (8,	'Ingreso de invoice a netship y al contable',	1,	7,	9,	3,	NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (9,	'Imprimir etiquetas y BLS',	1,	8,	10,	3,	NULL)
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (10,	'Envio de disputa',	1,	9,	11,	3,	'EnvioDisputa')
insert into  PAPERLESS_PASOS_USUARIO1_V2 values (11,'Enviar Aviso a Usuario', 	1,	10	,NULL,	3	,'EnviarAvisoUsuario2')



--usuario 2


insert into PAPERLESS_PASOS_USUARIO2 values (1,	'Resolver Excepciones'	,1	,NULL	,2	,2	,'ResolverExcepciones')
insert into PAPERLESS_PASOS_USUARIO2 values (2,	'Contactar Embarcador'	,1	,1,	3,	2,	'ContactarEnbarcador')
insert into PAPERLESS_PASOS_USUARIO2 values (3,	'Recibir Apertura Embarcadores',	1	,2	,4	,2,	'AperturaEmbarcadores')
insert into PAPERLESS_PASOS_USUARIO2 values (4,	'Presentar Manifiesto'	,1	,3	,NULL	,2,	'PresentarManifiesto')
go

insert into PAPERLESS_PASOS_USUARIO2 values (1,	'Resolver Excepciones'	,1	,NULL	,2	,3	,'ResolverExcepciones')
insert into PAPERLESS_PASOS_USUARIO2 values (2,	'Contactar Embarcador'	,1	,1,	3,	3,	'ContactarEnbarcador')
insert into PAPERLESS_PASOS_USUARIO2 values (3,	'Recibir Apertura Embarcadores',	1	,2	,4	,3,	'AperturaEmbarcadores')
insert into PAPERLESS_PASOS_USUARIO2 values (4,	'Presentar Manifiesto'	,1	,3	,NULL	,3,	'PresentarManifiesto')
go

--truncate table PAPERLESS_TIPO_EXCEPCIONES  
--select * from  PAPERLESS_TIPO_EXCEPCIONES  
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Sobrevalor pendiente',1,	'FCL')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Falta de informacion de contacto'	,1,'FCL')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Master en la nominacion'	,1,'FCL')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Master no valorado'	,1,'FCL')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('No envio de copia  de BL',1,	'FCL')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Otros',	1,'FCL')
go

insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Sobrevalor pendiente',1,	'LCL')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Falta de informacion de contacto'	,1,'LCL')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Master en la nominacion'	,1,'LCL')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Master no valorado'	,1,'LCL')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('No envio de copia  de BL',1,	'LCL')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Otros',	1,'LCL')
go

insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Sobrevalor pendiente',1,	'FAK')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Falta de informacion de contacto'	,1,'FAK')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Master en la nominacion'	,1,'FAK')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Master no valorado'	,1,'FAK')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('No envio de copia  de BL',1,	'FAK')
insert into PAPERLESS_TIPO_EXCEPCIONES  values ('Otros',	1,'FAK')
go
