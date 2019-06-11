using System;
namespace QY.Stage._3Layer.DAL
{    
    /// <summary>
    /// UsrSessions 
    /// </summary>
    public partial class UsrSessions    
    {    
        user.UserId = reader.GetInt32(0);
        user.DeptId = reader.GetInt32(1);
        user.LoginName = reader.GetString(2);
        user.LoginPass = reader.GetString(3);
        user.RealName = reader.GetString(4);
        user.Sex = reader.GetString(5);
        user.BirthDate = reader.GetDateTime(6);
        user.Address = (reader["Address"] == DBNull.Value) ? null : (String)reader["Address"];
        user.Phone = (reader["Phone"] == DBNull.Value) ? null : (String)reader["Phone"];
        user.Email = (reader["Email"] == DBNull.Value) ? null : (String)reader["Email"];
        user.CreateTime = reader.GetDateTime(10);
        user.LoginTime = reader.GetDateTime(11);
        user.LastLoginTime = reader.GetDateTime(12);
        user.LoginCount = reader.GetInt32(13);
        user.IsEnabled = reader.GetInt32(14);
        user.IsDeleted = reader.GetInt32(15);
        user.ExtendField1 = reader.GetInt32(16);
        user.ExtendField2 = reader.GetInt32(17);
        user.ExtendField3 = (reader["ExtendField3"] == DBNull.Value) ? null : (String)reader["ExtendField3"];
        user.ExtendField4 = (reader["ExtendField4"] == DBNull.Value) ? null : (String)reader["ExtendField4"];
        user.ExtendField5 = (reader["ExtendField5"] == DBNull.Value) ? null : (String)reader["ExtendField5"];
    }
}
    
