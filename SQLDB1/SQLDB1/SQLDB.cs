using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace SQLDB
{
    public class SQLDB
    {
            static string _ConnectionString = "";

            public static string ConnectionString
            {
                set
                {
                    _ConnectionString = value;
                }
                get
                {
                    return _ConnectionString;
                }
            }

            static SqlConnection GetConnection()
            {
                SqlConnection conn = new SqlConnection(ConnectionString);
                conn.Open();
                return conn;
            }

            public static void ExecuteNoneQuery(SqlCommand cmd) // thực thi dữ liệu với insert update delete
            {
                if (cmd.Connection != null)
                {
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    using (SqlConnection conn = GetConnection())
                    {
                        cmd.Connection = GetConnection();
                        cmd.ExecuteNonQuery();
                    }
                }
            }

            public static DataTable GetData(SqlCommand cmd)
            {
                if (cmd.Connection != null)
                {
                    using (DataSet ds = new DataSet())
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter())
                        {
                            da.SelectCommand = cmd;
                            da.Fill(ds);
                            return ds.Tables[0];
                        }
                    }
                }
                else
                {
                    using (SqlConnection conn = GetConnection())
                    {
                        using (DataSet ds = new DataSet())
                        {
                            using (SqlDataAdapter da = new SqlDataAdapter())
                            {
                                cmd.Connection = conn;
                                da.SelectCommand = cmd;
                                da.Fill(ds);
                                return ds.Tables[0];
                            }
                        }
                    }
                }
            }

      }
}
