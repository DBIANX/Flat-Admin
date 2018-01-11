using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace gaudiAdm
{
    public partial class MainAccess : System.Web.UI.Page
    {
        string usuarioActual;
        string idUsuarioActual;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            imgButtonMensajes.Attributes.Add("onmouseover", "this.src = 'Images/MensajesBtnHold.png'");
            imgButtonMensajes.Attributes.Add("onmouseout", "this.src = 'Images/MensajesBtn.png'");

            imgButtonComunicados.Attributes.Add("onmouseover", "this.src = 'Images/ComunicadosBtnHold.png'");
            imgButtonComunicados.Attributes.Add("onmouseout", "this.src = 'Images/ComunicadosBtn.png'");

            imgButtonGC.Attributes.Add("onmouseover", "this.src = 'Images/GCBtnHold.png'");
            imgButtonGC.Attributes.Add("onmouseout", "this.src = 'Images/GCBtn.png'");

            imgButtonInicio.Attributes.Add("onmouseover", "this.src = 'Images/InicioBtnHold.png'");
            imgButtonInicio.Attributes.Add("onmouseout", "this.src = 'Images/InicioBtn.png'");

            if (!IsPostBack)
            {
                mvMain.SetActiveView(viewHome);
            }


            Connector connector = new Connector();
            if (Session["usuario"] != null)
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
            UpdateNot();

            MySqlConnection conectar;
            
            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT noticias.html, noticias.id from noticias, usuarios,usuariosdeptos where noticias.idCond = usuariosdeptos.cond and visible = 1 and usuarios.idUsu = usuariosdeptos.idUsu and usuarios.login = '" + usuarioActual + "' ORDER BY noticias.id DESC LIMIT 1 ", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                imgUltComunicado.Visible = true;
                divUltComunicadoHome.InnerHtml = ds.Tables[0].Rows[0][0].ToString();
            }
            conectar.Close();


        }

        


        private void UpdateNot()
        {
            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();
            string consulta = "select notGC, notMensaje, notArticulos from notificaciones WHERE loginUsu = '" + lblLoginUser.Text + "'";
            MySqlDataAdapter da = new MySqlDataAdapter(consulta, conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);

            string notGC = ds.Tables[0].Rows[0][0].ToString();
            string notMensajes = ds.Tables[0].Rows[0][1].ToString();
            string notArticulos = ds.Tables[0].Rows[0][2].ToString();

            conectar.Close();

            if(notGC == "1")
            {
                btnGoGC.Text = "Hay un nuevo gasto común publicado";
                imgNotGC.ImageUrl = "Images/exclamation.png";
            }
            else
            {
                btnGoGC.Text = "No hay nuevos gastos comunes publicados";
                imgNotGC.ImageUrl = "Images/ticket.png";
            }

            if (notMensajes == "1")
            {
                btnNotMensajes.Text = "Tiene nuevos mensajes sin leer";
                imgNotMensajes.ImageUrl = "Images/exclamation.png";
            }
            else
            {
                btnNotMensajes.Text = "No hay nuevos mensajes";
                imgNotMensajes.ImageUrl = "Images/ticket.png";
            }
            if (notArticulos == "1")
            {
                btnNotArticulos.Text = "Hay nuevos comunicados sin revisar";
                imgNotArticulos.ImageUrl = "Images/exclamation.png";
            }
            else
            {
                btnNotArticulos.Text = "No hay nuevos comunicados";
                imgNotArticulos.ImageUrl = "Images/ticket.png";
            }

        }

        protected void btnNotGC_Click(object sender, EventArgs e)
        {

            bindDdlCondListado();
            bindGrvListadoGC();
            mvMain.SetActiveView(viewMainGC);
            //actualizar notGC a 0 en BD
            MySqlConnection conectar;
            Connector connector = new Connector();
            conectar = connector.Conectar();
            conectar.Open();
            using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones SET notMensaje = 0 where loginUsu = '" + usuarioActual + "'"))
            {
                cmd.Connection = conectar;
                cmd.ExecuteNonQuery();
            }
            conectar.Close();
        }
        private void bindDdlCondListado()
        {
            try
            {


                MySqlConnection conectar;
                Connector connector = new Connector();

                conectar = connector.Conectar();
                conectar.Open();
                string consulta = "select condominios.Nombre as Nombre, condominios.idCond as idCond from condominios, usuariosdeptos WHERE usuariosdeptos.cond = condominios.idCond and usuariosdeptos.idUsu = " + idUsuarioActual;
                MySqlDataAdapter da = new MySqlDataAdapter(consulta, conectar);
                DataSet ds = new DataSet();
                da.Fill(ds);

                ddlCondListadoGC.DataSource = ds.Tables[0];
                ddlCondListadoGC.DataValueField = "idCond";
                ddlCondListadoGC.DataTextField = "Nombre";
                ddlCondListadoGC.DataBind();

                ddlCondominiosMensajes.DataSource = ds.Tables[0];
                ddlCondominiosMensajes.DataValueField = "idCond";
                ddlCondominiosMensajes.DataTextField = "Nombre";
                ddlCondominiosMensajes.DataBind();

                ddlCondominiosComunicados.DataSource = ds.Tables[0];
                ddlCondominiosComunicados.DataValueField = "idCond";
                ddlCondominiosComunicados.DataTextField = "Nombre";
                ddlCondominiosComunicados.DataBind();

                ListItem defaultSel = new ListItem("Seleccione un condominio");
                

                conectar.Close();
                if (ddlCondListadoGC.Items.Count==0)
                {
                    ListItem item = new ListItem("No tiene departamentos asignados");
                    ddlCondListadoGC.Items.Add(item);
                }
                if (ddlCondominiosMensajes.Items.Count == 0)
                {
                    ListItem item = new ListItem("No tiene departamentos asignados");
                    ddlCondominiosMensajes.Items.Add(item);
                }

                if(ddlCondListadoGC.Items.Count >1)
                {
                    ddlCondListadoGC.Items.Insert(0, defaultSel);
                }
                if (ddlCondominiosMensajes.Items.Count > 1)
                {
                    ddlCondominiosMensajes.Items.Insert(0, defaultSel);
                }


            }
            catch(Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "');</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
            }
        }

        private void bindDeptosUsu()
        {
            try
            {


                MySqlConnection conectar;
                Connector connector = new Connector();

                conectar = connector.Conectar();
                conectar.Open();
                string consulta = "select depto FROM usuariosdeptos WHERE cond = '" + ddlCondominiosMensajes.SelectedValue +"' AND idUsu = " + idUsuarioActual;
                MySqlDataAdapter da = new MySqlDataAdapter(consulta, conectar);
                DataSet ds = new DataSet();
                da.Fill(ds);

                ddlDeptosMensajes.DataSource = ds.Tables[0];
                ddlDeptosMensajes.DataValueField = "depto";
                ddlDeptosMensajes.DataTextField = "depto";
                ddlDeptosMensajes.DataBind();
                     

                conectar.Close();
               

            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "');</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
            }
        }

        private void bindGrvListadoGC()
        {
            try
            {


                MySqlConnection conectar;
                Connector connector = new Connector();

                conectar = connector.Conectar();
                conectar.Open();
                string consulta = "select meses.Nombre as Mes, gastocomun.adjunto as Adjunto from meses, gastocomun WHERE gastocomun.anio = " + ddlAñoListadoGC.SelectedValue +  " and gastocomun.idCond = '" + ddlCondListadoGC.SelectedValue + "' and gastocomun.mes = meses.id";
                MySqlDataAdapter da = new MySqlDataAdapter(consulta, conectar);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grvListadoGC.DataSource = ds.Tables[0];
                
                grvListadoGC.DataBind();
                conectar.Close();
                

            }
            catch (Exception ex)
            {
                string script = @"<script type='text/javascript'>
                                        alert('Error: " + ex.Message + "');</script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);
            }
        }

        protected void ibtnDescargarListadoGC_Click(object sender, ImageClickEventArgs e)
        {
            //obetener extensión del archivo antes de cargar el documento
            GridViewRow clickedRow = ((ImageButton)sender).NamingContainer as GridViewRow;
            ImageButton lbtn = (ImageButton)clickedRow.FindControl("ibtnDescargarListadoGC");
            string nombre = lbtn.AlternateText;
            string extension = nombre.Substring(nombre.Length - 4);

            if ((extension == ".pdf") || (extension == ".PDF"))
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + nombre);
                Response.TransmitFile(Server.MapPath("~/GC/") + nombre);
                Response.End();
            }
            else if ((extension == ".jpg") || (extension == ".JPG"))
            {
                Response.ContentType = "image/JPEG";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + nombre);
                Response.TransmitFile(Server.MapPath("~/GC/") + nombre);
                Response.End();
            }
            else if ((extension == ".png") || (extension == ".PNG"))
            {
                Response.ContentType = "image/PNG";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + nombre);
                Response.TransmitFile(Server.MapPath("~/GC/") + nombre);
                Response.End();
            }
        }

        protected void ibtnVerListadoGC_Click(object sender, ImageClickEventArgs e)
        {
            //obetener extensión del archivo antes de cargar el documento
            GridViewRow clickedRow = ((ImageButton)sender).NamingContainer as GridViewRow;
            ImageButton lbtn = (ImageButton)clickedRow.FindControl("ibtnVerListadoGC");
            string nombre = lbtn.AlternateText;
            string extension = nombre.Substring(nombre.Length - 4);

            string ruta = "/GC/" + nombre;
            Page.ClientScript.RegisterStartupScript(Page.GetType(), null, "window.open('" + ruta + "', '_newtab')",true);
            mvMain.SetActiveView(viewMainGC);
        }

        protected void btnGoGC_Click(object sender, EventArgs e)
        {
            bindDdlCondListado();
            bindGrvListadoGC();
            mvMain.SetActiveView(viewMainGC);
            btnGoGC.Text = "No hay nuevos gastos comunes publicados";
            imgNotGC.ImageUrl = "Images/ticket.png";

            //actualizar notGC a 0 en BD
            MySqlConnection conectar;
            Connector connector = new Connector();
            conectar = connector.Conectar();
            conectar.Open();
            using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones SET notGC = 0 where loginUsu = '" + usuarioActual + "'"))
            {
                cmd.Connection = conectar;
                cmd.ExecuteNonQuery();
            }
            conectar.Close();
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void btnMensajes_Click(object sender, EventArgs e)
        {
            mvMain.SetActiveView(viewMainMensajes);
            bindDdlCondListado();
            bindDeptosUsu();
            BindListConversaciones();
            BindGrvMensajes();
            btnNotMensajes.Text = "No hay nuevos mensajes";
            imgNotMensajes.ImageUrl = "Images/ticket.png";

            //actualizar notGC a 0 en BD
            MySqlConnection conectar;
            Connector connector = new Connector();
            conectar = connector.Conectar();
            conectar.Open();
            using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones SET notMensaje = 0 where loginUsu = '" + usuarioActual + "'"))
            {
                cmd.Connection = conectar;
                cmd.ExecuteNonQuery();
            }
            conectar.Close();
        }
        private void BindListConversaciones()
        {
            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT DISTINCT mensajes.titulo as Titulo FROM mensajes where depto = " + ddlDeptosMensajes.SelectedValue + " and cond = '" + ddlCondominiosMensajes.SelectedValue + "' order by mensajes.fechahora DESC", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);

            lstbMensajes.DataSource = ds.Tables[0];
            lstbMensajes.DataTextField = "Titulo";
            lstbMensajes.DataValueField = "Titulo";
            lstbMensajes.DataBind();
            conectar.Close();

            int lineasCount = ds.Tables[0].Rows.Count;
            
            
            
            if(lineasCount == 0)
            {
                lstbMensajes.Items.Add("No hay mensajes");
            }
            else
            {
                lstbMensajes.Rows = lineasCount;
            }


        }
        private void BindGrvMensajes()
        {
            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT mensajes.mensajeDepto as Enviado, mensajes.mensajeAdmin as Recibido, mensajes.titulo as Titulo, mensajes.fechahora as Fecha, mensajes.adjunto as Adjunto, mensajes.flagadjunto as FAdjunto FROM mensajes where depto = " + ddlDeptosMensajes.SelectedValue + " and cond = '" + ddlCondominiosMensajes.SelectedValue + "' and titulo = '" + lstbMensajes.SelectedValue.ToString() + "' order by mensajes.fechahora DESC", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);

            grvMensajes.DataSource = ds.Tables[0];
            grvMensajes.DataBind();
            conectar.Close();
           
        }

        

        protected void ddlDeptosMensajes_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrvMensajes();
        }

        protected void ddlCondominiosMensajes_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindDeptosUsu();
        }

        protected void ddlCondListadoGC_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnDescargarAdjuntoEnviado_Click(object sender, EventArgs e)
        {

        }

        protected void btnDescargarAdjunto_Click(object sender, EventArgs e)
        {
            //obetener extensión del archivo antes de cargar el documento
            GridViewRow clickedRow = ((Button)sender).NamingContainer as GridViewRow;
            Label lbtn = (Label)clickedRow.FindControl("lblGrvMensajesAdjunto");
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

        protected void txtGrvMensajesRecibido_DataBinding(object sender, EventArgs e)
        {
            
        }


        protected void lblFechaEnviado_DataBinding(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((Label)sender).NamingContainer as GridViewRow;
            TextBox txtMensajeEnviado = (TextBox)clickedRow.FindControl("txtGrvMensajesEnviado");


            if (txtMensajeEnviado.Text == "")
            {
                ((Label)clickedRow.FindControl("lblEnviadoText")).Visible = false;
                ((Label)clickedRow.FindControl("lblFechaEnviado")).Visible = false;
                ((TextBox)clickedRow.FindControl("txtGrvMensajesEnviado")).Visible = false;
                ((Label)clickedRow.FindControl("lblGrvMensajesOrigenTitulo")).Text = "Recibido:";
            }
            else
            {
                ((Label)clickedRow.FindControl("lblRecibidoText")).Visible = false;
                ((Label)clickedRow.FindControl("lblFechaMensaje")).Visible = false;
                ((TextBox)clickedRow.FindControl("txtGrvMensajesRecibido")).Visible = false;
                ((Button)clickedRow.FindControl("btnGrvMensajesResponder")).Visible = false;
                ((Label)clickedRow.FindControl("lblGrvMensajesOrigenTitulo")).Text = "Enviado:";
            }
            string textoEnviado = ((TextBox)clickedRow.FindControl("txtGrvMensajesEnviado")).Text;
            string textoRecibido = ((TextBox)clickedRow.FindControl("txtGrvMensajesRecibido")).Text;

            string[] stringSeparators = new string[] { "\n" };
            string[] lineasEnviadas = textoEnviado.Split(stringSeparators, StringSplitOptions.None);
            string[] lineasRecibidas = textoRecibido.Split(stringSeparators, StringSplitOptions.None);
            ((TextBox)clickedRow.FindControl("txtGrvMensajesRecibido")).Rows = lineasRecibidas.Length;
            ((TextBox)clickedRow.FindControl("txtGrvMensajesEnviado")).Rows = lineasEnviadas.Length;


        }

        protected void lblFechaMensaje_DataBinding(object sender, EventArgs e)
        {
           
        }

        protected void txtGrvMensajesRecibido_DataBinding1(object sender, EventArgs e)
        {
            
        }

        protected void lstbMensajes_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrvMensajes();
            Session["idDeptoSel"] = ddlDeptosMensajes.SelectedValue.ToString();
            Session["idCondSel"] = ddlCondominiosMensajes.SelectedValue.ToString();
            lblAsuntoRespuesta.Text = lstbMensajes.SelectedValue.ToString();
        }

        protected void grvMensajes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnGrvMensajesResponder_Click(object sender, EventArgs e)
        {

            
        }

        protected void btnCerrarRespuesta_Click(object sender, EventArgs e)
        {
            Session["Asunto"] = "";
        }

        protected void btnNotMensajes_Click(object sender, EventArgs e)
        {
            mvMain.SetActiveView(viewMainMensajes);
            bindDdlCondListado();
            bindDeptosUsu();
            BindListConversaciones();
            BindGrvMensajes();
            btnNotMensajes.Text = "No hay nuevos mensajes";
            imgNotMensajes.ImageUrl = "Images/ticket.png";

            //actualizar notGC a 0 en BD
            MySqlConnection conectar;
            Connector connector = new Connector();
            conectar = connector.Conectar();
            conectar.Open();
            using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones SET notMensaje = 0 where loginUsu = '" + usuarioActual + "'"))
            {
                cmd.Connection = conectar;
                cmd.ExecuteNonQuery();
            }
            conectar.Close();
        }

        protected void btnArticulos_Click(object sender, EventArgs e)
        {
            mvMain.SetActiveView(viewComunicados);
            BindGrvComunicados();
        }
        private void BindGrvComunicados()
        {
            MySqlConnection conectar;
            Connector connector = new Connector();

            conectar = connector.Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT titulo, html as Comunicado, modificacion as Fecha, id from noticias where idCond = '" + ddlCondominiosComunicados.SelectedValue +"'and visible = 1 order by id desc", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);

            grvComunicados.DataSource = ds.Tables[0];
            grvComunicados.DataBind();
            conectar.Close();
            
        }

        protected void txtHtmlPlain_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtComunicadoHtml_TextChanged(object sender, EventArgs e)
        {

        }

        protected void imgButtonMensajes_Click(object sender, ImageClickEventArgs e)
        {
            mvMain.SetActiveView(viewMainMensajes);
            bindDdlCondListado();
            bindDeptosUsu();
            BindListConversaciones();
            BindGrvMensajes();
            btnNotMensajes.Text = "No hay nuevos mensajes";
            imgNotMensajes.ImageUrl = "Images/ticket.png";

            //actualizar notGC a 0 en BD
            MySqlConnection conectar;
            Connector connector = new Connector();
            conectar = connector.Conectar();
            conectar.Open();
            using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones SET notMensaje = 0 where loginUsu = '" + usuarioActual + "'"))
            {
                cmd.Connection = conectar;
                cmd.ExecuteNonQuery();
            }
            conectar.Close();
        }

        protected void imgButtonComunicados_Click(object sender, ImageClickEventArgs e)
        {
            mvMain.SetActiveView(viewComunicados);
            bindDdlCondListado();
            BindGrvComunicados();
        }

        protected void imgButtonGC_Click(object sender, ImageClickEventArgs e)
        {
            bindDdlCondListado();
            bindGrvListadoGC();
            mvMain.SetActiveView(viewMainGC);
            //actualizar notGC a 0 en BD
            MySqlConnection conectar;
            Connector connector = new Connector();
            conectar = connector.Conectar();
            conectar.Open();
            using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones SET notMensaje = 0 where loginUsu = '" + usuarioActual + "'"))
            {
                cmd.Connection = conectar;
                cmd.ExecuteNonQuery();
            }
            conectar.Close();
        }

        protected void grvComunicados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvComunicados.PageIndex = e.NewPageIndex;
            BindGrvComunicados();
        }

        protected void btnNotArticulos_Click(object sender, EventArgs e)
        {
            mvMain.SetActiveView(viewComunicados);
            bindDdlCondListado();
            BindGrvComunicados();

            btnNotArticulos.Text = "No hay nuevos comunicados";
            imgNotArticulos.ImageUrl = "Images/ticket.png";

            //actualizar notGC a 0 en BD
            MySqlConnection conectar;
            Connector connector = new Connector();
            conectar = connector.Conectar();
            conectar.Open();
            using (MySqlCommand cmd = new MySqlCommand("UPDATE notificaciones SET notArticulos = 0 where loginUsu = '" + usuarioActual + "'"))
            {
                cmd.Connection = conectar;
                cmd.ExecuteNonQuery();
            }
            conectar.Close();
        }

        protected void btnNuevaConv_Click(object sender, EventArgs e)
        {
            
        }

        protected void ddlDeptosMensajes_DataBound(object sender, EventArgs e)
        {
            Session["idDeptoSel"] = ddlDeptosMensajes.SelectedValue.ToString();
            Session["idCondSel"] = ddlCondominiosMensajes.SelectedValue.ToString();
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            if ((txtAsuntoMensaje.Text != "") && (txtMensajeNuevo.Text != ""))
            {
                //try
                // {
                string fileName = "";
                int fileUploaded = 0;
                if (FileUploadAdjuntoMensajeNuevo.HasFile)
                {
                    String extension = System.IO.Path.GetExtension(FileUploadAdjuntoMensajeNuevo.FileName).ToLower();

                    if ((extension == ".pdf") || (extension == ".jpg") || (extension == ".png") || (extension == ".PDF") || (extension == ".JPG") || (extension == ".PNG"))
                    {
                        fileName = FileUploadAdjuntoMensajeNuevo.FileName;
                        string path = Server.MapPath("~/Adjuntos/");
                        FileUploadAdjuntoMensajeNuevo.PostedFile.SaveAs(Server.MapPath("~/Adjuntos/") + FileUploadAdjuntoMensajeNuevo.FileName);
                        fileUploaded = 1;
                    }
                    else
                    {
                        string scriptx = @"<script type='text/javascript'>
                                        alert('Extensión de archivo no permitida. Sólo adjuntar pdf, jpg, png.');
                                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", scriptx, false);
                    }


                }

                MySqlConnection conectar;
                Connector connector = new Connector();
                conectar = connector.Conectar();

                using (MySqlCommand cmd = new MySqlCommand("INSERT into mensajes (depto, cond, titulo, mensajeDepto, adjunto, flagadjunto) values (@depto, @cond, @titulo, @mensajeAdmin, @adjunto, @flag)"))
                {
                    cmd.Parameters.AddWithValue("@depto", Session["idDeptoSel"].ToString());
                    cmd.Parameters.AddWithValue("@cond", Session["idCondSel"].ToString());
                    cmd.Parameters.AddWithValue("@titulo", txtAsuntoMensaje.Text);
                    cmd.Parameters.AddWithValue("@mensajeAdmin", txtMensajeNuevo.Text);
                    cmd.Parameters.AddWithValue("@adjunto", fileName);
                    cmd.Parameters.AddWithValue("@flag", fileUploaded);



                    cmd.Connection = conectar;
                    conectar.Open();
                    cmd.ExecuteNonQuery();

                    txtMensajeNuevo.Text = null;
                    txtAsuntoMensaje.Text = null;
                    BindListConversaciones();
                    BindGrvMensajes();
                }



                conectar.Close();



                string script = @"<script type='text/javascript'>
                                        alert('Mensaje enviado correctamente');
                                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

                // }
                /*  catch (Exception ex)
                  {
                      string script = @"<script type='text/javascript'>
                                          alert('Error al enviar: '" + ex.Message + "'); </script>";
                      ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

                  }*/
            }
            else
            {
                string script = @"<script type='text/javascript'>
                                        alert('Se debe ingresar un mensaje e indicar el asunto.');
                                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", script, false);

            }
        }

        protected void btnEnviarRespuesta_Click(object sender, EventArgs e)
        {
            if (txtMensajeRespuesta.Text != "")
            {
                try
                {
                string fileName = "";
                int fileUploaded = 0;
                if (FileUploadAdjuntoRespuesta.HasFile)
                {
                    String extension = System.IO.Path.GetExtension(FileUploadAdjuntoRespuesta.FileName).ToLower();

                    if ((extension == ".pdf") || (extension == ".jpg") || (extension == ".png") || (extension == ".PDF") || (extension == ".JPG") || (extension == ".PNG"))
                    {
                        fileName = FileUploadAdjuntoRespuesta.FileName;
                        string path = Server.MapPath("~/Adjuntos/");
                        FileUploadAdjuntoRespuesta.PostedFile.SaveAs(Server.MapPath("~/Adjuntos/") + FileUploadAdjuntoMensajeNuevo.FileName);
                        fileUploaded = 1;
                    }
                    else
                    {
                        string scriptx = @"<script type='text/javascript'>
                                        alert('Extensión de archivo no permitida. Sólo adjuntar pdf, jpg, png.');
                                        </script>";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", scriptx, false);
                    }


                }

                MySqlConnection conectar;
                Connector connector = new Connector();
                conectar = connector.Conectar();

                using (MySqlCommand cmd = new MySqlCommand("INSERT into mensajes (depto, cond, titulo, mensajeDepto, adjunto, flagadjunto) values (@depto, @cond, @titulo, @mensajeAdmin, @adjunto, @flag)"))
                {
                    cmd.Parameters.AddWithValue("@depto", Session["idDeptoSel"].ToString());
                    cmd.Parameters.AddWithValue("@cond", Session["idCondSel"].ToString());
                    cmd.Parameters.AddWithValue("@titulo", lblAsuntoRespuesta.Text);
                    cmd.Parameters.AddWithValue("@mensajeAdmin", txtMensajeRespuesta.Text);
                    cmd.Parameters.AddWithValue("@adjunto", fileName);
                    cmd.Parameters.AddWithValue("@flag", fileUploaded);



                    cmd.Connection = conectar;
                    conectar.Open();
                    cmd.ExecuteNonQuery();

                    txtMensajeRespuesta.Text = null;
                    lblAsuntoRespuesta.Text = null;
                    BindListConversaciones();
                    BindGrvMensajes();
                }



                conectar.Close();



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

        protected void imgButtonInicio_Click(object sender, ImageClickEventArgs e)
        {
            mvMain.SetActiveView(viewHome);
        }
    }
}