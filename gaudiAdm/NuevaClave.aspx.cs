using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gaudiAdm
{
    public partial class NuevaClave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            try
            {

                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Si")
                {
                    string login = Session["usuario"].ToString();
                    

                    string password = Helper.EncodePassword(string.Concat(login, txtConfClave.Text));

                    MySqlConnection conectar;
                    Connector connector = new Connector();
                    conectar = connector.Conectar();

                    using (MySqlCommand cmd = new MySqlCommand("UPDATE usuarios SET password = '" + password + "' WHERE login = '" + login + "'"))
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

                    string tipoUsuario = connector.getTipoUsuario(login);
                    

                    if (tipoUsuario == "Usuario")
                    {
                        Response.Redirect("MainAccess.aspx");
                    }
                    else
                    {
                        Response.Redirect("Admin.aspx");
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

        protected void txtNuevaClave_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtConfClave_TextChanged(object sender, EventArgs e)
        {

        }
    }
}