<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainAccess.aspx.cs" Inherits="gaudiAdm.MainAccess" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<style>
     .Background{
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
        }
    .Popup{
        background-color: #FFFFFF;
        border-width:0px;
        padding: 10px;
        border-radius:10px 10px 10px 0px;
        width: 820px;
        height: 600px;
        box-shadow: 7px 7px 5px #000000;
        }
    body{
        text-align: center;
        background-color: #262222;
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

    .auto-style1 {
        width: 100%;
    }
    .lblTitulo {
        font-size: larger;
        font-weight:bold;
    }
    .lblTituloMensajes {
        font-size: medium;
        font-weight: bold;
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
        border: 1px solid #A8B5BD;
        border-radius:10px 10px 10px 0px;
    }
    .listViewMensajes{
        border-width: 0px;
        border-style: none;
        border-color: inherit;
        width: 100%;
        overflow-wrap: normal;
    }
    .grvMensajes{
        border:none;
    }
    .grvMensajes td{
        border:none;
    }
    .txtMensajes{
        border-style:solid;
        border-width:1px;
        border-radius:10px 10px 10px 0px;
        padding: 5px;
        overflow: hidden;
    }
    .auto-style2 {
        height: 18px;
    }

    .auto-style3 {
        height: 18px;
        width: 101px;
    }

    .auto-style4 {
        width: 600px;
        height: 65px;
        border: 1px solid #000000;
    }
    .auto-style5 {
        height: 20px;
    }

    .auto-style6 {
        height: 22px;
    }

    .auto-style7 {
        height: 20px;
        width: 26px;
    }
    .auto-style8 {
        width: 26px;
    }
    .auto-style9 {
        height: 22px;
        width: 26px;
    }

    .auto-style10 {
        width: 26px;
        height: 27px;
    }
    .auto-style11 {
        height: 27px;
    }

     
    .auto-style12 {
        height: 59px;
    }
    .auto-style13 {
        height: 20px;
        width: 100px;
    }
    .auto-style14 {
        width: 100px;
        height: 24px;
    }
    .auto-style15 {
        height: 24px;
    }
    .auto-style16 {
        height: 129px;
    }

    

    .auto-style17 {
        width: 100%;
        border-collapse: collapse;
        text-align:left;
        
    }

    

    .auto-style18 {
        width: 458px;
    }

    

    .auto-style19 {
        width: 100%;
        border-collapse: collapse;
    }

    

    </style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Acceso usuarios</title>
    
</head>
<body>
    
    <form id="form2" runat="server">
        
    <div>
        <table id="MainTable">
            <tr style="height: 100px;">
                <td colspan="2">
                    <table align="left" class="auto-style16" style="text-align:left;width:100%;">
                        <tr>
                            <td style="padding-top: 10px;" rowspan="4">
                    <asp:Image ID="Image2" runat="server" Height="104px" ImageUrl="~/Images/LogoNombre.png" Width="499px" />
                            </td>
                            <td style="padding-top: 10px;width:150px;">
                                <asp:Label ID="lblUsuario" runat="server" Font-Bold="True" Text="Usuario: " CssClass="lblDatosLoginTitulo"></asp:Label>
                                <asp:Label ID="lblLoginUser" runat="server" Text="Label" CssClass="lblDatosLogin"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style15">
                                <asp:Label ID="lblNomUsuTitle" runat="server" Font-Bold="True" Text="Nombre: " CssClass="lblDatosLoginTitulo"></asp:Label>
                                <asp:Label ID="lblNombreUsuario" runat="server" Text="Label" CssClass="lblDatosLogin"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style15">&nbsp; &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="padding-bottom: 10px;">
                                <asp:Button ID="btnLogOut" runat="server" Text="Salir" CssClass="btnDefault" Height="30px" OnClick="btnLogOut_Click" />
                            </td>
                        </tr>
                    </table>
                    
                    </td>
            </tr>
            <tr style="height:1000px;">
                <td id="MainTableTDLeft" style="width: 150px;text-align:center;">
                    
                    <asp:ImageButton ID="imgButtonInicio" runat="server" Height="86px" ImageUrl="~/Images/InicioBtn.png" OnClick="imgButtonInicio_Click" Width="157px" />
                    
                    <asp:ImageButton ID="imgButtonGC" runat="server" Height="86px" ImageUrl="~/Images/GCBtn.png" OnClick="imgButtonGC_Click" Width="157px" />
                      
                    <asp:ImageButton ID="imgButtonMensajes" runat="server" Height="86px" ImageUrl="~/Images/MensajesBtn.png" OnClick="imgButtonMensajes_Click" Width="157px" />
                      
                    <asp:ImageButton ID="imgButtonComunicados" runat="server" Height="86px" ImageUrl="~/Images/ComunicadosBtn.png" OnClick="imgButtonComunicados_Click" Width="157px" />
                      
                </td>
                <td id="MainTableTD">

                    <asp:MultiView ID="mvMain" runat="server">
                        <asp:View ID="viewHome" runat="server">
                            <table class="auto-style1" style="">
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label1" runat="server" CssClass="lblTitulo" Text="Notificaciones"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;&nbsp; </td>
                                    <td class="auto-style5"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style10">
                                        <asp:Image ID="imgNotGC" runat="server" ImageUrl="~/Images/ticket.png" Width="25px" />
                                    </td>
                                    <td class="auto-style11">
                                        <asp:Button ID="btnGoGC" runat="server" CssClass="btnNot" OnClick="btnGoGC_Click" Text="No hay nuevos gastos comunes" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style9">
                                        <asp:Image ID="imgNotMensajes" runat="server" ImageUrl="~/Images/ticket.png" Width="25px" />
                                    </td>
                                    <td class="auto-style6">
                                        <asp:Button ID="btnNotMensajes" runat="server" CssClass="btnNot" OnClick="btnNotMensajes_Click" Text="No hay nuevos mensajes" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Image ID="imgNotArticulos" runat="server" ImageUrl="~/Images/ticket.png" Width="25px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnNotArticulos" runat="server" CssClass="btnNot" Text="No hay nuevos comunicados" OnClick="btnNotArticulos_Click" />
                                    </td>
                                </tr>
                            </table>
                            <hr />
                            <table class="auto-style19">
                                <tr>
                                    <td style="text-align:center;">
                                        <asp:Image ID="imgUltComunicado" runat="server" ImageUrl="~/Images/ultComunicado.png" Width="500px" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp; &nbsp; </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="divUltComunicadoHome" runat="server">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </asp:View>
                        <asp:View ID="viewMainGC" runat="server">
                            <table class="auto-style1">
                                <tr>
                                    <td colspan="2" style="padding-top:10px;">
                                        <asp:Label ID="lblTituloGC" runat="server" CssClass="lblTitulo" Text="Gastos comunes"></asp:Label>
                                        <br />
                                        Aquí podrá ver el listado de los gastos comunes publicados y ver el detalle del mismo.</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">&nbsp;&nbsp; </td>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">Año</td>
                                    <td class="auto-style2">
                                        <asp:DropDownList ID="ddlAñoListadoGC" runat="server" Width="150px">
                                            <asp:ListItem>2017</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">Condominio</td>
                                    <td class="auto-style2">
                                        <asp:DropDownList ID="ddlCondListadoGC" runat="server" OnSelectedIndexChanged="ddlCondListadoGC_SelectedIndexChanged" Width="150px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">&nbsp; &nbsp;</td>
                                    <td class="auto-style2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="grvListadoGC" runat="server" AutoGenerateColumns="False" CellPadding="2" HorizontalAlign="Center" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Mes">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMesListadoGC" runat="server" Text='<%# Eval("Mes") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Acciones">
                                                    <ItemTemplate>
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td>
                                                                    <asp:ImageButton ID="ibtnVerListadoGC" runat="server" AlternateText='<%# Eval("Adjunto") %>' ImageUrl="~/Images/view.png" OnClick="ibtnVerListadoGC_Click" ToolTip="Ver el documento adjunto" Width="35px" />
                                                                </td>
                                                                <td>
                                                                    <asp:ImageButton ID="ibtnDescargarListadoGC" runat="server" AlternateText='<%# Eval("Adjunto") %>' Height="35px" ImageUrl="~/Images/save.png" OnClick="ibtnDescargarListadoGC_Click" ToolTip="Descargar documento adjunto" Width="35px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                                    <ItemStyle Width="100px" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <table class="auto-style4">
                                                    <tr>
                                                        <td class="auto-style5">Seleccione un condominio para poder ver el listado de gastos comunes emitidos.</td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <RowStyle VerticalAlign="Middle" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="viewMainMensajes" runat="server">
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style12" colspan="2">
                                        <asp:Label ID="lblMensajesTitulo" runat="server" CssClass="lblTitulo" Text="Mensajes"></asp:Label>
                                        <br />
                                        Aquí podrá ver y responder todos los mensajes enviados por la Administración a sus departamentos asignados. </td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp; &nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style13">Condominio</td>
                                    <td class="auto-style5">
                                        <asp:DropDownList ID="ddlCondominiosMensajes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCondominiosMensajes_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style14">Departamento</td>
                                    <td class="auto-style15">
                                        <asp:DropDownList ID="ddlDeptosMensajes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDeptosMensajes_SelectedIndexChanged" OnDataBound="ddlDeptosMensajes_DataBound">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" style="display:none;">

                                            <table class="tablaMensajes">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTituloMensaje" runat="server" CssClass="lblTitulo" Text="Redactar nuevo mensaje"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp; &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">
                                                        <asp:Label ID="lblAsunto" runat="server" Text="Asunto"></asp:Label>
                                                        &nbsp;<asp:TextBox ID="txtAsuntoMensaje" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">&nbsp;&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtMensajeNuevo" runat="server" Height="300px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp; &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">Adjuntar
                        <asp:FileUpload ID="FileUploadAdjuntoMensajeNuevo" runat="server" CssClass="auto-style2" Height="25px" Width="266px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnEnviarMensaje" runat="server" CssClass="btnDefault" Height="25px" OnClick="btnEnviar_Click" Text="Enviar" />
                                                    </td>
                                                </tr>
                                            </table>

                                            <br />

                                            <asp:Button ID="btnCerrarMensajeNuevo" CssClass="btnDefault" runat="server" Text="Cerrar" OnClick="btnCerrarRespuesta_Click" />

                                        </asp:Panel>
                                        <asp:Panel ID="Panl2" runat="server" CssClass="Popup" align="center" style="display:none;">

                                            <table class="tablaMensajes">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTituloResp" runat="server" CssClass="lblTitulo" Text="Redactar respuesta"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp; &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">
                                                        <asp:Label ID="lblTituloAsuntoTitulo" runat="server" Text="Asunto: "></asp:Label>
                                                        &nbsp;<asp:Label ID="lblAsuntoRespuesta" runat="server"></asp:Label>
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
                        <asp:FileUpload ID="FileUploadAdjuntoRespuesta" runat="server" CssClass="auto-style2" Height="25px" Width="266px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnEnviarRespuesta" runat="server" CssClass="btnDefault" Height="25px" OnClick="btnEnviarRespuesta_Click" Text="Enviar" />
                                                    </td>
                                                </tr>
                                            </table>

                                            <br />

                                            <asp:Button ID="btnCerrarMensajeRespuesta" CssClass="btnDefault" runat="server" Text="Cerrar" OnClick="btnCerrarRespuesta_Click" />

                                        </asp:Panel>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnNuevaConv" runat="server" CssClass="btnDefault" Text="Nueva conversación" OnClick="btnNuevaConv_Click" />
                                        <cc1:ModalPopupExtender ID="mp2" runat="server" BackgroundCssClass="Background" CancelControlID="btnCerrarMensajeNuevo" PopupControlID="Panl1" TargetControlID="btnNuevaConv"></cc1:ModalPopupExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;&nbsp; &nbsp;</td>
                                </tr>
                            </table>
                            <table class="tablaMensajes">
                                <tr style="height: 25px;">
                                    <td style="border: 1px solid #A8B5BD; height: 25px; width:30%;">
                                        <asp:Label ID="lblConversacionesTitulo" runat="server" CssClass="lblTitulo" Text="Conversaciones"></asp:Label>
                                    </td>
                                    <td style="border: 1px solid #A8B5BD;" rowspan="2">
                                        <asp:GridView ID="grvMensajes" runat="server" AutoGenerateColumns="False" CssClass="grvMensajes" OnSelectedIndexChanged="grvMensajes_SelectedIndexChanged" ShowHeader="False" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Mensajes">
                                                    <ItemTemplate>
                                                        <table class="auto-style1">
                                                            <tr>
                                                                <td style="padding: 5px;">
                                                                    <asp:Label ID="lblGrvMensajesOrigenTitulo" runat="server" CssClass="lblTituloMensajes"></asp:Label>
                                                                    <cc1:ModalPopupExtender ID="mp1" runat="server" BackgroundCssClass="Background" CancelControlID="btnCerrarMensajeRespuesta" PopupControlID="Panl2" TargetControlID="btnGrvMensajesResponder"></cc1:ModalPopupExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px;">
                                                                    <asp:TextBox ID="txtGrvMensajesRecibido" runat="server" BackColor="#F4F4F4" BorderWidth="1px" CssClass="txtMensajes" OnDataBinding="txtGrvMensajesRecibido_DataBinding1" ReadOnly="True" Text='<%# Eval("Recibido") %>' TextMode="MultiLine" Width="100%" Wrap="False"></asp:TextBox>
                                                                    <br />
                                                                    <asp:Label ID="lblRecibidoText" runat="server" Font-Size="X-Small" Text="Recibido en: "></asp:Label>
                                                                    <asp:Label ID="lblFechaMensaje" runat="server" Font-Size="X-Small" OnDataBinding="lblFechaMensaje_DataBinding" Text='<%# Eval("Fecha") %>'></asp:Label>
                                                                    <asp:TextBox ID="txtGrvMensajesEnviado" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="txtMensajes" ReadOnly="True" Text='<%# Eval("Enviado") %>' TextMode="MultiLine" Width="100%" Wrap="False"></asp:TextBox>
                                                                    <br />
                                                                    <asp:Label ID="lblEnviadoText" runat="server" Font-Size="X-Small" Text="Enviado en: "></asp:Label>
                                                                    <asp:Label ID="lblFechaEnviado" runat="server" Font-Size="X-Small" OnDataBinding="lblFechaEnviado_DataBinding" Text='<%# Eval("Fecha") %>'></asp:Label>
                                                                    <asp:Label ID="lblGrvMensajesAdjunto" runat="server" Text='<%# Eval("Adjunto") %>' Visible="False"></asp:Label>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px;">
                                                                    <asp:Button ID="btnGrvMensajesResponder" runat="server" CssClass="btnDefault" Height="25px" OnClick="btnGrvMensajesResponder_Click" Text="Responder" />
                                                                    &nbsp;&nbsp;<asp:Button ID="btnDescargarAdjunto" runat="server" CssClass="btnDefault" Height="25px" OnClick="btnDescargarAdjunto_Click" Text="Descargar adjunto" Visible='<%# Eval("FAdjunto") %>' />
                                                                    &nbsp; </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <table class="auto-style1">
                                                    <tr>
                                                        <td>&nbsp;&nbsp;
                                                            <br />
                                                            Seleccione una conversación de la lista para ver los mensajes asociados. </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align:center;">
                                                            <br />
                                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/mail.png" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <br />
                                            </EmptyDataTemplate>
                                            <RowStyle BorderStyle="None" />
                                        </asp:GridView>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border: 1px solid #A8B5BD; padding-top: 10px; padding-left:0px; padding-right:0px;">
                                        <asp:ListBox ID="lstbMensajes" runat="server" AutoPostBack="True" CssClass="listViewMensajes" EnableTheming="True" OnSelectedIndexChanged="lstbMensajes_SelectedIndexChanged" Rows="10" Width="100%"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="viewComunicados" runat="server">
                            <table class="auto-style1">
                                <tr>
                                    <td style="width:100px;">&nbsp; &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:100px;">Condominio</td>
                                    <td>
                                        <asp:DropDownList ID="ddlCondominiosComunicados" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp; &nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <hr />
                            <asp:GridView ID="grvComunicados" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="grvComunicados_PageIndexChanging" PageSize="2" ShowHeader="False" style="width:100%; border-style:none;" Width="100%">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Comunicados" InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <table class="auto-style17">
                                                <tr>
                                                    <td style="text-align:left; width:150px;">&nbsp;&nbsp; &nbsp;</td>
                                                    <td style="text-align:left;">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left; width:100px;">Asunto</td>
                                                    <td style="text-align:left;">
                                                        <asp:Label ID="lblTituloComunicado" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("titulo") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;">Última modificación</td>
                                                    <td style="text-align:left;">
                                                        <asp:Label ID="lblFechaComunicado" runat="server" Text='<%# Eval("Fecha") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div id="divComunicado" runat="server">
                                                            <%# Eval("Comunicado") %>
                                                        </div>
                                                        <hr />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <EmptyDataTemplate>
                                    <table style="text-align:center; width:100%;">
                                        <tr>
                                            <td class="auto-style18">
                                                <asp:Label ID="lblComunicadosEmpty" runat="server" Font-Size="Large" Text="No hay comunicados para el condominio seleccionado."></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/Empty.png" />
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerSettings Mode="NextPrevious" NextPageText="Siguiente" PreviousPageText="Anterior" NextPageImageUrl="~/Images/nextPageIcon.png" PreviousPageImageUrl="~/Images/prevPageIcon.png" />
                                <PagerStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" BorderStyle="None" Height="25px" Width="82px" Wrap="False" />
                                <RowStyle BackColor="#F3F3F3" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </asp:View>
                    </asp:MultiView>

                </td>
            </tr>
            <tr>
                <td id="MainTableTD" colspan="2">

                </td>
            </tr>
        </table>
    </div>
    
    </form>
    
</body>
</html>
