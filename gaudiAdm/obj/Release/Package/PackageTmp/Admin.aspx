<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="gaudiAdm.Admin" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>
<style>
    MultiView1{
        text-align: center;

    }
    body{
        text-align: center;
        background-color: #262222;
        font-family: Arial;
        font-size: small;
    }
    #MainTable{
        text-align: left;
        width: 1000px;
        margin-left: auto;
        margin-right: auto;
        border: 1px solid black;
        background-color: white;
        box-shadow: 7px 7px 5px #000000;
    }
    table{
        border-radius:10px 10px 10px 0px;
        border-collapse: collapse;
    }
    
    
    #MainTableTD{
        border: 1px solid black;
        text-align: left;
        vertical-align: top;
    }
    td{
        padding-left: 10px;
        padding-right: 10px;
        
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
          height: 36px;
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
    .logOutBTN {
        height: 30px;
        padding: 2px 2px 2px 2px;
    }
   
    .gridview {
        padding-right: auto;
        padding-left: auto;
        text-align: left;
        
    }
    h1{
        font-size: 20px;
        text-align: center;
    }

    h2{
        font-size: 16px;
        text-align: left;
    }


    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        height: 23px;
    }

   


    .auto-style3 {
        width: 500px;
    }

   


    .auto-style4 {
        width: 89px;
    }

   


    .auto-style5 {
        width: 140px;
    }

   


    .auto-style6 {
        width: 100%;
        height: 0;
        border: 1px solid #000000;
    }
    
   


    .auto-style8 {
        width: 219px;
    }

   


    .auto-style9 {
        width: 100%;
        height: 100%;
        border: 1px solid #000000;
    }

   


    .auto-style10 {
        height: 23px;
        width: 200px;
    }
    .auto-style11 {
        width: 200px;
    }

   


    .auto-style12 {
        margin-bottom: 0px;
    }
    .auto-style13 {
        width: 150px;
    }
    .auto-style14 {
        width: 150px;
        height: 18px;
    }
    .auto-style15 {
        height: 18px;
    }

   


    .loginDataTable {
        width: 200px;
    }
    .auto-style16 {
        width: 175px;
    }
    


    </style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
        function ConfirmacionNoticia() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value_not";

            if (confirm("¿Está seguro que desea crear un nuevo artículo? Esta aun no se publicará.")) {
                confirm_value.value = "Si";
            }
            else {
                confirm_value.value = "No";
            }

            document.forms[0].appendChild(confirm_value);
        }
        function ConfirmacionPubNoticia() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value_pub_not";

            if (confirm("¿Está seguro que desea guardar los cambios y publicar el artículo?")) {
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
    <form id="form1" runat="server">


    <div>
        <table id="MainTable">
            <tr style="height: 100px;">
                <td id="MainTableTD" colspan="2">
                    <table align="right" class="auto-style16" style="text-align:left;">
                        <tr>
                            <td style="padding-top: 10px;">
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Usuario: "></asp:Label>
                                <asp:Label ID="lblLoginUser" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style15">
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Nombre: "></asp:Label>
                                <asp:Label ID="lblNombreUsuario" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style15">&nbsp; &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="padding-bottom: 10px;">
                                <asp:Button ID="btnLogOut" runat="server" Text="Salir" CssClass="logOutBTN" Height="30px" OnClick="btnLogOut_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr style="height:1000px;">
                <td style="width: 150px; vertical-align:top; text-align:center; padding:10px;" id="MainTableTD">
                    
                    <asp:Button ID="btnCondominios" runat="server" Text="Condominios" OnClick="btnCondominios_Click" Width="150px" Height="36px" />
                    
                    <br />
                    <br />
                    
                    <asp:Button ID="btnCargaGC" runat="server" Text="Gastos comunes" OnClick="btnCargaGC_Click" Width="150px" Height="36px" />
                    
                    <br />
                    <br />
                    
                    <asp:Button ID="btnAdminNoticias" runat="server" OnClick="btnAdminNoticias_Click" Text="Artículos" Width="150px" Height="36px" />
                    
                    <br />
                    <br />
                    <asp:Button ID="btnAdminUsu" runat="server" Text="Usuarios" Width="150px" OnClick="btnAdminUsu_Click" Height="36px" />
                    
                    <br />
                    <br />
                    
                </td>
                <td id="MainTableTD">

                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="viewAdminNoticias" runat="server">
                            <table cellpadding="10" class="auto-style1">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnListadoNoticias" runat="server" Text="Listado" OnClick="btnListadoNoticias_Click" Width="100px" />
                                        &nbsp;
                                        <asp:Button ID="btnCrearNoticia" runat="server" Text="Crear artículo" OnClick="btnCrearNoticia_Click" Width="150px" />
                                        <hr />
                                        <asp:Panel ID="pnlListadoNoticias" runat="server">
                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Large" Text="Artículos publicados"></asp:Label>
                                            <br />
                                            Listado de los artículos publicados por condominio.<br /> <br />
                                            <table cellpadding="5" cellspacing="0" class="auto-style1">
                                                <tr>
                                                    <td class="auto-style4">Condominio</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlCondsListadoArt" runat="server" AutoPostBack="True">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">&nbsp;&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Panel ID="pnlListadoArticulos" runat="server">
                                                            <asp:GridView ID="grvListadoArticulos" runat="server" AutoGenerateColumns="False" Width="100%">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="ID">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblIDArticulo" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Título">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTituloArticulo" runat="server" Text='<%# Eval("titulo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="HTML" Visible="False">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblHTMLArt" runat="server" Text='<%# Eval("html") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Creación">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCreacionArticulo" runat="server" Text='<%# Eval("creacion") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Modificación">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblModArticulo" runat="server" Text='<%# Eval("modificacion") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Usuario">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUsuarioArticulo" runat="server" Text='<%# Eval("nombreUsu") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Visible">
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="chkbxArtVisible" runat="server" Checked='<%# Eval("visible") %>' Enabled="False" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Acciones">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkbtnEditarArt" runat="server" OnClick="lnkbtnEditarArt_Click">Ver</asp:LinkButton>
                                                                            &nbsp;<asp:LinkButton ID="lnkbtnEliminarArt" runat="server" OnClick="lnkbtnEliminarArt_Click" OnClientClick="Confirmacion()">Eliminar</asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <EmptyDataTemplate>
                                                                    <table cellpadding="10" cellspacing="1" class="auto-style6">
                                                                        <tr>
                                                                            <td>No existen artículos creados para el condominio seleccionado.</td>
                                                                        </tr>
                                                                    </table>
                                                                </EmptyDataTemplate>
                                                                <HeaderStyle BackColor="#999999" />
                                                            </asp:GridView>
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlEditArt" runat="server" Visible="False">
                                                            &nbsp;<table class="auto-style1">
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <asp:Label ID="lblEditArt" runat="server" Font-Bold="True" Font-Size="Large" Text="Artículo"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">&nbsp;&nbsp;<asp:Label ID="lblIDArt" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="auto-style5">Título</td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtTituloEditArt" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">&nbsp;&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <asp:TextBox ID="txtEditArt" runat="server" Height="530px" Width="100%"></asp:TextBox>
                                                                        <ajaxToolkit:HtmlEditorExtender ID="txtEditArt_HtmlEditorExtender" runat="server" EnableSanitization="False" TargetControlID="txtEditArt">
                                                                            
                                                                        </ajaxToolkit:HtmlEditorExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="auto-style2" colspan="2">&nbsp;&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <asp:Button ID="btnGuardarModArt" runat="server" OnClick="btnGuardarModArt_Click" OnClientClick="Confirmacion()" Text="Guardar cambios" Width="180px" />
                                                                        &nbsp;<asp:Button ID="btnPublicarArtMod" runat="server" OnClick="btnPublicarArtMod_Click" OnClientClick="ConfirmacionPubNoticia()" Text="Publicar" />
                                                                        &nbsp;<asp:Button ID="btnArtEditVolver" runat="server" OnClick="btnArtEditVolver_Click" OnClientClick="Confirmacion()" Text="Volver" Width="120px" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            <br />
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlCrearNoticia" runat="server" Visible="False">
                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" Text="Crear un nuevo artículo"></asp:Label>
                                            <br />
                                            Permite crear un nuevo artículo con el contenido que deseen comunicar a los usuarios de un condominio en particular.<br /> Los usuarios verán esta noticia en la pantalla principal al iniciar sesión.<br />
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="auto-style1">
                                                <tr>
                                                    <td class="auto-style4">Condominio</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlCondNoticias" runat="server" OnSelectedIndexChanged="ddlCondNoticias_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">&nbsp;&nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
                                                        </asp:ScriptManager>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Título</td>
                                                    <td>
                                                        <asp:TextBox ID="txtTituloNoticia" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">&nbsp;&nbsp; </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="txtHtmlNoticia" runat="server" Height="529px" Width="100%"></asp:TextBox>
                                                        <ajaxToolkit:HtmlEditorExtender ID="txtHtmlNoticia_HtmlEditorExtender" runat="server" TargetControlID="txtHtmlNoticia">
                                                        </ajaxToolkit:HtmlEditorExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">&nbsp;&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Button ID="btnGuardarNoticia" runat="server" OnClick="btnGuardarNoticia_Click" OnClientClick="ConfirmacionNoticia()" Text="Guardar nuevo artículo" Width="200px" />
                                                        &nbsp;<asp:Button ID="btnGuardarCambios" runat="server" OnClick="btnGuardarCambios_Click" OnClientClick="Confirmacion()" Text="Guardar cambios" Width="150px" Visible="False" />
                                                        &nbsp; <asp:Button ID="btnPublicarNoticia" runat="server" Text="Publicar" OnClick="btnPublicarNoticia_Click" OnClientClick="ConfirmacionPubNoticia()" Width="150px" Visible="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="viewUsuarios" runat="server">
                            <table style="width:100%;">
                                <tr>
                                    <td style="padding-left:10px; padding-top:10px;">
                            <asp:Button ID="btnListadoUsuarios" runat="server" OnClick="btnListadoUsuarios_Click" Text="Listado" Width="100px" />
                            &nbsp;
                            <asp:Button ID="btnAgregarUsuarios" runat="server" OnClick="btnAgregarUsuarios_Click" Text="Crear Usuario" Width="150px" />
                            <br />
                                        <hr />
                                        <br />
                            <asp:Panel ID="panelAgregarIUsuarios" runat="server" Visible="False">
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Crear Usuario"></asp:Label>
                                <br />
                                Permite crear un nuevo usuario. Luego este debe ser asociado a un departamento en el módulo Condominios. El usuario nuevo tendrá clave inicio.1 y se le pedirá cambio la próxima vez que ingrese al sistema.<br />&nbsp;<br /><table class="auto-style3">
                                    <tr>
                                        <td>Login</td>
                                        <td>
                                            <asp:TextBox ID="txtLoginUsuario" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Nombre</td>
                                        <td>
                                            <asp:TextBox ID="txtNombreUsu" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Teléfono</td>
                                        <td>
                                            <asp:TextBox ID="txtTelefonoUsu" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Correo</td>
                                        <td>
                                            <asp:TextBox ID="txtCorreoUsu" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tipo</td>
                                        <td>
                                            <asp:DropDownList ID="ddlTipoUsuarioAdd" runat="server">
                                                <asp:ListItem>Usuario</asp:ListItem>
                                                <asp:ListItem>Administrador</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnGuardarUsu" runat="server" OnClick="btnGuardarUsu_Click" Text="Guardar" />
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                &nbsp;</asp:Panel>
                            <asp:Panel ID="panelListadoUsuarios" runat="server">
                                
                                    <asp:Label ID="lblListadoUsuarios" runat="server" Text="Listado Usuarios" Font-Bold="True" Font-Size="Large"></asp:Label>
                                    <br />
                                    Este módulo permite ver el listado de todos los usuarios creados en el sistema. Permite ver los datos, desactivar el acceso y reiniciar la contraseña.<br />
                                    <br />
                                    <br />
                                    Filtro
                                <asp:TextBox ID="txtFiltroUsuario" runat="server" Width="196px"></asp:TextBox>
                                &nbsp;<asp:Button ID="btnFiltrarUsu" runat="server" OnClick="btnFiltrarUsu0_Click" Text="Buscar" />
                                    <br />
                                    <br />
                                <asp:Button ID="btnListarUsu" runat="server" OnClick="btnListarUsu_Click" Text="Listar todos" />
                                <br />
                                <br />
                                <asp:GridView ID="grvUsuarios" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" OnRowCancelingEdit="grvUsuarios_RowCancelingEdit" OnRowEditing="grvUsuarios_RowEditing" OnRowUpdating="grvUsuarios_RowUpdating" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID">
                                            <EditItemTemplate>
                                                <asp:Label ID="lblIdUsuEdit" runat="server" Text='<%# Eval("idUsu") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblIDUsu" runat="server" Text='<%# Eval("idUsu") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Login Usuario">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtLoginEdit" runat="server" Text='<%# Eval("login") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblLoginUsu" runat="server" Text='<%# Eval("login") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nombre">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtNombreEdit" runat="server" Text='<%# Eval("Nombre") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Teléfono">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtTelefonoEdit" runat="server" Text='<%# Eval("telefono") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblTelefono" runat="server" Text='<%# Eval("telefono") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Correo">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtCorreoEdit" runat="server" Text='<%# Eval("correo") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCorreo" runat="server" Text='<%# Eval("correo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tipo">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTipoUsuario" runat="server" Text='<%# Eval("Tipo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Acciones">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="lnkGuardarUsu" runat="server" CommandName="Update">Guardar</asp:LinkButton>
                                                &nbsp;
                                                <asp:LinkButton ID="lnkCancelarEdit" runat="server" CommandName="Cancel">Cancelar</asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkEditUsu" runat="server" OnClick="lnkEditUsu_Click">Editar</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                    <br />
                            </asp:Panel>
                                        <asp:Panel ID="pnlEditarUsuario" runat="server" Visible="False">
                                            <table class="auto-style1">
                                                <tr>
                                                    <td class="auto-style13">
                                                        <asp:Label ID="lblTituloEditarUsuario" runat="server" Font-Bold="True" Font-Size="Medium" Text="Editar usuario"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style13">&nbsp;&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style13">ID Usuario</td>
                                                    <td>
                                                        <asp:Label ID="lblIDUsuarioEdit" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style13">Login</td>
                                                    <td>
                                                        <asp:Label ID="lblLoginUsuarioEdit" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style13">Nombre</td>
                                                    <td>
                                                        <asp:TextBox ID="txtNombreUsuarioEdit" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style14">Teléfono</td>
                                                    <td class="auto-style15">
                                                        <asp:TextBox ID="txtFonoUsuarioEdit" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style13">Correo</td>
                                                    <td>
                                                        <asp:TextBox ID="txtCorreoUsuarioEdit" runat="server" Width="200px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style14">Tipo Usuario</td>
                                                    <td class="auto-style15">
                                                        <asp:DropDownList ID="ddlTipoUsuarioEdit" runat="server">
                                                            <asp:ListItem>Usuario</asp:ListItem>
                                                            <asp:ListItem>Administrador</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style13">&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Button ID="btnGuardarCambiosUsuarioEdit" runat="server" OnClick="btnGuardarCambiosUsuarioEdit_Click" OnClientClick="Confirmacion()" Text="Guardar cambios" Width="150px" />
                                                        &nbsp;
                                                        <asp:Button ID="btnDesactivarUsuarioEdit" runat="server" Text="Desactivar" />
                                                        &nbsp;
                                                        <asp:Button ID="btnReiniciarPassUsuarioEdit" runat="server" OnClick="btnReiniciarPassUsuarioEdit_Click" OnClientClick="Confirmacion()" Text="Reiniciar acceso" Width="150px" />
                                                        &nbsp;
                                                        <asp:Button ID="btnEditarUsuarioVolver" runat="server" OnClick="btnEditarUsuarioVolver_Click" Text="Volver" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                            <br />
                            <br />

                                        </td>
                                        </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="viewGastoComun" runat="server">
                            <table style="width:100%;">
                                <tr>
                                    <td style="padding-left:10px; padding-top:10px;">

                                        <asp:Button ID="btnListadoGC" runat="server" Text="Listado" OnClick="btnListadoGC_Click" />
                                        &nbsp;
                                        <asp:Button ID="btnGCEncabezado" runat="server" OnClick="btnGCEncabezado_Click" Text="Cargar nuevo" Width="147px" />
&nbsp;
                                        <asp:Button ID="btnGCDetalle" runat="server" OnClick="btnGCDetalle_Click" Text="Cargar detalle" Visible="False" />
                                        <hr style="width:100%"/>
                                        <asp:Panel ID="pnlListadoGC" runat="server" Width="100%">
                                            <br />
                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text="Listar encabezado de gastos comunes cargados"></asp:Label>
                                            <br />
                                            Este módulo permite listar los encabezados de gastos comunes cargados en el sistema y ver los documentos adjuntos asociados.<br />
                                            <br />
                                            Condominio:
                                            <asp:DropDownList ID="ddlCondsListado" runat="server" AutoPostBack="True" OnDataBound="ddlCondsListado_DataBound" OnSelectedIndexChanged="ddlCondsListado_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <br />
                                            <br />
                                            <asp:GridView ID="grvGastos" runat="server" AllowSorting="True" AutoGenerateColumns="False" Height="66px" HorizontalAlign="Center" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Mes">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMesGC" runat="server" Text='<%# Eval("mes") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Año">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAnioGC" runat="server" Text='<%# Eval("anio") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Adjunto">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkBtnGC" runat="server" OnClick="lnkBtnGC_Click" Text='<%# Eval("adjunto") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                        <br />
                                        <asp:Panel ID="pnlGCEncabezado" runat="server" Visible="False">
                                            <asp:Label ID="lblEncabezadoGC" runat="server" Font-Bold="True" Font-Size="Large" Text="Cargar encabezado de gasto común"></asp:Label>
                                            <br />
                                            Este módulo permite cargar el encabezado del gasto común para el condominio seleccionado (ingresos, egresos, proyectos, etc).<br />
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="auto-style1">
                                                <tr>
                                                    <td class="auto-style8">Seleccionar Condominio:</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlConds" runat="server" AutoPostBack="True" Height="16px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style8">&nbsp;&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style8">Seleccionar período:</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style8">Mes:</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlGCMes" runat="server">
                                                            <asp:ListItem Value="1">Enero</asp:ListItem>
                                                            <asp:ListItem Value="2">Febrero</asp:ListItem>
                                                            <asp:ListItem Value="3">Marzo</asp:ListItem>
                                                            <asp:ListItem Value="4">Abril</asp:ListItem>
                                                            <asp:ListItem Value="5">Mayo</asp:ListItem>
                                                            <asp:ListItem Value="6">Junio</asp:ListItem>
                                                            <asp:ListItem Value="7">Julio</asp:ListItem>
                                                            <asp:ListItem Value="8">Agosto</asp:ListItem>
                                                            <asp:ListItem Value="9">Septiembre</asp:ListItem>
                                                            <asp:ListItem Value="10">Octubre</asp:ListItem>
                                                            <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                                            <asp:ListItem Value="12">Diciembre</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style8">Año</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlGCAnio" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style8">&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style8">Documento adjunto (pdf, jpg, png)</td>
                                                    <td>
                                                        <asp:FileUpload ID="fupGC" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style8">&nbsp;&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style8">
                                                        <asp:Button ID="btnCargarGC" runat="server" OnClick="Button1_Click1" Text="Cargar y publicar" />
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                            <br />
                                        <asp:Panel ID="pnlCargarDetalleGC" runat="server" Visible="False">
                                            Detalle GC<br />
                                            <br />
                                        </asp:Panel>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                                                                            </td>
                                </tr>
                            </table>
 
                        </asp:View>
                        <asp:View ID="viewCondominios" runat="server">
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style2" colspan="2">
                                        <h1>Condominios y Departamentos</h1>
                                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="5" CssClass="gridview" HorizontalAlign="Center" OnDataBound="GridView1_DataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Código">
                                                    <ItemStyle Width="100px" />
                                                    <EditItemTemplate>
                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval ("idCond") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCod" runat="server" Text='<%# Eval("idCond") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Nombre">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtNombre" runat="server" style="margin-bottom: 0px" Text='<%# Eval ("Nombre") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNomCond" runat="server" Text='<%# Eval ("Nombre") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="350px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dirección">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtDireccion" runat="server" Height="19px" Text='<%# Eval("Direccion") %>' Width="220px"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDireccion" runat="server" Text='<%# Eval("Direccion") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="400px" />
                                                </asp:TemplateField>
                                                <asp:CommandField HeaderText="Acciones" InsertVisible="False" ShowEditButton="True" ShowSelectButton="True" />
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style10">&nbsp; &nbsp;</td>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" colspan="2" style="text-align:center;">
                                        
                                        <asp:Label ID="lblCondSeleccionado" runat="server" Font-Bold="True" Font-Italic="False" Text="Condominio" Visible="False" Font-Size="Large"></asp:Label>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2" style="vertical-align: top; padding-left:10px; padding-top:10px;" class="auto-style11">
                                        <asp:Panel ID="panelDeptos" runat="server" HorizontalAlign="Left" Visible="False" Width="200px" Wrap="False">
                                            <h2>Departamentos</h2>
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="gridview" HorizontalAlign="Left" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Unidad">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDepto" runat="server" Text='<%# Eval("depto") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:CommandField HeaderText="Acciones" ShowCancelButton="False" ShowSelectButton="True" SelectText="Seleccionar" />
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    Seleccione un condominio para ver sus departamentos.
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </td>
                                    <td style="vertical-align:top;padding-left:10px;padding-top:10px;">
                                        <asp:Panel ID="panelDetalleDepto" runat="server" Visible="False">
                                            <h2>Usuarios asignados al departamento</h2>
                                            <asp:GridView ID="grvUsuariosAsignadosDepto" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIDUsu" runat="server" Text='<%# Eval("idUsu") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="30px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Nombre">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNombreUsu" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Teléfono">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTelefono" runat="server" Text='<%# Eval("telefono") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Correo">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCorreo" runat="server" Text='<%# Eval("Correo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Acciones" InsertVisible="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkDesasociar" runat="server" OnClick="lnkDesasociar_Click" OnClientClick="Confirmacion()">Desasociar</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    No hay usuarios asignados a este departamento.
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                            <br />
                                            <asp:Button ID="btnAddUsu" runat="server" OnClick="btnAddUsu_Click" Text="Asignar Usuario" ToolTip="Permite asignar un nuevo usuario a este departamento. Ese usuario podrá ver los mensajes enviados a este departamento y cualquier información correspondiente." Height="36px" />
                                            &nbsp;&nbsp;
                                            <asp:Button ID="btnMensaje" runat="server" OnClick="btnMensaje_Click" Text="Mensajes" ToolTip="Permite revisar y enviar mensajes nuevos a este departamento. Todos los usuarios asignados a él podrán ver el mensaje." Height="36px" />
                                            <br />
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:top;padding-left:10px;padding-top:10px">
                                        <asp:MultiView ID="MultiView2" runat="server">
                                            <asp:View ID="viewAsigUsu" runat="server">
                                                <table class="auto-style1">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblUsuariosAgregaran" runat="server" Font-Bold="True" Font-Size="Medium" Text="Usuarios que se agregarán:"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Añada al listado de abajo los usuarios que desea asociar al departamento. Cuando haya agregado todos los usuarios presione &quot;Asignar seleccionados&quot;.</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:ListBox ID="lbUsuAsignados" runat="server" Height="109px" style="margin-right: 0px" Width="234px"></asp:ListBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp; &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Button ID="btnAsignarUsuarios" runat="server" OnClick="Button1_Click" Text="Asignar seleccionados" ToolTip="Asigna todos los usuarios de la lista de arriba al departamento seleccionado actualmente." Width="190px" />
                                                            &nbsp;
                                                            <asp:Button ID="btnRemoveUserList" runat="server" CssClass="auto-style12" OnClick="btnRemoveUserList_Click" Text="Quitar de la lista" ToolTip="Quita al usuario seleccionado de la lista para no asociarlo al departamento." />
                                                        </td>
                                                    </tr>
                                                </table>
                                                &nbsp;&nbsp;
                                                <br />
                                                <table class="auto-style1">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblUsuariosRegistradosAddDepto" runat="server" Font-Bold="True" Font-Size="Medium" Text="Usuarios registrados en el sistema:"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;Presione &quot;Añadir&quot; para agregar a la lista superior los usuarios que quiere asociar al departamento seleccionado.&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp; &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" Width="100%">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="ID">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblIDUsu" runat="server" Text='<%# Eval("idUsu") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="30px" />
                                                                        <ItemStyle Width="100px" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Nombre">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblNomUsu" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="350px" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Teléfono">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTelefono" runat="server" Text='<%# Eval("telefono") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Correo">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCorreo" runat="server" Text='<%# Eval("correo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:CommandField HeaderText="Acciones" InsertVisible="False" SelectText="Añadir" ShowCancelButton="False" ShowSelectButton="True" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <br />
                                                <br />
                                            </asp:View>
                                            <asp:View ID="viewMensajes" runat="server">
                                                &nbsp;
                                                <br />
                                                <h2>Redactar mensaje:</h2>
                                                Asunto&nbsp;<asp:TextBox ID="txtAsuntoMensaje" runat="server" Width="200px"></asp:TextBox>
                                                <br />
                                                <br />
                                                <asp:TextBox ID="txtMensaje" runat="server" Height="147px" TextMode="MultiLine" Width="459px"></asp:TextBox>
                                                <br />
                                                &nbsp;<br />&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" />
                                                <br />
                                                &nbsp;<br />&nbsp;<asp:Button ID="btnEnviarMensaje" runat="server" OnClick="btnEnviarMensaje_Click" Text="Enviar mensaje" style="height: 26px" />
                                                <br />
                                                <br />
                                                <h2>Historal de mensajes:</h2><asp:GridView ID="grvMensajes" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="Solid" OnSelectedIndexChanged="GridView5_SelectedIndexChanged" Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Recibidos">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Height="150px" ReadOnly="True" Text='<%# Eval("mensajeDepto") %>' TextMode="MultiLine" Width="250px"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Enviados">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" Height="150px" ReadOnly="True" Text='<%# Eval("mensajeAdmin") %>' TextMode="MultiLine" Width="250px"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Adjuntos">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkAdjuntoGrvMensajes" runat="server" CommandName="Select" Enabled='<%# Eval("flagadjunto") %>' OnClick="LinkButton1_Click" Text='<%# Eval("adjunto") %>'></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Hora">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("fechahora") %>' Width="150px"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <table cellpadding="10" cellspacing="0" class="auto-style9">
                                                            <tr>
                                                                <td>No hay conversaciones con los usuarios de este departamento.</td>
                                                            </tr>
                                                        </table>
                                                    </EmptyDataTemplate>
                                                    <RowStyle BorderStyle="None" />
                                                </asp:GridView>
                                            </asp:View>
                                        </asp:MultiView>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <br />
                        </asp:View>
                    </asp:MultiView>

                </td>
            </tr>
            <tr>
                <td colspan="2" id="MainTableTD">

                    <asp:Label ID="lblIDCond" runat="server" Text="Label" Visible="False"></asp:Label>

                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
