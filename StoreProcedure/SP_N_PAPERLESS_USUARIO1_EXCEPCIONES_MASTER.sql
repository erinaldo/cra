ALTER PROCEDURE [dbo].[SP_N_PAPERLESS_USUARIO1_EXCEPCIONES_MASTER]    
@IdAsignacion bigint,     
@IdHouseBL bigint,     
@TieneExcepcion bit,
@Tipoexcepcion int,
@Tiporesponsabilidad int,
@Comentario varchar (200),
@Resuelto bit,
@UsuarioUltimaModificacion int,
@AgenteCausador int
    
AS    
    
INSERT INTO PAPERLESS_USUARIO1_EXCEPCIONES_MASTER    
(IdAsignacion, IdHouseBL, TieneExcepcion,Tipoexcepcion,Tiporesponsabilidad,Comentario,Resuelto,Estado,UsuarioUltimaModificacion,AgenteCausador)    
VALUES    
(@IdAsignacion ,  @IdHouseBL ,     @TieneExcepcion ,@Tipoexcepcion ,@Tiporesponsabilidad ,@Comentario  ,@Resuelto ,1 ,@UsuarioUltimaModificacion ,@AgenteCausador )    
    
SELECT SCOPE_IDENTITY()

