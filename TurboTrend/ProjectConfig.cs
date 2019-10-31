using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TurboTrend
{
    /// <summary>
    ///  Change these values to point to your local installation of Python,
    ///  and the local directory of the Scraper.py script
    ///  This file also contains any configurable restrictions that we may want to implement. For example I've created a max search term limiter.   
    /// </summary>

    public class ProjectConfig
    {
        public readonly string libBatLocation = @"C:\Users\j-fog\Desktop\TurboTrend\TurboTrend\InstagramScraper\InstallRequiredLibraries.bat";
        public readonly string PythonLocation = @"C:\Users\j-fog\AppData\Local\Programs\Python\Python38-32\python.exe";
        public readonly string ScraperLocation = @"C:\Users\j-fog\Desktop\TurboTrend\TurboTrend\InstagramScraper\Scraper.py";
        public readonly string DBConnectionString = @"Server=DESKTOP-UOOEQ82\SQLEXPRESS;DataBase=TurboTrend;Integrated Security=SSPI";

        public readonly int MaxSearchTerms = 3;
    }
}