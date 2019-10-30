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

        public int createAccount(string sName, string sPass, string sBusiness, string sEmail, string sPhone, string sIndustry)
        {
            int iReturnedValue = -1;

            string sHashedPWd = hashPword(sPass);

            DatabaseConnection db = new DatabaseConnection();

            iReturnedValue = db.createAccount(sName, sBusiness, sHashedPWd, sEmail, sPhone, sIndustry);

            return iReturnedValue;
        }

        public int changePassword(string sPassword, string sEmail)
        {
            string sHashedPassword = hashPword(sPassword);

            string sNewEmail = "";
            foreach(char letter in sEmail)
            {
                if (letter == ',')
                {
                    sNewEmail += ".";
                }
                else
                {
                    sNewEmail += letter;
                }
            }
                       
            // iReturnedValue expected values
            // 1 - Account doesn't exist
            // 2 - Password changed

            int iReturnedValue = -1;

            DatabaseConnection db = new DatabaseConnection();
            iReturnedValue = db.changePassword(sHashedPassword, sNewEmail);

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