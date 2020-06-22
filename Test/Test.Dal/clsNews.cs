using SQLDB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Dal
{
    class clsNews
    {
        public DataTable GetList()
        {
            SqlCommand sqlCom = new SqlCommand("Select * from KhachHang");
            sqlCom.CommandType = CommandType.Text;
            return SQLDB.SQLDB.GetData(sqlCom);
        }
    }
}
