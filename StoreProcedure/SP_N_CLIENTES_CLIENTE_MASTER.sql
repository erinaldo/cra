ALTER procedure  [dbo].[SP_N_CLIENTES_CLIENTE_MASTER]
@NombreCompania nvarchar(255),
@Nombres nvarchar(255),
@ApPaterno nvarchar(255),
@ApMaterno nvarchar(255),
@RUT nvarchar(50), 
@CodTipo nvarchar(3),
@DireccionInfo bigint,
@TipoCliente int,
@NombreFantasia nvarchar(255),
@IdUsuario int
AS

if @DireccionInfo = -1 set @DireccionInfo = NULL

DECLARE @EXISTE INT
--SELECT @EXISTE = (SELECT top 1 1 FROM CLIENTES_MASTER WHERE RUT = @RUT AND CODTIPO = @CODTIPO)
IF (@CodTipo in (1,2))
Begin
	if (replace (@RUT,' ','') is not null)
	BEGIN
	SELECT @EXISTE = (SELECT top 1 1 FROM CLIENTES_MASTER WHERE replace (RUT,' ','') = replace (@RUT,' ','') AND CodTipo = ISNULL(@CodTipo,CodTipo))
	END
End 
--exec SP_C_CLIENTE_MASTER_EXISTE_RUT @RUT,@CODTIPO ,@EXISTE output
IF (@EXISTE IS NULL)
BEGIN
INSERT INTO CLIENTES_MASTER (NombreCompania,Nombres,ApellidoPaterno,ApellidoMaterno, RUT,CodTipo,FechaCreacion,IdDireccionInfo,NombreFantasia,IdUsuario)
VALUES (@NombreCompania,@Nombres,@ApPaterno,@ApMaterno, @RUT,@CodTipo,GetDate(),@DireccionInfo,@NombreFantasia,@IdUsuario)

SELECT  SCOPE_IDENTITY()
END