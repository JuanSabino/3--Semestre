using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gold.Classes
{

    /// <summary>
    /// Summary description for AliancaConta
    /// </summary>
    public class AliancaConta
    {
        public int ID { get; set; }
        public double Entrada { get; set; }
        public string ObsEntrada { get; set; }
        public double Saida { get; set; }
        public string ObsSaida { get; set; }
        public DateTime Inicio { get; set; }
        public DateTime Termino { get; set; }
        public Funcionario funcionario { get; set; }
        public Maquina maquina { get; set; }
        public Alianca alianca { get; set; }
        public Conta conta { get; set; }
        public Boolean Ativado { get; set; }


        public AliancaConta()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}