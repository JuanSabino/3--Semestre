using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gold.Classes
{

    /// <summary>
    /// Summary description for Modelo
    /// </summary>
    public class Modelo
    {
        public int ID { get; set; }
        public string Nome { get; set; }
        public double Peso { get; set; }
        public string Descricao { get; set; }
        public double Largura { get; set; }
        public double Altura { get; set; }
        public Boolean Ativado { get; set; }

        public Modelo()
        {
            Ativado = true;
        }
    }

}