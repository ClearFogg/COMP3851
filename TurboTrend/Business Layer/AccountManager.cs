using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using TurboTrend.Business;

namespace TurboTrend.Business_Layer
{
    public class AccountManager
    {

        public AccountManager() { }

        public int createAccount(string sName, string sPass, string sBusiness, string sEmail)
        {
            int iReturnedValue = -1;

            string sHashedPWd = hashPword(sPass);

            DatabaseConnection db = new DatabaseConnection();
            iReturnedValue = db.createAccount(sName, sBusiness, sHashedPWd, sEmail);

            return iReturnedValue;
        }

        public int loginAccount(string sUsername, string sPassword)
        {
            int iReturnedValue = -1;

            string sHashedPWd = hashPword(sPassword);

            DatabaseConnection db = new DatabaseConnection();
            iReturnedValue = db.loginUser(sUsername, sHashedPWd);

            return iReturnedValue;
        }

        private string hashPword(string pwordToHash)
        {
            HashAlgorithm algorithm = new SHA256CryptoServiceProvider();

            Byte[] inputBytes = Encoding.UTF8.GetBytes(pwordToHash);

            Byte[] hashedBytes = algorithm.ComputeHash(inputBytes);

            return BitConverter.ToString(hashedBytes);
        }

    }
}