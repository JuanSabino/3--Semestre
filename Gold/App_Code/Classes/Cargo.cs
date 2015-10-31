using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gold.Classes
{
    /// <summary>
    /// Summary description for Cargo
    /// </summary>
    public class Cargo
    {
        public int ID { get; set; }
        public string Nome { get; set; }
        public Boolean Ativado { get; set; }

        public Cargo()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}