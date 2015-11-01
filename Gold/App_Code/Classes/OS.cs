using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gold.Classes
{
    /// <summary>
    /// Summary description for OS
    /// </summary>
    public class OS
    {
        public int ID { get; set; }
        public DateTime HoraEntrada { get; set; }
        public DateTime HoraSaida { get; set; }
        public string Loja { get; set; }
        public string Observacao { get; set; }
        public Boolean Ativado { get; set; }


        public OS()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}