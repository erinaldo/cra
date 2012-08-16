﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ProyectoCraft.Entidades.Usuarios;

namespace ProyectoCraft.Entidades.Paperless
{
    public class PaperlessAsignacion: GlobalObject.IdentifiableObject
    {
        public PaperlessAsignacion()
        {
            Estado = Enums.Enums.EstadoPaperless.Nuevo;
            Usuario1 = new clsUsuario();
            Usuario2 = new clsUsuario();
            DataUsuario1 = new PaperlessUsuario1();
            TiemposUsuarios = new PaperlessProcesoRegistroTiempo();            
        }

        public string NumMaster { get; set; }
        public DateTime FechaMaster { get; set; }
        public PaperlessAgente Agente { get; set; }
        public PaperlessNave Nave { get; set; }
        public PaperlessNaviera Naviera { get; set; }
        public string Viaje { get; set; }
        public Int16 NumHousesBL { get; set; }
        public PaperlessTipoCarga TipoCarga { set; get; }
        public PaperlessTipoServicio TipoServicio { get; set; }

        public DateTime? FechaETA { get; set; }
        public DateTime? AperturaNavieras { get; set; }
        public DateTime? PlazoEmbarcadores { get; set; }

        public Usuarios.clsUsuario Usuario1 { get; set; }
        public string ObservacionUsuario1 { get; set; }
        public Parametros.clsItemParametro ImportanciaUsuario1 { get; set; }
        public Usuarios.clsUsuario Usuario2 { get; set; }
        public string ObservacionUsuario2 { get; set; }

        public Enums.Enums.EstadoPaperless Estado { get; set; }
        public string EstadoDescripcion { get; set; }


        public Usuarios.clsUsuario UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaPaso1 { get; set; }
        public DateTime? FechaPaso2 { get; set; }
        public DateTime? FechaPaso3 { get; set; }
        public string MotivoModificacion { get; set; }

        public PaperlessUsuario1 DataUsuario1 { get; set; }

        public PaperlessProcesoRegistroTiempo TiemposUsuarios { get; set; }

        public PaperlessNave NaveTransbordo { get; set; }
    }
}
