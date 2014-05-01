using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyStockBook.Controllers
{
    public class StocksController : Controller
    {
        //
        // GET: /Stocks/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Stock(String symbolsearch)
        {
            ViewBag.Symbol = symbolsearch;
            return View();
        }

    }
}
