using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gold.Classes
{
/// <summary>
    /// Summary description for Alianca
    /// </summary>
    public class Alianca
    {
        public int ID { get; set; }
        public string Produto { get; set; }
        public Modelo modelo { get; set; }
        public int Tamanho { get; set; }
        public int OS { get; set; }
        public Boolean Ativado { get; set; }

        public Alianca()
        {
            Ativado = true;
            modelo = new Modelo();
        }
    }

}