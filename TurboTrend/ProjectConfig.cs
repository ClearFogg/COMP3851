﻿using System;
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
            PythonLocation = @"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python36_86\python.exe";
            ScraperLocation = fileSystem + @"\Scraper.py";
        }

        public readonly string[] emailAccountInfo = new string[] { "turbotrendsite@gmail.com", "turbotrend2019!" };

        // Change this to point to your local directory
        private readonly string fileSystem = @"C:\Users\ashle\Documents\UoN\2019\COMP3851B\Interface\Git\TurboTrend\InstagramScraper";

        public string PythonLocation;
        public readonly string ScraperLocation;
        public readonly string DBConnectionString = @"Server=DESKTOP-5JCSS7R;DataBase=TurboTrend;Integrated Security=SSPI";

        public readonly int MaxSearchTerms = 6;
    }
}