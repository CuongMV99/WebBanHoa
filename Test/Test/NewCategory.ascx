<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewCategory.ascx.cs" Inherits="Test.NewCategory" %>
<asp:DropDownList ID="drpNewCategory" runat="server" OnSelectedIndexChanged="drpNewCategory_SelectedIndexChanged"></asp:DropDownList>
<asp:Repeater ID="rptNews" runat ="server">
    <ItemTemplate><%#:Eval("TenKH") %></ItemTemplate>
</asp:Repeater>