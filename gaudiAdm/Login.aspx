<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="gaudiAdm.Login" %>

<!DOCTYPE html>
<style>
    html, body{
        margin-top: 0px; 
        margin-bottom: 0px; 
        margin-left: 0px; 
        margin-right: 0px;
        padding: 0;
        text-align: center;
        background-color: #262222;
        font-family: Arial;
        height: 100%;
        
    }
    
    table{
        border-radius:10px 10px 10px 10px;
        border-collapse: collapse;
        
    }
    #MainTable{
        text-align: center;
        box-shadow: 7px 7px 5px #000000;
        margin-left: auto;
        margin-right: auto;
        margin-top:auto;
        margin-bottom:auto;
        background-color: white;
        padding-left:10px;
        padding-top:10px;
        padding-top:10px;
        padding-bottom:10px;
        width:400px;
        height:300px;
        align-self: center;
    }
    .auto-style1 {
        width: 50%;
        height: 26px;
    }
    input[type="submit"]{
          background: #0067B8;
          border-style:none;
          -moz-border-radius: 5px;
          
          font-family: Arial;
          color: #ffffff;
          font-size: 14px;
          padding: 5px 10px 5px 10px;
          text-decoration: none;
          font-weight: bold;
          
    }
    input[type="submit"]:hover{
          background: #005DA6;
          
          text-decoration: none;
    }

    .auto-style2 {
        width: 40%;
        height: 24px;
    }

    .auto-style3 {
        height: 100%;
        max-width: 1920px;
        border-style:none;
        vertical-align:middle;
    }
    .bgimg {
        height: 100%;
        position: relative;
        opacity: 0.95;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        top: 0px;
        left: 0px;
        width: 100%;
        display: flex;
        justify-content: center;
    }

    .auto-style4 {
        height: 26px;
    }

    .auto-style6 {
        width: 716px;
        border-style:none;
    }

</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ingreso</title>
    
</head>


<body>
    
        <table style="width: 100%; height: 100%;border-style:none; text-align:center;">
            <tr>
                <td class="auto-style3">
                    <div class="bgimg" ID="background" runat="server">
                        
                        
                        
                        <table id="MainTable">
                            <tr>
                                <td class="auto-style6">
                                    <form id="form1" runat="server">

                                        <br />
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Logo.png" Width="100px" />
                                        <br />
                                        <br />
                                        <br />

                                        <table align="center" style="text-align: left;">
                                            <tr>
                                                <td style="width: 40%">Usuario</td>
                                                <td style="width: 40%">

                                                    <asp:TextBox ID="txtUsuario" runat="server" OnTextChanged="txtUsuario_TextChanged"></asp:TextBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">&nbsp;&nbsp;</td>
                                                <td class="auto-style2">&nbsp;&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">Contraseña</td>
                                                <td class="auto-style2">
                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style1">&nbsp; &nbsp;</td>
                                                <td class="auto-style1">&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" colspan="2">
                                                    <asp:Button ID="btnEntrar" runat="server" OnClick="btnEntrar_Click" Text="Entrar" Width="100%" CssClass="btn" />

                                                </td>
                                            </tr>
                                        </table>
                                        <br />

                                    </form>
                                </td>
                            </tr>
                        </table>
                        
                        
                        
                    </div>
                    
                </td>
            </tr>
        </table>
    
</body>
</html>
