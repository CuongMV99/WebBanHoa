<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="adminControl.ascx.cs" Inherits="Test.admin.adminControl" %>
<%@ Register src="User/UserControl.ascx" tagname="UserControl" tagprefix="uc1" %>
<%@ Register src="Menu.ascx" tagname="Menu" tagprefix="uc2" %>
<div>Banner Admin</div>
<table cellspacing="0" cellpadding ="0" style="width="100%;">
    <tr>
        <td style="width:200px;">
            <uc2:Menu ID="Menu1" runat="server" />
        </td>
        <td style="width:10px;">&nbsp</td>
        <td>Content</td>
    </tr>
</table>