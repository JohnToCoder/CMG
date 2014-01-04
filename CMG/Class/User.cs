using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMG.Class
{
    //创建用户类  保存用户信息  保存Session值
    public class User
    {
        private string ID;
        private string UserID;
        private string UserName;
        private string UserPW;
        private string UserType;
        private string TypeName;
        private string UserTel;
        private string UserEmail;
        private string CreatDate;
        private string Creator;

        public string sID { get { return ID; } set { ID = value; } }
        public string uID { get { return UserID; } set { UserID = value; } }
        public string uName { get { return UserName; } set { UserName = value; } }
        public string uPW { get { return UserPW; } set { UserPW = value; } }
        public string uUserType { get { return UserType; } set { UserType = value; } }
        public string uTypeName { get { return TypeName; } set { TypeName = value; } }
        public string uEmail { get { return UserEmail; } set { UserEmail = value; } }
        public string uTel { get { return UserTel; } set { UserTel = value; } }
        public string uCreatDate { get { return CreatDate; } set { CreatDate = value; } }
        public string uCreator { get { return Creator; } set { Creator = value; } }


    }
}