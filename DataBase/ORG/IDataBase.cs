﻿using System;
using System.Data;
namespace DataBase
{
    public interface IDataBase
    {
        int ErrorCode { get; }
        string ErrorMessage { get; }
        DataTable ReadDataTableBySql(string strSql);
    }
}
