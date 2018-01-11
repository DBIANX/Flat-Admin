using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Data;

namespace gaudiAdm
{
    public class Connector
    {
        MySqlConnection conectar;

        public Connector()
        {
            conectar = new MySqlConnection("server=mysql7001.site4now.net; database=db_a2fe9d_gaudi; Uid=a2fe9d_gaudi; pwd=Jedisith123;");
            //conectar = new MySqlConnection("server=127.0.0.1; database=gaudi; Uid=root; pwd=;");
        }
        public MySqlConnection Conectar()
        {
            conectar = new MySqlConnection("server=mysql7001.site4now.net; database=db_a2fe9d_gaudi; Uid=a2fe9d_gaudi; pwd=Jedisith123;");
            //conectar = new MySqlConnection("server=127.0.0.1; database=gaudi; Uid=root; pwd=;");
            return conectar;
        }
        public bool login(string login, string pass)
        {
            string password = Helper.EncodePassword(string.Concat(login, pass));
            bool ingCorrecto = false;
            string consulta = "select login, password from usuarios where login = '{0}' and password = '{1}'";

            MySqlConnection conec = Conectar();
            conec.Open();

            MySqlCommand query = conectar.CreateCommand();

            query.CommandText = String.Format(consulta, login, password);
            MySqlDataReader reader = query.ExecuteReader();

            if (reader.HasRows)
            {
                ingCorrecto = true;

            }

            return ingCorrecto;
            
        }

        

        public string getTipoUsuario(string login)
        {
            
            string consulta = "select * from usuarios where login = '{0}' and tipo = 'Usuario'";

            MySqlConnection conec = Conectar();
            conec.Open();

            MySqlCommand query = conectar.CreateCommand();

            query.CommandText = String.Format(consulta, login);
            MySqlDataReader reader = query.ExecuteReader();

            if (reader.HasRows)
            {
                return "Usuario";

            }
            else
            {
                return "Administrador";
            }
        }
        public string getIDUsuario(string login)
        {
            MySqlConnection conectar = Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT idUsu FROM usuarios WHERE login = '" + login + "'", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);
            string idUsu = ds.Tables[0].Rows[0].ItemArray[0].ToString();
            conectar.Close();
            return idUsu;
        }
        public string getNombreUsuario(string login)
        {
            MySqlConnection conectar = Conectar();
            conectar.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT nombre FROM usuarios WHERE login = '" + login + "'", conectar);
            DataSet ds = new DataSet();
            da.Fill(ds);
            string nombreUsu = ds.Tables[0].Rows[0].ItemArray[0].ToString();
            conectar.Close();
            return nombreUsu;
        }
        public bool getUsuarioExistente(string login)
        {
            string consulta = "select * from usuarios where login = '{0}'";

            MySqlConnection conec = Conectar();
            conec.Open();

            MySqlCommand query = conectar.CreateCommand();

            query.CommandText = String.Format(consulta, login);
            MySqlDataReader reader = query.ExecuteReader();

            if (reader.HasRows)
            {
                return true;

            }
            else
            {
                return false;
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
    }
}