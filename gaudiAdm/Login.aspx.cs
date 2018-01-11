using System;
using System.Web.UI;
using System.Xml;

namespace gaudiAdm
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Uri ruta = GetImage();
            string url = ruta.ToString();
            url = url.Replace("_1366x768", "_1920x1080");
            background.Style["background-image"] = Page.ResolveUrl(url);
            txtUsuario.Focus();
        }

       

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            Connector conectar = new Connector();
            bool entrar = conectar.login(txtUsuario.Text, txtPassword.Text);

            if(entrar==true)
            {
                //lblMensaje.Text = "Ingreso Correcto";
                string tipoUsuario = conectar.getTipoUsuario(txtUsuario.Text);
                Session["usuario"] = txtUsuario.Text;

                if(txtPassword.Text == "inicio.1")
                {
                    
                    Response.Redirect("NuevaClave.aspx");
                }
                else if(tipoUsuario == "Usuario")
                {
                    Response.Redirect("MainAccess.aspx");
                }
                else
                {
                    Response.Redirect("Admin.aspx");
                }
                
                
                
            }
            else
            {
                string scriptx = @"<script type='text/javascript'>
                                        alert('Usuario o contraseña incorrectos.');
                                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alerta", scriptx, false);

            }
        }

        protected void btnEntrar_Click1(object sender, EventArgs e)
        {

        }

        protected void txtUsuario_TextChanged(object sender, EventArgs e)
        {

        }

        public Uri GetImage()
        {
            if (System.Net.NetworkInformation.NetworkInterface.GetIsNetworkAvailable() == false)
            {
                throw new System.Net.WebException("Could not establish a connection to bing.com");
            }
            System.Net.WebClient webClient = new System.Net.WebClient();
            String result = webClient.DownloadString("http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=es-CL");
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(result);
            return new Uri(@"http://www.bing.com/" + doc.SelectSingleNode(@"/images/image/url").InnerText);
        }



    }
    
}