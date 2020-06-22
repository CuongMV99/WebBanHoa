using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using System.Configuration;
using System.Data;

namespace Test
{
    public partial class NewCategory : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 // Câu truy vấn dữ liệu
                SqlCommand sqlCom = new SqlCommand("Select * from KhachHang");
                //Đưa dữ liệu từ Table lên DropdownList;
                drpNewCategory.DataSource = SQLDB.SQLDB.GetData(sqlCom);
                drpNewCategory.DataValueField = "idKH";
                drpNewCategory.DataTextField = "TenKH";
                drpNewCategory.DataBind();
            }

            
        }

        protected void drpNewCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand sqlCom = new SqlCommand("Select * from KhachHang where idKH = @idKH");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@idKH", int.Parse(drpNewCategory.SelectedValue.ToString()));

            rptNews.DataSource = SQLDB.SQLDB.GetData(sqlCom);
            rptNews.DataBind();
        }
    };
}