﻿using System;
using System.Collections.Generic;
using ProyectoCraft.Base.Log;
using System.Windows.Forms;
using ProyectoCraft.Entidades.Enums;
using ProyectoCraft.LogicaNegocios.Clientes;
using ProyectoCraft.LogicaNegocios.Mantenedores;
using ProyectoCraft.WinForm.Paperless.Asignacion;

//namespace SCCMultimodal.Mantenedores
namespace ProyectoCraft.WinForm.Clientes
{
    public partial class frmNavieras : Form
    {
        private static frmNavieras _instancia = null;
        public static frmNavieras Instancia
        {
            get
            {
                if (_instancia == null)
                    _instancia = new frmNavieras();

                return _instancia;
            }
            set
            {
                _instancia = value;
            }
        }
        //public string Nombre { get; set; }
        //public Int64 Id { get; set; }
        //public bool Activo { get; set; }
        //public DateTime FechaCreacion { get; set; }
        public bool fromPaperless { get; set; }
        public frmPaperlessAsignacion InstanciaPaperless { get; set; }
        private ClsNaviera _navieraactual;
        public ClsNaviera NavieraActual
        {
            get
            {
                if (_navieraactual == null)
                    _navieraactual = new ClsNaviera();

                return _navieraactual;
            }
            set { _navieraactual = value; }
        }
        private Enums.TipoAccionFormulario _accion;
        public Enums.TipoAccionFormulario Accion
        {
            get { return _accion; }
            set { _accion = value; }
        }

        public frmNavieras()
        {
            InitializeComponent();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            ListarNavieras();
        }
        public void ListarNavieras()
        {
            IList<ClsNaviera> listNavieras = ClsNavieras.ListarNavieras();
            grdNavieras.DataSource = listNavieras;
            grdNavieras.RefreshDataSource();
        }
        public void FormLoad()
        {
        }

        private void MenuVerDatos_Click(object sender, EventArgs e)
        {

        }
        private ClsNaviera ObtenerNaviera()
        {
            var filaSelected = grdNavieras.DefaultView.GetRow(gridView1.FocusedRowHandle);

            if (filaSelected == null)
            {
                return null;
            }

            ClsNaviera naviera = (ClsNaviera)filaSelected;

            return naviera;
        }

        private void MenuGuardar_Click(object sender, EventArgs e)
        {
            

        }
        private void LimpiarDatos()
        {
            txtNombre.Text = "";
            txtId.Text = "";
        }

        private void Menu_Nuevo_Click(object sender, EventArgs e)
        {
            
        }

        private void MenuEliminar_Click(object sender, EventArgs e)
        {
            
        }

        private void MenuSalir_Click(object sender, EventArgs e)
        {
            
        }

        private void frmNavieras_Load(object sender, EventArgs e)
        {

        }

        private void MenuSalir_Click_1(object sender, EventArgs e)
        {
            Instancia = null;
            this.Close();
        }

        private void MenuEliminar_Click_1(object sender, EventArgs e)
        {
            ClsNaviera naviera = ObtenerNaviera();
            frmNavieras form = frmNavieras.Instancia;
            if (naviera != null)
            {
                form.NavieraActual = naviera;
                txtNombre.Text = naviera.Nombre;
                txtId.Text = naviera.Id.ToString();
            }

            if (!string.IsNullOrEmpty(txtNombre.Text) && !string.IsNullOrEmpty(txtId.Text))
            {
                var res = ClsNavieras.EliminaNaviera(Convert.ToInt64(txtId.Text));
                MessageBox.Show(res.Descripcion, "Naviera", MessageBoxButtons.OK, MessageBoxIcon.Information);
                LimpiarDatos();
                ListarNavieras();
            }
        }

        private void MenuVerDatos_Click_1(object sender, EventArgs e)
        {

            ClsNaviera naviera = ObtenerNaviera();
            frmNavieras form = frmNavieras.Instancia;


            if (naviera != null)
            {
                form.NavieraActual = naviera;
                txtNombre.Text = naviera.Nombre;
                txtId.Text = naviera.Id.ToString();

            }
            else
                MessageBox.Show("Debe seleccionar una Naviera", "Naviera", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void MenuGuardar_Click_1(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNombre.Text) && !string.IsNullOrEmpty(txtId.Text))
            {
                var res = ClsNavieras.ActualizarNaviera(Convert.ToInt64(txtId.Text), txtNombre.Text);
                MessageBox.Show(res.Descripcion, "Naviera", MessageBoxButtons.OK, MessageBoxIcon.Information);
                LimpiarDatos();
                if (fromPaperless.Equals(true))
                {
                    InstanciaPaperless.CargarNavierasExistentes();                    
                }
            }
            else if (!string.IsNullOrEmpty(txtNombre.Text) && string.IsNullOrEmpty(txtId.Text))
            {
                var res = ClsNavieras.NuevaNaviera(txtNombre.Text.Trim());
                MessageBox.Show(res.Descripcion, "Naviera", MessageBoxButtons.OK, MessageBoxIcon.Information);
                LimpiarDatos();
                if (fromPaperless.Equals(true))
                {
                    InstanciaPaperless.CargarNavierasExistentes();
                }
                
            }
            else
            {
                MessageBox.Show("Debe seleccionar un registro para Editar", "Naviera", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Menu_Nuevo_Click_1(object sender, EventArgs e)
        {
            LimpiarDatos();
        }

        private void MenuExcel_Click(object sender, EventArgs e)
        {
            try
            {
                SaveFileDialog GrabarArchivo = new SaveFileDialog();
                GrabarArchivo.Filter = "Excel(xls)|*.xls";
                GrabarArchivo.Title = "Exportar Excel";
                GrabarArchivo.DefaultExt = "xls";
                GrabarArchivo.FileName = "";
                GrabarArchivo.OverwritePrompt = true;
                GrabarArchivo.ShowDialog();

                if (GrabarArchivo.FileName != "")
                {
                    // Saves the Image via a FileStream created by the OpenFile method.
                    System.IO.FileStream fs =
                       (System.IO.FileStream)GrabarArchivo.OpenFile();
                    this.grdNavieras.ExportToXls(fs, true);

                    fs.Close();
                }
            }
            catch (Exception ex)
            {
                Log.EscribirLog(ex.Message);
                MessageBox.Show("Error al generar archivo Excel: ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
