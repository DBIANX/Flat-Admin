using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gaudiAdm
{
    public partial class NuevoMensajeConv : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            if ((txtAsuntoRespuesta.Text != "") && (txtMensajeRespuesta.Text != ""))
            {
                //try
               // {
                    string fileName = "";
                    int fileUploaded = 0;
                    if (FileUpload.HasFile)
                    {
                        String extension = System.IO.Path.GetExtension(FileUpload.FileName).ToLower();

                        if ((extension == ".pdf") || (extension == ".jpg") || (extension == ".png") || (extension == ".PDF") || (extension == ".JPG") || (extension == ".PNG"))
                        {
                            fileName = FileUpload.FileName;
                            string path = Server.MapPath("~/Adjuntos/");
                            FileUpload.PostedFile.SaveAs(Server.MapPath("~/Adjuntos/") + FileUpload.FileName);
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
                        cmd.Parameters.AddWithValue("@titulo", txtAsuntoRespuesta.Text);
                        cmd.Parameters.AddWithValue("@mensajeAdmin", txtMensajeRespuesta.Text);
                        cmd.Parameters.AddWithValue("@adjunto", fileName);
                        cmd.Parameters.AddWithValue("@flag", fileUploaded);



                        cmd.Connection = conectar;
                        conectar.Open();
                        cmd.ExecuteNonQuery();

                        txtMensajeRespuesta.Text = null;
                        txtAsuntoRespuesta.Text = null;
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
    }
}