DROP PROCEDURE [dbo].[SP_L_PAPERLESS_PREALERTA_FILTRO]
GO
CREATE PROCEDURE [dbo].[SP_L_PAPERLESS_PREALERTA_FILTRO]
				@NConsolidado nvarchar(50),
				@Estados nvarchar(50),
				@agente varchar(50),
				@FechaSalidaDesde datetime,
				@FechaSalidaHasta datetime,
				@FechaLlegadaDesde datetime,
				@FechaLlegadaHasta datetime,
				@FechaRecibimientoDesde datetime,
				@FechaRecibimientoHasta datetime
AS

IF @NConsolidado = '-1' SET @NConsolidado = NULL
IF @agente = '-1' SET @agente = null

IF @Estados = '-1' SET @Estados = null

IF YEAR(@FechaSalidaDesde) = 9999 SET @FechaSalidaDesde = NULL
IF YEAR(@FechaSalidaHasta) = 9999 SET @FechaSalidaHasta = NULL
IF YEAR(@FechaLlegadaDesde) = 9999 SET @FechaLlegadaDesde = NULL
IF YEAR(@FechaLlegadaHasta) = 9999 SET @FechaLlegadaHasta= NULL
IF YEAR(@FechaRecibimientoDesde) = 9999 SET @FechaRecibimientoDesde = NULL
IF YEAR(@FechaRecibimientoHasta) = 9999 SET @FechaRecibimientoHasta = NULL

declare @sql nvarchar(4000)

set @sql = 'SELECT ' 
set @sql += 'PA.Id, PA.NumConsolidada, '
set @sql += 'PA.IdAgente, PAG.Descripcion Agente, PA.IdNaviera, PN.Descripcion Naviera, PA.IdNave, PNAVE.Descripcion Nave, '
set @sql += 'PA.FechaSalida, PA.FechaLlegada, PA.FechaRecibimiento, '
set @sql += 'PA.NumMaster, PA.IdUsuarioCreacion, PA.FechaCreacion, '
set @sql += 'U1.NombreUsuario, '
set @sql += 'PA.IdEstado, pep.Descripcion estado,PA.IdUsuarioCreacion, '
set @sql += 'PA.IdUsuarioModificacion, U2.NombreUsuario NombreUsuarioModificacion, '
set @sql += 'PUO.Codigo as IdPuertoOrigen, PUO.Nombre as NombrePuertoOrigen, PUD.Codigo as IdPuertoDestino, PUD.Nombre as NombrePuertoDestino '
set @sql += 'FROM PAPERLESS_PREALERTA PA '
set @sql += 'LEFT OUTER JOIN USUARIOS U1 '
set @sql += 'ON PA.IdUsuarioCreacion = U1.Id '
set @sql += 'LEFT OUTER JOIN USUARIOS U2 '
set @sql += 'ON PA.IdUsuarioModificacion = U2.Id '
set @sql += 'LEFT OUTER JOIN PAPERLESS_AGENTE PAG '
set @sql += 'ON PA.IdAgente = PAG.Id '
set @sql += 'LEFT OUTER JOIN PAPERLESS_NAVIERA PN '
set @sql += 'ON PA.IdNaviera = PN.Id '
set @sql += 'LEFT OUTER JOIN PAPERLESS_NAVE PNAVE '
set @sql += 'ON PA.IdNave = PNAVE.Id '
set @sql += 'INNER JOIN USUARIOS UC '
set @sql += 'ON PA.IdUsuarioCreacion = UC.Id '
set @sql += 'LEFT OUTER JOIN PAPERLESS_ESTADO_PREALERTA pep '
set @sql += 'ON PA.IdEstado = pep.ID '
set @sql += 'LEFT OUTER JOIN PAPERLESS_PUERTOS PUO '
set @sql += 'ON PA.IdPuertoOrigen = PUO.CODIGO '
set @sql += 'LEFT OUTER JOIN PAPERLESS_PUERTOS PUD '
set @sql += 'ON PA.IdPuertoDestino = PUD.CODIGO '
set @sql += 'WHERE PA.Id > 0 '


if(@NConsolidado is not null)
    set @sql += ' AND PA.NumConsolidada = ''' + @NConsolidado + ''''
    
if (@agente is not null and @agente <> '')
    set @sql += ' AND PAG.Descripcion like ISNULL(''%' + @agente + '%'',PAG.Descripcion)'

if(@Estados is not null)                                                                                                 
    set @sql += ' AND PA.IdEstado in (' + @Estados + ' )'
    
if(@FechaSalidaDesde is not null and @FechaSalidaDesde <> '')
    set @sql += ' AND convert(varchar(20),PA.FechaSalida,112) >= ISNULL(''' + CONVERT(NVARCHAR(20),@FechaSalidaDesde,112) + ''',PA.FechaSalida)'

if(@FechaSalidaHasta is not null and @FechaSalidaHasta <> '')
    set @sql += ' AND convert(varchar(20),PA.FechaSalida,112) <= ISNULL(''' + CONVERT(NVARCHAR(20),@FechaSalidaHasta,112) + ''',PA.FechaSalida)'

if (@FechaLlegadaDesde is not null and @FechaLlegadaDesde <> '')
    set @sql += ' AND convert(varchar(20),PA.FechaLlegada,112) >= ISNULL('''+CONVERT(NVARCHAR(20),@FechaLlegadaDesde,112)+''',PA.FechaLlegada)'

if (@FechaLlegadaHasta  is not null and @FechaLlegadaHasta <> '')
    set @sql += ' AND convert(varchar(20),PA.FechaLlegada,112) <= ISNULL('''+CONVERT(NVARCHAR(20),@FechaLlegadaHasta,112)+''',PA.FechaLlegada)'

if (@FechaRecibimientoDesde is not null and @FechaRecibimientoDesde <> '')
    set @sql += ' AND convert(varchar(20),PA.FechaRecibimiento,112) >= ISNULL('''+CONVERT(NVARCHAR(20),@FechaRecibimientoDesde,112)+''',PA.FechaRecibimiento)'

if (@FechaRecibimientoHasta is not null and @FechaRecibimientoHasta <> '')
    set @sql += ' AND convert(varchar(20),PA.FechaRecibimiento,112) <= ISNULL('''+CONVERT(NVARCHAR(20),@FechaRecibimientoHasta,112)+''',PA.FechaRecibimiento)'

set @sql += ' ORDER BY PA.FechaCreacion DESC'

exec(@sql)