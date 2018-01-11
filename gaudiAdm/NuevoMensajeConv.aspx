<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoMensajeConv.aspx.cs" Inherits="gaudiAdm.NuevoMensajeConv" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        
        body{
            text-align: center;
        
            font-family: Arial;
            font-size:medium;
        }
        #MainTable{
            text-align: left;
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
            border: 0px solid black;
            background-color: white;
            box-shadow: 7px 7px 5px #000000;
        }
        table{
            border-radius:10px 10px 10px 0px;
            border-collapse: collapse;
        }
        td{
            vertical-align:top;
            padding-left: 10px;
            padding-right: 10px;
        }
        #MainTableTD{
            border: 1px solid black;
            text-align: left;
            vertical-align: top;
        }
        #MainTableTDLeft{
            border: 1px solid black;
            text-align: left;
            vertical-align: top;
            padding-left:0px;
            padding-right:0px;
        }
        .btnNot {
          font-family: Arial;
          color: #525252;
          font-size: 16px;
          background: #ffffff;
          padding: 0px 10px 0px 10px;
          text-decoration: none;
          text-align: left;
          width: 400px;
          height: 25px;
          border-style:none;
        }
        .btnNot:hover {
          background: #3cb0fd;
          text-decoration: none;
        }
        .btnMenu {
	        background-color:#4267B2;
	        display:inline-block;
	        cursor:pointer;
	        color:#ffffff;
	        font-family:Arial;
	        font-size:18px;
	        padding:32px 11px;
	        text-decoration:none;
	        text-shadow:0px 1px 0px #2f6627;
            border: 0px;
        }
        .btnMenu:hover {
	        background-color:#3B5CA0;
        }
        .btnMenu:active {
	        position:relative;
	        top:1px;
        }
        .btnDefault{
              background: #a8b5bd;
              background-image: -webkit-linear-gradient(top, #a8b5bd, #666b6e);
              background-image: -moz-linear-gradient(top, #a8b5bd, #666b6e);
              background-image: -ms-linear-gradient(top, #a8b5bd, #666b6e);
              background-image: -o-linear-gradient(top, #a8b5bd, #666b6e);
              background-image: linear-gradient(to bottom, #a8b5bd, #666b6e);
              -webkit-border-radius: 5px;
              -moz-border-radius: 5px;
              font-family: Arial;
              color: #ffffff;
              font-size: 12px;
              padding: 2px 10px 2px 10px;
              text-decoration: none;
              font-weight: bold;
              height: 36px;
        }
        .btnDefault:hover{
              background: #5f6266;
              background-image: -webkit-linear-gradient(top, #5f6266, #9ca4a8);
              background-image: -moz-linear-gradient(top, #5f6266, #9ca4a8);
              background-image: -ms-linear-gradient(top, #5f6266, #9ca4a8);
              background-image: -o-linear-gradient(top, #5f6266, #9ca4a8);
              background-image: linear-gradient(to bottom, #5f6266, #9ca4a8);
              text-decoration: none;
        }

        .lblTitulo {
            font-size: larger;
            font-weight:bold;
        }
        .lblDatosLoginTitulo{
            font-size: small;
            font-weight:bold;
        }
        .lblDatosLogin{
            font-size: small;
        }
        .tablaMensajes {
            width: 100%;
            border-style:none;
            text-align:left;
        }
        .auto-style2 {
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="tablaMensajes">
                <tr>
                    <td>
                        <asp:Label ID="lblTitulo" runat="server" CssClass="lblTitulo" Text="Redactar nuevo mensaje"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp; &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblAsuntoRespuesta" runat="server" Text="Asunto"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtAsuntoRespuesta" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtMensajeRespuesta" runat="server" Height="300px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp; &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Adjuntar
                        <asp:FileUpload ID="FileUpload" runat="server" CssClass="auto-style2" Height="25px" Width="266px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnEnviar" runat="server" CssClass="btnDefault" Height="25px" OnClick="btnEnviar_Click" Text="Enviar" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
