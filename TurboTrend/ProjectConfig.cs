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
        public ProjectConfig()
        {
            PythonLocation = fileSystem + @"\Python37-32\python.exe";
            ScraperLocation = fileSystem +  @"\Scraper.py";
        }

        // Change this to point to your local directory
        private readonly string fileSystem = @"C:\Users\Nick\Source\Repos\COMP3851\TurboTrend\InstagramScraper";

        public string PythonLocation;
        public readonly string ScraperLocation;
        public readonly string DBConnectionString = @"Server=DESKTOP-3S0MBR6;DataBase=TurboTrend;Integrated Security=SSPI";

        public readonly int MaxSearchTerms = 6;
    }
}