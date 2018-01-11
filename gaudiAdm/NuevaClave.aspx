<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevaClave.aspx.cs" Inherits="gaudiAdm.NuevaClave" %>

<!DOCTYPE html>
<style>
    body{
        text-align: center;
        background-color: #262222;
        font-family: Arial;
    }
    td {
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    table{
        border-radius:10px 10px 10px 0px;
        border-collapse: collapse;
    }
    #MainTable{
        text-align: left;
        width: 400px;
        margin-left: auto;
        margin-right: auto;
        margin-top:auto;
        margin-bottom:auto;
        border: 0px solid black;
        box-shadow: 7px 7px 5px #000000;
        background-color: white;
        padding-left:10px;
        padding-top:10px;
    }
    .auto-style1 {
        width: 50%;
        height: 26px;
    }
    .btn {
          background: #a8b5bd;
          background-image: -webkit-linear-gradient(top, #a8b5bd, #666b6e);
          background-image: -moz-linear-gradient(top, #a8b5bd, #666b6e);
          background-image: -ms-linear-gradient(top, #a8b5bd, #666b6e);
          background-image: -o-linear-gradient(top, #a8b5bd, #666b6e);
          background-image: linear-gradient(to bottom, #a8b5bd, #666b6e);
          -webkit-border-radius: 28;
          -moz-border-radius: 28;
          border-radius: 28px;
          font-family: Arial;
          color: #ffffff;
          font-size: 18px;
          padding: 10px 20px 10px 20px;
          text-decoration: none;
    }
    .btn:hover {
          background: #5f6266;
          background-image: -webkit-linear-gradient(top, #5f6266, #9ca4a8);
          background-image: -moz-linear-gradient(top, #5f6266, #9ca4a8);
          background-image: -ms-linear-gradient(top, #5f6266, #9ca4a8);
          background-image: -o-linear-gradient(top, #5f6266, #9ca4a8);
          background-image: linear-gradient(to bottom, #5f6266, #9ca4a8);
          text-decoration: none;
    }

    .auto-style2 {
        width: 40%;
        height: 24px;
    }

    .auto-style3 {
        width: 50%;
        height: 24px;
    }
    input[type="submit"]{
          background: #a8b5bd;
          background-image: -webkit-linear-gradient(top, #a8b5bd, #666b6e);
          background-image: -moz-linear-gradient(top, #a8b5bd, #666b6e);
          background-image: -ms-linear-gradient(top, #a8b5bd, #666b6e);
          background-image: -o-linear-gradient(top, #a8b5bd, #666b6e);
          background-image: linear-gradient(to bottom, #a8b5bd, #666b6e);
          -webkit-border-radius: 5px;
          -moz-border-radius: 5px;
          border-radius: 5px;
          font-family: Arial;
          color: #ffffff;
          font-size: 14px;
          padding: 5px 10px 5px 10px;
          text-decoration: none;
          font-weight: bold;
    }
    input[type="submit"]:hover{
          background: #5f6266;
          background-image: -webkit-linear-gradient(top, #5f6266, #9ca4a8);
          background-image: -moz-linear-gradient(top, #5f6266, #9ca4a8);
          background-image: -ms-linear-gradient(top, #5f6266, #9ca4a8);
          background-image: -o-linear-gradient(top, #5f6266, #9ca4a8);
          background-image: linear-gradient(to bottom, #5f6266, #9ca4a8);
          text-decoration: none;
    }

</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Nueva clave</title>
    <script type="text/javascript">
        function Confirmacion() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            if (confirm("¿Está seguro?")) {
                confirm_value.value = "Si";
            }
            else {
                confirm_value.value = "No";
            }

            document.forms[0].appendChild(confirm_value);
        }
    </script> 
</head>


<body>
    <table style="width:100%; height:100%">
        <tr>
            <td>

            <br />
<br />
    <form id="form1" runat="server">
    <div>
    <table id="MainTable" >
        <tr>
            <td class="auto-style3">
                Ingrese nueva clave</td>
            <td class="auto-style2">

                <asp:TextBox ID="txtNuevaClave" runat="server" TextMode="Password" OnTextChanged="txtNuevaClave_TextChanged"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                Confirme nueva clave</td>
            <td class="auto-style2">

                <asp:TextBox ID="txtConfClave" runat="server" TextMode="Password" OnTextChanged="txtConfClave_TextChanged"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                &nbsp; &nbsp;</td>
            <td class="auto-style1">

                &nbsp;</td>
        </tr>
        </table>
        <br />
        <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" OnClientClick="Confirmacion()" />
        <br />
    </div>
    </form>
                </td>
        </tr>
    </table>
</body>
</html>
