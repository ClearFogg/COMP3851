using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TurboTrend.Model
{
    public class SearchParameters
    {
        public int engagementRate { get; set; }
        public int costPerPost { get; set; }
        public int totalFollowers { get; set; }
        public int totalPostPast60Days { get; set; }
    }
}