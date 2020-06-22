<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsCategory.ascx.cs" Inherits="Test.admin.News.NewsCategory" %>
<div>DANH SÁCH TIN TỨC</div>
<div>
    <asp:Repeater ID="rptNewsCategory" runat="server">
        <HeaderTemplate>
            <table style="width:100%;">
                <tr>
                    <td style="width:300px;">Category Name</td>
                    <td style="width:50px;">Order</td>
                    <td style="width:100px;">Active</td>
                    <td></td>
                </tr>
            </table>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%#:Eval("") %></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>

        </FooterTemplate>
    </asp:Repeater>
</div>