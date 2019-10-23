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
        public readonly string PythonLocation = @"C:\Users\Nick\AppData\Local\Programs\Python\Python37-32\python.exe";
        public readonly string ScraperLocation = @"C:\Users\Nick\source\repos\MajorProjectAssignment\MajorProjectAssignment\InstagramScraper\Scraper.py";

        public readonly int MaxSearchTerms = 6;
    }
}