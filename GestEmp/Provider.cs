﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace GestEmp
{
    public static class Provider
    {
        public static SqlConnection cnx = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=GestEmp01;Integrated Security=True");
        public static SqlDataAdapter da = new SqlDataAdapter();
        public static DataSet ds = new DataSet();
        public static SqlCommandBuilder Cmb = new SqlCommandBuilder();

    }
}
