using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gaudiAdm
{
    public partial class Admin : System.Web.UI.Page
    {
        string idCondSel;
        string idDeptoSel;
        string usuarioActual;
        string idUsuarioActual;
        protected void Page_Load(object sender, EventArgs e)
        {
            Connector connector = new Connector();
            if (Session["usuario"]!= null)
            {
                usuarioActual = Session["usuario"].ToString();
                idUsuarioActual = connector.getIDUsuario(usuarioActual);
                lblLoginUser.Text = usuarioActual;
                lblNombreUsuario.Text = connector.getNombreUsuario(usuarioActual);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
        
        protected void btnCondominios_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(viewCondominios);
            BindGridCond();
            
        }

        private void BindGridCond()
        {
            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();
            MySqlDataAdapter da = new MySqlDataAdapter("select * from condominios", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grvCondominiosListado.DataSource = ds.Tables[0];
            grvCondominiosListado.DataBind();
            conectar.Close();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvCondominiosListado.EditIndex = e.NewEditIndex;
            this.BindGridCond();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grvCondominiosListado.Rows[e.RowIndex];
            string idCond = (row.FindControl("lblID") as Label).Text;
            
            string nombre = (row.FindControl("txtNombre") as TextBox).Text;
            string direccion = (row.FindControl("txtDireccion") as TextBox).Text;

            MySqlConnection conectar;
            Connector connector = new Connector();
            conectar = connector.Conectar();

            using (MySqlCommand cmd = new MySqlCommand("UPDATE condominios SET Nombre = @Nombre, Direccion = @Direccion WHERE idCond = @idCond"))
            {
                cmd.Parameters.AddWithValue("@idCond", idCond);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Direccion", direccion);
                cmd.Connection = conectar;
                conectar.Open();
                cmd.ExecuteNonQuery();
                conectar.Close();
            }
            grvCondominiosListado.EditIndex = -1;
            this.BindGridCond();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvCondominiosListado.EditIndex = -1;
            this.BindGridCond();
        }

        

        private void BindGridDeptos()
        {
            if (Session["idCondSel"] != null)
            {
                lblIDCond.Text = Session["idCondSel"].ToString();
                MySqlConnection conectar;
                Connector connector = new Connector();
                conectar = connector.Conectar();
                conectar.Open();


                string cone = "select * from deptos where cond = '" + Session["idCondSel"].ToString() + "'";
                MySqlDataAdapter da = new MySqlDataAdapter(cone, conectar);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView2.DataSource = ds.Tables[0];
                GridView2.DataBind();
                conectar.Close();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            GridViewRow row = grvCondominiosListado.SelectedRow;



            Session["idCondSel"] = (row.FindControl("lblCod") as Label).Text;

            BindGridDeptos();
            panelDeptos.Visible = true;
            lblCondSeleccionado.Text = "Condominio " + (row.FindControl("lblNomCond") as Label).Text;
            lblCondSeleccionado.Visible = true;
            
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            GridViewRow row = GridView2.SelectedRow;

            Session["idDeptoSel"] = (row.FindControl("lblDepto") as Label).Text;

            BindGridUsuDeptos();
            panelDetalleDepto.Visible = true;
            
        }
        private void BindGridUsuDeptos()
        {
            if (Session["idDeptoSel"] != null)
            {
                MySqlConnection conectar;
                Connector connector = new Connector();

                conectar = connector.Conectar();
                conectar.Open();

                MySqlDataAdapter da = new MySqlDataAdapter("SELECT usuarios.idUsu, usuarios.Nombre, usuarios.telefono, usuarios.correo FROM usuarios, usuariosdeptos WHERE usuarios.idUsu = usuariosdeptos.idUsu and depto = " + Session["idDeptoSel"] + " and cond = '" + lblIDCond.Text + "'", conectar);
                DataSet ds = new DataSet();
                da.Fill(ds);
                grvUsuariosAsignadosDepto.DataSource = ds.Tables[0];
                grvUsuariosAsignadosDepto.DataBind();
                conectar.Close();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnAddUsu_Click(object sender, EventArgs e)
        {
            MultiView2.SetActiveView(viewAsigUsu);
            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT usuarios.idUsu, usuarios.Nombre, usuarios.telefono, usuarios.correo FROM usuarios", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView4.DataSource = ds.Tables[0];
            GridView4.DataBind();
            conectar.Close();

            lbUsuAsignados.Items.Clear();

        }

        protected void btnMensaje_Click(object sender, EventArgs e)
        {
            MultiView2.SetActiveView(viewMensajes);
            BindGridMensajes();
            

            
        }

        private void BindGridMensajes()
        {
            if (Session["idCondSel"] != null)
            {
                MySqlConnection conectar;
                Connector connector = new Connector();

                conectar = connector.Conectar();
                conectar.Open();

                MySqlDataAdapter da = new MySqlDataAdapter("SELECT mensajes.mensajeDepto, mensajes.mensajeAdmin, mensajes.fechahora, mensajes.adjunto, mensajes.flagadjunto FROM mensajes where depto = '" + Session["idDeptoSel"].ToString() + "' and cond = '" + Session["idCondSel"].ToString() + "' order by mensajes.fechahora", conectar);
                DataSet ds = new DataSet();
                da.Fill(ds);
                grvMensajes.DataSource = ds.Tables[0];
                grvMensajes.DataBind();
                conectar.Close();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idUsu = (GridView4.SelectedRow.FindControl("lblIDUsu") as Label).Text;
            string nombre = (GridView4.SelectedRow.FindControl("lblNomUsu") as Label).Text;
            ListItem item = new ListItem(nombre, idUsu);
            lbUsuAsignados.Items.Add(item);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["idDeptoSel"] != null)
            {
                if (Session["idCondSel"] != null)
                {
                    try
                    {
                        foreach (ListItem item in lbUsuAsignados.Items)
                        {
                            MySqlConnection conectar;
                            Connector connector = new Connector();
                            conectar = connector.Conectar();

                            using (MySqlCommand cmd = new MySqlCommand("INSERT into usuariosdeptos (idUsu, depto, cond) values (@idUsu, @iddepto, @idcond)"))
                            {

                                string idUsu = item.Value.ToString();
                                string idDepto = Session["idDeptoSel"].ToString();
                                string idCond = Session["idCondSel"].ToString();
                                cmd.Parameters.AddWithValue("@idUsu", item.Value.ToString());
                                cmd.Parameters.AddWithValue("@iddepto", Session["idDeptoSel"].ToString());
                                cmd.Parameters.AddWithValue("@idcond", Session["idCondSel"].ToString());


                                cmd.Connection = conectar;
                                conectar.Open();
                                cmd.ExecuteNonQuery();
                                conectar.Close();
                            }


                        }
                        this.BindGridUsuDeptos();
                        string script = @"<script type='text/javascript'>
                                        alert('Usuarios asociados correctamente.'); </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                        lbUsuAsignados.Items.Clear();
                        MultiView2.ActiveViewIndex = -1;
                    }
                    catch (Exception ex)
                    {
                        string script = @"<script type='text/javascript'>
                                        alert('Error al ejecutar: '" + ex.Message + " ); </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnEnviarMensaje_Click(object sender, EventArgs e)
        {
            if (Session["idDeptoSel"] != null)
            {
                if (Session["idCondSel"] != null)
                {
                    if ((txtAsuntoMensaje.Text != "") && (txtMensaje.Text != ""))
                    {
                        try
                        {
                            string fileName = "";
                            int fileUploaded = 0;
                            if (FileUpload1.HasFile)
                            {
                                String extension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

                                if ((extension == ".pdf") || (extension == ".jpg") || (extension == ".png") || (extension == ".PDF") || (extension == ".JPG") || (extension == ".PNG"))
                                {
                                    fileName = FileUpload1.FileName;
                                    string path = Server.MapPath("~/Adjuntos/");
                                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Adjuntos/") + FileUpload1.FileName);
                                    fileUploaded = 1;
                                }
                                else
                                {
                                    string scriptx = @"<script type='text/javascript'>
                                        alert('Extemsión de archivo no permitida. Sólo adjuntar pdf, jpg, png.');
                                        </script>";
                                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", scriptx, false);
                                }


                            }

                            MySqlConnection conectar;
                            Connector connector = new Connector();
                            conectar = connector.Conectar();

                            using (MySqlCommand cmd = new MySqlCommand("INSERT into mensajes (depto, cond, titulo, mensajeAdmin, adjunto, flagadjunto) values (@depto, @cond, @titulo, @mensajeAdmin, @adjunto, @flag)"))
                            {
                                cmd.Parameters.AddWithValue("@depto", Session["idDeptoSel"].ToString());
                                cmd.Parameters.AddWithValue("@cond", Session["idCondSel"].ToString());
                                cmd.Parameters.AddWithValue("@titulo", txtAsuntoMensaje.Text);
                                cmd.Parameters.AddWithValue("@mensajeAdmin", txtMensaje.Text);
                                cmd.Parameters.AddWithValue("@adjunto", fileName);
                                cmd.Parameters.AddWithValue("@flag", fileUploaded);



                                cmd.Connection = conectar;
                                conectar.Open();
                                cmd.ExecuteNonQuery();

                                txtMensaje.Text = null;

                            }

                            using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones,mensajes,usuariosdeptos, usuarios SET notificaciones.notMensaje = 1 WHERE notificaciones.loginUsu = usuarios.login AND usuarios.idUsu = usuariosdeptos.idUsu AND usuariosdeptos.depto = mensajes.depto AND usuariosdeptos.cond = mensajes.cond and mensajes.depto = @depto AND mensajes.cond = @cond"))
                            {
                                cmd.Parameters.AddWithValue("@depto", Session["idDeptoSel"].ToString());
                                cmd.Parameters.AddWithValue("@cond", Session["idCondSel"].ToString());

                                cmd.Connection = conectar;
                                cmd.ExecuteNonQuery();


                            }

                            conectar.Close();
                            BindGridMensajes();

                            string script = @"<script type='text/javascript'>
                                        alert('Mensaje enviado correctamente');
                                        </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

                        }
                        catch (Exception ex)
                        {
                            string script = @"<script type='text/javascript'>
                                        alert('Error al enviar: '" + ex.Message + "'); </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);



                        }
                    }
                    else
                    {
                        string script = @"<script type='text/javascript'>
                                        alert('Se debe ingresar un mensaje e indicar el asunto.');
                                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }


            
        }

        

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            //obetener extensión del archivo antes de cargar el documento
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            LinkButton lbtn = (LinkButton)clickedRow.FindControl("lnkAdjuntoGrvMensajes");
            string nombre = lbtn.Text;
            string extension = nombre.Substring(nombre.Length - 4);

            if ((extension == ".pdf") || (extension == ".PDF"))
            {
                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + nombre);
                Response.TransmitFile(Server.MapPath("~/Adjuntos/") + nombre);
                Response.End();
            }
            else if ((extension == ".jpg") || (extension == ".JPG"))
            {
                Response.ContentType = "image/JPEG";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + nombre);
                Response.TransmitFile(Server.MapPath("~/Adjuntos/") + nombre);
                Response.End();
            }
            else if ((extension == ".png") || (extension == ".PNG"))
            {
                Response.ContentType = "image/PNG";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + nombre);
                Response.TransmitFile(Server.MapPath("~/Adjuntos/") + nombre);
                Response.End();
            }




           




        }

        protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            
        }

        protected void btnCargaGC_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(viewGastoComun);
            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT condominios.idCond, condominios.Nombre FROM condominios", conectar);
            DataSet ds = new DataSet();

            da.Fill(ds);
            ddlConds.DataSource = ds;
            ddlConds.DataValueField = "idCond";
            ddlConds.DataTextField = "Nombre";
            ddlConds.DataBind();

            ddlCondsListado.DataSource = ds;
            ddlCondsListado.DataValueField = "idCond";
            ddlCondsListado.DataTextField = "Nombre";
            ddlCondsListado.DataBind();

            int mes = System.DateTime.Now.Month;
            int anio = System.DateTime.Now.Year;
            int anioN = anio + 1;
            int anioP = anio - 1;
            ddlGCMes.SelectedValue = mes.ToString();
            ddlGCAnio.Items.Add(anioP.ToString());
            ddlGCAnio.Items.Add(anio.ToString());
            ddlGCAnio.Items.Add(anioN.ToString());
            ddlGCAnio.SelectedValue = anio.ToString();







            conectar.Close();

            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                string fileName = "";
                
                if (fupGC.HasFile)
                {
                    String extension = System.IO.Path.GetExtension(fupGC.FileName).ToLower();
                    


                    

                    int flagDup = 0;
                    MySqlConnection conectarloc;
                    Connector connectorloc = new Connector();

                    conectarloc = connectorloc.Conectar();
                    conectarloc.Open();

                    MySqlDataAdapter da = new MySqlDataAdapter("SELECT count(*) as Cantidad FROM gastocomun where idCond = '" + ddlConds.SelectedValue.ToString() + "' and mes = '" + ddlGCMes.SelectedValue.ToString() + "' and anio = '" + ddlGCAnio.Text + "'"  , conectarloc);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                                                        

                    conectarloc.Close();

                    foreach (DataRow fila in ds.Tables[0].Rows)
                    {
                        int cantidad = int.Parse(fila["Cantidad"].ToString());
                        if(cantidad > 0)
                        {
                            flagDup = 1;
                        }
                    }



                    if(flagDup == 0)
                        if ((extension == ".pdf")||(extension==".jpg")||(extension==".png")|| (extension == ".PDF") || (extension == ".JPG") || (extension == ".PNG"))
                        {
                            string mesGC = ddlGCMes.SelectedItem.Text;
                            string anioGC = ddlGCAnio.Text;
                            string condGC = ddlConds.SelectedItem.Text;


                            fileName = "GC_" + mesGC + "_" + anioGC + "_" + condGC + extension;
                            string path = Server.MapPath("~/GC/");
                            fupGC.PostedFile.SaveAs(Server.MapPath("~/GC/") + fileName);

                            MySqlConnection conectar;
                            Connector connector = new Connector();
                            conectar = connector.Conectar();

                            using (MySqlCommand cmd = new MySqlCommand("INSERT into gastocomun (idCond, mes, anio, adjunto) values (@cond, @mes, @anio, @adjunto)"))
                            {
                                cmd.Parameters.AddWithValue("@cond", ddlConds.SelectedValue.ToString());
                                cmd.Parameters.AddWithValue("@mes", ddlGCMes.SelectedValue.ToString());
                                cmd.Parameters.AddWithValue("@anio", ddlGCAnio.SelectedValue.ToString());
                                cmd.Parameters.AddWithValue("@adjunto", fileName);




                                cmd.Connection = conectar;
                                conectar.Open();
                                cmd.ExecuteNonQuery();
                                
                            }

                            using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones, usuariosdeptos, usuarios SET notificaciones.notGC = 1 where usuariosdeptos.cond = @cond and usuariosdeptos.idUsu = usuarios.idUsu and usuarios.login = notificaciones.loginUsu"))
                            {
                                cmd.Parameters.AddWithValue("@cond", ddlConds.SelectedValue.ToString());
                                                                
                                cmd.Connection = conectar;
                                cmd.ExecuteNonQuery();


                                string script = @"<script type='text/javascript'>
                                        alert('Gasto común cargado correctamente.');
                                        </script>";
                                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

                            }
                            conectar.Close();
                            
                        }
                        else
                        {
                            string script = @"<script type='text/javascript'>
                                        alert('Archivo adjunto inválido. Sólo adjuntar archivos en formato pdf, png o jpg.');
                                        </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                        }
                    else
                    {
                        string script = @"<script type='text/javascript'>
                                        alert('El período seleccionado ya tiene asociado un documento de Gasto Común.');
                                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                    }


                }

                
                
            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

            }

        }

        protected void btnAdminUsu_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(viewUsuarios);

        }

        protected void btnListarGC_Click(object sender, EventArgs e)
        {

           
            
        }

        

        protected void ddlCondsListado_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridGastos();
        }

        private void BindGridGastos()
        {
            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT idGC, idCond, mes, anio, adjunto FROM gastocomun where idCond = '" + ddlCondsListado.Text + "'", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grvGastos.DataSource = ds.Tables[0];
            grvGastos.DataBind();
            conectar.Close();
        }

        protected void ddlCondsListado_DataBound(object sender, EventArgs e)
        {
            BindGridGastos();
        }

        protected void lnkBtnGC_Click(object sender, EventArgs e)
        {
            //obetener extensión del archivo antes de cargar el documento
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            LinkButton lbtn = (LinkButton)clickedRow.FindControl("lnkBtnGC");
            string nombre = lbtn.Text;
            string extension = nombre.Substring(nombre.Length - 4);

            if((extension==".pdf")||(extension==".PDF"))
            {
                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + nombre);
                Response.TransmitFile(Server.MapPath("~/GC/") + nombre);
                Response.End();
            }
            else if((extension == ".jpg") || (extension == ".JPG"))
            {
                Response.ContentType = "image/JPEG";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + nombre);
                Response.TransmitFile(Server.MapPath("~/GC/") + nombre);
                Response.End();
            }
            else if((extension == ".png") || (extension == ".PNG"))
            {
                Response.ContentType = "image/PNG";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + nombre);
                Response.TransmitFile(Server.MapPath("~/GC/") + nombre);
                Response.End();
            }
            
        }

        protected void btnListarUsu_Click(object sender, EventArgs e)
        {
            BindGrvUsuarios();
        }

        private void BindGrvUsuarios()
        {

            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT idUsu, login, password, Nombre, telefono, correo, tipo FROM usuarios", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grvUsuarios.DataSource = ds.Tables[0];
            grvUsuarios.DataBind();
            conectar.Close();
        }

        private void BindGrvUsuariosFiltro()
        {

            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT idUsu, login, password, Nombre, telefono, correo, tipo FROM usuarios where idUsu like '%" + txtFiltroUsuario.Text + "%' or login like '%" + txtFiltroUsuario.Text + "%' or Nombre like '%" + txtFiltroUsuario.Text + "%' or telefono like '%" + txtFiltroUsuario.Text + "%' or correo like '%" + txtFiltroUsuario.Text + "%'" , conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grvUsuarios.DataSource = ds.Tables[0];
            grvUsuarios.DataBind();
            conectar.Close();
        }

        protected void grvUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvUsuarios.EditIndex = e.NewEditIndex;
            BindGrvUsuarios();
        }

        protected void grvUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvUsuarios.EditIndex = -1;
            BindGrvUsuarios();
        }

        protected void btnListadoUsuarios_Click(object sender, EventArgs e)
        {
            panelListadoUsuarios.Visible = true;
            panelAgregarIUsuarios.Visible = false;
        }

        protected void btnAgregarUsuarios_Click(object sender, EventArgs e)
        {
            panelListadoUsuarios.Visible = false;
            panelAgregarIUsuarios.Visible = true;
        }

        protected void btnFiltrarUsu0_Click(object sender, EventArgs e)
        {
            BindGrvUsuariosFiltro();
        }

        protected void grvUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow fila = grvUsuarios.Rows[e.RowIndex];


                string idUsu = (grvUsuarios.Rows[fila.RowIndex].FindControl("lblIdUsuEdit") as Label).Text;
                string login = (grvUsuarios.Rows[fila.RowIndex].FindControl("txtLoginEdit") as TextBox).Text;
                string nombre = (grvUsuarios.Rows[fila.RowIndex].FindControl("txtNombreEdit") as TextBox).Text;
                string telefono = (grvUsuarios.Rows[fila.RowIndex].FindControl("txtTelefonoEdit") as TextBox).Text;
                string correo = (grvUsuarios.Rows[fila.RowIndex].FindControl("txtCorreoEdit") as TextBox).Text;


                MySqlConnection conectar;
                Connector connector = new Connector();
                conectar = connector.Conectar();

                using (MySqlCommand cmd = new MySqlCommand("UPDATE usuarios SET login = '" + login + "', Nombre = '" + nombre + "', telefono = '" + telefono + "', correo = '" + correo + "' WHERE idUsu = '" + idUsu + "'"))
                {
                    cmd.Connection = conectar;
                    conectar.Open();
                    cmd.ExecuteNonQuery();
                    conectar.Close();
                    string script = @"<script type='text/javascript'>
                                        alert('Usuario actualizado correctamente');
                                        </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                }
                conectar.Close();
                grvUsuarios.EditIndex = -1;
                BindGrvUsuarios();
            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

            }

            
        }

        protected void btnGuardarUsu_Click(object sender, EventArgs e)
        {
            
            try
            {
                if ((txtLoginUsuario.Text != "") && (txtNombreUsu.Text != "") && (txtTelefonoUsu.Text != "") && (txtCorreoUsu.Text != ""))
                {
                    Connector localConnector = new Connector();
                    bool exists = localConnector.getUsuarioExistente(txtLoginUsuario.Text);

                    if (exists == false)
                    {
                        string password = Helper.EncodePassword(string.Concat(txtLoginUsuario.Text, "inicio.1"));


                        MySqlConnection conectar;
                        Connector connector = new Connector();
                        conectar = connector.Conectar();

                        using (MySqlCommand cmd = new MySqlCommand("INSERT into usuarios (login, password, Nombre, telefono, correo, tipo) values (@login, @password, @nombre, @telefono, @correo, @tipo)"))
                        {

                            cmd.Parameters.AddWithValue("@login", txtLoginUsuario.Text);
                            cmd.Parameters.AddWithValue("@password", password);
                            cmd.Parameters.AddWithValue("@nombre", txtNombreUsu.Text);
                            cmd.Parameters.AddWithValue("@telefono", txtTelefonoUsu.Text);
                            cmd.Parameters.AddWithValue("@correo", txtCorreoUsu.Text);
                            cmd.Parameters.AddWithValue("@tipo", ddlTipoUsuarioAdd.SelectedValue);

                            cmd.Connection = conectar;
                            conectar.Open();
                            cmd.ExecuteNonQuery();
                            conectar.Close();
                        }

                        using (MySqlCommand cmd = new MySqlCommand("INSERT into notificaciones (loginUsu, notGC, notMensaje, notArticulos) values (@login, @notGC, @notMensaje, @notArticulos)"))
                        {

                            cmd.Parameters.AddWithValue("@login", txtLoginUsuario.Text);
                            cmd.Parameters.AddWithValue("@notGC", 0);
                            cmd.Parameters.AddWithValue("@notMensaje", 0);
                            cmd.Parameters.AddWithValue("@notArticulos", 0);
                            
                            cmd.Connection = conectar;
                            conectar.Open();
                            cmd.ExecuteNonQuery();
                            conectar.Close();
                        }

                        txtLoginUsuario.Text = "";
                        txtNombreUsu.Text = "";
                        txtTelefonoUsu.Text = "";
                        txtCorreoUsu.Text = "";

                        string script = @"<script type='text/javascript'>
                                        alert('Usuario creado correctamente.');
                                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                    }
                    else
                    {
                        string script = @"<script type='text/javascript'>
                                        alert('El login indicado ya existe para otro usuario, escriba uno diferente.');
                                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                    }
                }   
                else
                {
                    string script = @"<script type='text/javascript'>
                                        alert('Se deben llenar todos los campos solicitados.');
                                        </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                }
            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

            }



        }
        internal class Helper
        {
            public static string EncodePassword(string orPassword)
            {
                SHA1 sha1 = new SHA1CryptoServiceProvider();
                byte[] inputBytes = (new UnicodeEncoding()).GetBytes(orPassword);
                byte[] hash = sha1.ComputeHash(inputBytes);

                return Convert.ToBase64String(hash);
            }
        }

        protected void OnConfirm(object sender, EventArgs e)
        {
            try
            {

                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Si")
                {


                    LinkButton lbButtonReset = (LinkButton)sender;

                    GridViewRow fila = (GridViewRow)lbButtonReset.NamingContainer;


                    string idUsu = (grvUsuarios.Rows[fila.RowIndex].FindControl("lblIDUsu") as Label).Text;
                    string login = (grvUsuarios.Rows[fila.RowIndex].FindControl("lblLoginUsu") as Label).Text;

                    string password = Helper.EncodePassword(string.Concat(login, "inicio.1"));

                    MySqlConnection conectar;
                    Connector connector = new Connector();
                    conectar = connector.Conectar();

                    using (MySqlCommand cmd = new MySqlCommand("UPDATE usuarios SET password = '" + password + "' WHERE idUsu = '" + idUsu + "'"))
                    {
                        cmd.Connection = conectar;
                        conectar.Open();
                        cmd.ExecuteNonQuery();
                        conectar.Close();
                        string script = @"<script type='text/javascript'>
                                        alert('Contraseña restablecida correctamente');
                                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                    }
                    conectar.Close();
                    grvUsuarios.EditIndex = -1;
                    BindGrvUsuarios();
                }
                
            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

            }
        }

        protected void lnkEliminarUsu_Click(object sender, EventArgs e)
        {

        }

        protected void lnkEditUsu_Click(object sender, EventArgs e)
        {
            LinkButton lbButtonReset = (LinkButton)sender;
            GridViewRow fila = (GridViewRow)lbButtonReset.NamingContainer;

            string idUsuario = (grvUsuarios.Rows[fila.RowIndex].FindControl("lblIDUsu") as Label).Text;
            string login = (grvUsuarios.Rows[fila.RowIndex].FindControl("lblLoginUsu") as Label).Text;
            string nombreUsuario = (grvUsuarios.Rows[fila.RowIndex].FindControl("lblNombre") as Label).Text;
            string fonoUsuario = (grvUsuarios.Rows[fila.RowIndex].FindControl("lblTelefono") as Label).Text;
            string correo = (grvUsuarios.Rows[fila.RowIndex].FindControl("lblCorreo") as Label).Text;
            string tipoUsuario = (grvUsuarios.Rows[fila.RowIndex].FindControl("lblTipoUsuario") as Label).Text;

            pnlEditarUsuario.Visible = true;
            panelListadoUsuarios.Visible = false;

            lblIDUsuarioEdit.Text = idUsuario;
            lblLoginUsuarioEdit.Text = login;
            txtNombreUsuarioEdit.Text = nombreUsuario;
            txtFonoUsuarioEdit.Text = fonoUsuario;
            txtCorreoUsuarioEdit.Text = correo;
            ddlTipoUsuarioEdit.SelectedValue = tipoUsuario;

        
        }

        protected void btnRemoveUserList_Click(object sender, EventArgs e)
        {
            lbUsuAsignados.Items.Remove(lbUsuAsignados.SelectedItem);
        }

        protected void btnListadoGC_Click(object sender, EventArgs e)
        {
            pnlListadoGC.Visible = true;
            pnlCargarDetalleGC.Visible = false;
            pnlGCEncabezado.Visible = false;
        }

        protected void btnGCEncabezado_Click(object sender, EventArgs e)
        {
            pnlGCEncabezado.Visible = true;
            pnlListadoGC.Visible = false;
            pnlCargarDetalleGC.Visible = false;
        }

        protected void btnGCDetalle_Click(object sender, EventArgs e)
        {
            pnlCargarDetalleGC.Visible = true;
            pnlGCEncabezado.Visible = false;
            pnlListadoGC.Visible = false;
        }
        protected void btnListadoNoticias_Click(object sender, EventArgs e)
        {
            pnlListadoNoticias.Visible = true;
            pnlCrearNoticia.Visible = false;

            BindLisadoArticulos();

            pnlListadoArticulos.Visible = true;
            pnlEditArt.Visible = false;
        }

        private void BindLisadoArticulos()
        {

            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT noticias.id as id, noticias.titulo as titulo, noticias.html as html, noticias.idCond as idCond, noticias.creacion as creacion, noticias.modificacion as modificacion, usuarios.Nombre as nombreUsu, noticias.visible as visible FROM noticias, usuarios where noticias.idCond = '" + ddlCondsListadoArt.SelectedValue.ToString() + "' and usuarios.idUsu = noticias.idUsu", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grvListadoArticulos.DataSource = ds.Tables[0];
            grvListadoArticulos.DataBind();
            conectar.Close();
        }

        protected void btnCrearNoticia_Click(object sender, EventArgs e)
        {
            pnlListadoNoticias.Visible = false;
            pnlCrearNoticia.Visible = true;
            txtHtmlNoticia.Text = "";
            btnGuardarNoticia.Enabled = true;
            
        }

        protected void btnAdminNoticias_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(viewAdminNoticias);
            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT condominios.idCond, condominios.Nombre FROM condominios", conectar);
            DataSet ds = new DataSet();

            da.Fill(ds);
            ddlCondNoticias.DataSource = ds;
            ddlCondNoticias.DataValueField = "idCond";
            ddlCondNoticias.DataTextField = "Nombre";
            ddlCondNoticias.DataBind();

            ddlCondsListadoArt.DataSource = ds;
            ddlCondsListadoArt.DataValueField = "idCond";
            ddlCondsListadoArt.DataTextField = "Nombre";
            ddlCondsListadoArt.DataBind();

            conectar.Close();

            BindLisadoArticulos();
        }

        protected void btnGuardarNoticia_Click(object sender, EventArgs e)
        {
            try
            {
                
                    string titulo = txtTituloNoticia.Text.Trim();
                    string htmlNoticia = txtHtmlNoticia.Text;

                    string confirmValue = Request.Form["confirm_value_not"];
                    if (confirmValue == "Si")
                    {
                        if ((titulo != "") && (htmlNoticia != ""))
                        {


                            //Guardar Noticia

                            MySqlConnection conectar;
                            Connector connector = new Connector();
                            conectar = connector.Conectar();

                            using (MySqlCommand cmd = new MySqlCommand("INSERT into noticias (titulo, html, idCond, creacion, idUsu, visible) values (@titulo, @html, @idCond, @creacion, @idUsu, @visible)"))
                            {

                                cmd.Parameters.AddWithValue("@titulo", txtTituloNoticia.Text);
                                cmd.Parameters.AddWithValue("@html", txtHtmlNoticia.Text);
                                cmd.Parameters.AddWithValue("@idCond", ddlCondNoticias.SelectedValue.ToString());
                                cmd.Parameters.AddWithValue("@creacion", System.DateTime.Now);
                                cmd.Parameters.AddWithValue("@idUsu", idUsuarioActual);
                                cmd.Parameters.AddWithValue("@visible", 0);

                                cmd.Connection = conectar;
                                conectar.Open();
                                cmd.ExecuteNonQuery();
                                conectar.Close();
                            }

                            
                            

                            string script = @"<script type='text/javascript'>
                                        alert('Artículo guardado correctamente.');
                                        </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                            
                            btnPublicarNoticia.Visible = true;
                            btnGuardarCambios.Visible = true;
                        }
                        else
                        {
                            string script = @"<script type='text/javascript'>
                                        alert('Se debe completar el título y el cuerpo del artículo" + "'); </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                        }
                    }
                

                
            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
            }
        }

        protected void btnPublicarNoticia_Click(object sender, EventArgs e)
        {
            //try
           // {
                string titulo = txtTituloNoticia.Text.Trim();
                string htmlNoticia = txtHtmlNoticia.Text;

                string confirmValue = Request.Form["confirm_value_pub_not"];
                if (confirmValue == "Si")
                {
                    if ((titulo != "") && (htmlNoticia != ""))
                    {


                        MySqlConnection conectar;
                        Connector connector = new Connector();
                        conectar = connector.Conectar();

                       /* using (MySqlCommand cmd = new MySqlCommand("UPDATE noticias SET titulo = @titulo, html = @html, modificacion = @modificacion, visible = @visible WHERE id = " + lblIDArt.Text))
                        {
                            cmd.Parameters.AddWithValue("@titulo", titulo);
                            cmd.Parameters.AddWithValue("@html", htmlNoticia);
                            cmd.Parameters.AddWithValue("@modificacion", System.DateTime.Now);
                            cmd.Parameters.AddWithValue("@visible", true);

                        }*/
                        using (MySqlCommand cmd = new MySqlCommand("UPDATE noticias SET titulo = '" + titulo + "', html = '" + htmlNoticia + "', idCond = '" + ddlCondNoticias.SelectedValue.ToString() + "', visible = 1, modificacion = @modificacion WHERE id = LAST_INSERT_ID() AND idUsu = " + idUsuarioActual))
                        {
                            cmd.Parameters.AddWithValue("@modificacion", System.DateTime.Now);
                            cmd.Connection = conectar;
                            conectar.Open();
                            cmd.ExecuteNonQuery();
                            
                        }
                        

                        using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones, usuariosdeptos, usuarios SET notificaciones.notArticulos = 1 where usuariosdeptos.cond = @cond and usuariosdeptos.idUsu = usuarios.idUsu and usuarios.login = notificaciones.loginUsu"))
                        {
                            cmd.Parameters.AddWithValue("@cond", ddlCondNoticias.SelectedValue.ToString());

                            cmd.Connection = conectar;
                            cmd.ExecuteNonQuery();


                            string script = @"<script type='text/javascript'>
                                        alert('Artículo guardado y publicado correctmente');
                                        </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

                        }
                        conectar.Close();

                    }
                }

           // }
           /* catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

            }*/
        }

        protected void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            try
            {
                string titulo = txtTituloNoticia.Text.Trim();
                string htmlNoticia = txtHtmlNoticia.Text;


                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Si")
                {
                    if ((titulo != "") && (htmlNoticia != ""))
                    {
                        MySqlConnection conectar;
                        Connector connector = new Connector();
                        conectar = connector.Conectar();

                        using (MySqlCommand cmd = new MySqlCommand("UPDATE noticias SET titulo = '" + titulo + "', html = '" + htmlNoticia + "', idCond ='" + ddlCondNoticias.SelectedValue.ToString() + "' WHERE id = LAST_INSERT_ID() AND idUsu = " + idUsuarioActual))
                        {
                            cmd.Connection = conectar;
                            conectar.Open();
                            cmd.ExecuteNonQuery();
                            conectar.Close();
                            string script = @"<script type='text/javascript'>
                                        alert('Cambios guardados correctmente');
                                        </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                        }
                        conectar.Close();


                    }
                }
            }
            catch(Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
            }
        }

        protected void lnkbtnEditarArt_Click(object sender, EventArgs e)
        {
            LinkButton btnSender = (LinkButton)sender;
            GridViewRow fila = (GridViewRow)btnSender.NamingContainer;
            string htmlArt = (grvListadoArticulos.Rows[fila.RowIndex].FindControl("lblHTMLArt") as Label).Text;
            string tituloArt = (grvListadoArticulos.Rows[fila.RowIndex].FindControl("lblTituloArticulo") as Label).Text;
            string idArt = (grvListadoArticulos.Rows[fila.RowIndex].FindControl("lblIDArticulo") as Label).Text;

            pnlListadoArticulos.Visible = false;
            pnlEditArt.Visible = true;

            txtTituloEditArt.Text = tituloArt;
            txtEditArt.Text = htmlArt;
            lblIDArt.Text = idArt;
        }

        protected void btnArtEditVolver_Click(object sender, EventArgs e)
        {
            try
            {
                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Si")
                {
                    pnlEditArt.Visible = false;
                    pnlListadoArticulos.Visible = true;
                    BindLisadoArticulos();
                }
            }
            catch(Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

            }
        }

        protected void btnGuardarModArt_Click(object sender, EventArgs e)
        {
            try
            {
                string titulo = txtTituloEditArt.Text.Trim();
                string htmlNoticia = txtEditArt.Text;


                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Si")
                {
                    if ((titulo != "") && (htmlNoticia != ""))
                    {
                        MySqlConnection conectar;
                        Connector connector = new Connector();
                        conectar = connector.Conectar();

                       

                        using (MySqlCommand cmd = new MySqlCommand("UPDATE noticias SET titulo = @titulo, html = @html, modificacion = @modificacion WHERE id = " + lblIDArt.Text))
                        {
                            cmd.Parameters.AddWithValue("@titulo", titulo);
                            cmd.Parameters.AddWithValue("@html", htmlNoticia);
                            cmd.Parameters.AddWithValue("@modificacion", System.DateTime.Now);
             
                            cmd.Connection = conectar;
                            conectar.Open();
                            cmd.ExecuteNonQuery();
                            conectar.Close();
                            string script = @"<script type='text/javascript'>
                                        alert('Cambios guardados correctmente');
                                        </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                            BindLisadoArticulos();

                        }
                        conectar.Close();


                    }
                }
            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
            }
        }

        protected void btnPublicarArtMod_Click(object sender, EventArgs e)
        {
            try
            {
                string titulo = txtTituloEditArt.Text.Trim();
                string htmlNoticia = txtEditArt.Text;

                string confirmValue = Request.Form["confirm_value_pub_not"];
                if (confirmValue == "Si")
                {
                    if ((titulo != "") && (htmlNoticia != ""))
                    {


                        MySqlConnection conectar;
                        Connector connector = new Connector();
                        conectar = connector.Conectar();

                        using (MySqlCommand cmd = new MySqlCommand("UPDATE noticias SET titulo = @titulo, html = @html, modificacion = @modificacion, visible = @visible WHERE id = " + lblIDArt.Text))
                        {
                            cmd.Parameters.AddWithValue("@titulo", titulo);
                            cmd.Parameters.AddWithValue("@html", htmlNoticia);
                            cmd.Parameters.AddWithValue("@modificacion", System.DateTime.Now);
                            cmd.Parameters.AddWithValue("@visible", true);
                            cmd.Connection = conectar;
                            conectar.Open();
                            cmd.ExecuteNonQuery();
                            conectar.Close();
                            
                        }
                        using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones, usuariosdeptos, usuarios SET notificaciones.notArticulos = 1 where usuariosdeptos.cond = @cond and usuariosdeptos.idUsu = usuarios.idUsu and usuarios.login = notificaciones.loginUsu"))
                        {
                            cmd.Parameters.AddWithValue("@cond", ddlCondsListadoArt.SelectedValue.ToString());

                            cmd.Connection = conectar;
                            cmd.ExecuteNonQuery();


                            string script = @"<script type='text/javascript'>
                                        alert('Artículo guardado y publicado correctmente');
                                        </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

                        }
                        conectar.Close();

                    }
                }

            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

            }
        }

        protected void lnkbtnEliminarArt_Click(object sender, EventArgs e)
        {
            LinkButton btnSender = (LinkButton)sender;
            GridViewRow fila = (GridViewRow)btnSender.NamingContainer;

            
            string idArt = (grvListadoArticulos.Rows[fila.RowIndex].FindControl("lblIDArticulo") as Label).Text;

            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Si")
            {
                MySqlConnection conectar;
                Connector connector = new Connector();
                conectar = connector.Conectar();
                using (MySqlCommand cmd = new MySqlCommand("DELETE FROM noticias WHERE id = @id"))
                {
                    cmd.Parameters.AddWithValue("@id", idArt);
                    
                    cmd.Connection = conectar;
                    conectar.Open();
                    cmd.ExecuteNonQuery();
                    conectar.Close();
                    string script = @"<script type='text/javascript'>
                                        alert('Comunicado eliminado correctamente');
                                        </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                }
                conectar.Close();
                BindLisadoArticulos();
            }


            }

        protected void ddlCondNoticias_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lnkDesasociar_Click(object sender, EventArgs e)
        {
            //desasociar usuario del departamento asignado
            if (Session["idDeptoSel"] != null)
            {
                if (Session["idCondSel"] != null)
                {
                    try
                    {
                        string confirmValue = Request.Form["confirm_value"];
                        if (confirmValue == "Si")
                        {
                            if ((Session["idDeptoSel"].ToString() != "") && (Session["idCondSel"].ToString() != ""))
                            {
                                GridViewRow fila = ((LinkButton)sender).NamingContainer as GridViewRow;
                                LinkButton lbtn = (LinkButton)fila.FindControl("lnkDesasociar");


                                string idUsu = (grvUsuariosAsignadosDepto.Rows[fila.RowIndex].FindControl("lblIDUsu") as Label).Text;
                                string depto = Session["idDeptoSel"].ToString();
                                string condominio = Session["idCondSel"].ToString();
                                MySqlConnection conectar;
                                Connector connector = new Connector();
                                conectar = connector.Conectar();

                                using (MySqlCommand cmd = new MySqlCommand("DELETE FROM usuariosdeptos WHERE idUsu = " + idUsu + " and depto = " + depto + " and cond = '" + condominio + "'"))
                                {
                                    cmd.Connection = conectar;
                                    conectar.Open();
                                    cmd.ExecuteNonQuery();
                                    conectar.Close();
                                    string script = @"<script type='text/javascript'>
                                        alert('Usuario desasociado correctamente');
                                        </script>";
                                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                                }
                                BindGridUsuDeptos();
                                conectar.Close();

                            }
                            else
                            {
                                Response.Redirect("Login.aspx");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnReiniciarPassUsuarioEdit_Click(object sender, EventArgs e)
        {
            try
            {

                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Si")
                {
                    string idUsu = lblIDUsuarioEdit.Text;
                    string login = lblLoginUsuarioEdit.Text;

                    string password = Helper.EncodePassword(string.Concat(login, "inicio.1"));

                    MySqlConnection conectar;
                    Connector connector = new Connector();
                    conectar = connector.Conectar();

                    using (MySqlCommand cmd = new MySqlCommand("UPDATE usuarios SET password = '" + password + "' WHERE idUsu = '" + idUsu + "'"))
                    {
                        cmd.Connection = conectar;
                        conectar.Open();
                        cmd.ExecuteNonQuery();
                        conectar.Close();
                        string script = @"<script type='text/javascript'>
                                        alert('Contraseña restablecida correctamente');
                                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                    }
                    conectar.Close();
                    BindGrvUsuarios();
                }

            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

            }
        }

        protected void btnGuardarCambiosUsuarioEdit_Click(object sender, EventArgs e)
        {
            try
            {

                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Si")
                {
                    string idUsu = lblIDUsuarioEdit.Text;
                    
                    string nombre = txtNombreUsuarioEdit.Text;
                    string fono = txtFonoUsuarioEdit.Text;
                    string correo = txtCorreoUsuarioEdit.Text;
                    string tipo = ddlTipoUsuarioEdit.SelectedValue;
                    

                    MySqlConnection conectar;
                    Connector connector = new Connector();
                    conectar = connector.Conectar();

                    using (MySqlCommand cmd = new MySqlCommand("UPDATE usuarios SET Nombre = @nombre, telefono = @telefono, correo = @correo, tipo = @tipo WHERE idUsu = @idUsu"))
                    {
                        
                        cmd.Parameters.AddWithValue("@nombre", nombre);
                        cmd.Parameters.AddWithValue("@telefono", fono);
                        cmd.Parameters.AddWithValue("@correo", correo);
                        cmd.Parameters.AddWithValue("@tipo", tipo);
                        cmd.Parameters.AddWithValue("@idUsu", idUsu);
                        
                        cmd.Connection = conectar;
                        conectar.Open();
                        cmd.ExecuteNonQuery();
                        conectar.Close();
                        string script = @"<script type='text/javascript'>
                                        alert('Cambios guardados correctamente.');
                                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
                    }
                    conectar.Close();
                    pnlEditarUsuario.Visible = false;
                    panelListadoUsuarios.Visible = true;
                    BindGrvUsuarios();
                }

            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

            }
        }

        protected void btnEditarUsuarioVolver_Click(object sender, EventArgs e)
        {
            pnlEditarUsuario.Visible = false;
            panelListadoUsuarios.Visible = true;
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Session["idCondSel"] = null;
            Session["idDeptoSel"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void btnAgregarCondominio_Click(object sender, EventArgs e)
        {
            pnlCondominiosListado.Visible = false;
            pnlCondominiosAgregar.Visible = true;
        }

        protected void btnCrearCondominioCancelar_Click(object sender, EventArgs e)
        {
            pnlCondominiosListado.Visible = true;
            pnlCondominiosAgregar.Visible = false;
        }

        protected void btnCrearCondominioGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection conectar;
                Connector connector = new Connector();
                conectar = connector.Conectar();

                using (MySqlCommand cmd = new MySqlCommand("INSERT into condominios (idCond, Nombre, Direccion) values (@idCond, @Nombre, @Direccion)"))
                {

                    cmd.Parameters.AddWithValue("@idCond", txtCrearCondominioCodigo.Text);
                    cmd.Parameters.AddWithValue("@Nombre", txtCrearCondominioNombre.Text);
                    cmd.Parameters.AddWithValue("@Direccion", txtCrearCondominioDireccion.Text);
                    
                    cmd.Connection = conectar;
                    conectar.Open();
                    cmd.ExecuteNonQuery();
                    conectar.Close();
                }
                BindGridCond();
                
                string script = @"<script type='text/javascript'>
                                        alert('Condominio creado correctamente.');
                                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

                pnlCondominiosListado.Visible = true;
                pnlCondominiosAgregar.Visible = false;

                
            }catch(Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
            }
        }

        protected void btnAgregarDeptoAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection conectar;
                Connector connector = new Connector();
                conectar = connector.Conectar();

                using (MySqlCommand cmd = new MySqlCommand("INSERT into deptos (depto, cond) values (@depto, @cond)"))
                {

                    cmd.Parameters.AddWithValue("@depto", txtAgregarDepto.Text);
                    cmd.Parameters.AddWithValue("@cond", grvCondominiosListado.SelectedDataKey.Value);
                   

                    cmd.Connection = conectar;
                    conectar.Open();
                    cmd.ExecuteNonQuery();
                    conectar.Close();
                }
                BindGridDeptos();

                string script = @"<script type='text/javascript'>
                                        alert('Departamento agregado correctamente.');
                                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

                


            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "'); </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
            }
        }
    }
}