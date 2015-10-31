using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Maquina
/// </summary>
public class Maquina
{
    public int ID { get; set; }
    public string Nome { get; set; }
    public Boolean Ativado { get; set; }
    public Maquina()
    {
        //
        // TODO: Add constructor logic here
        //
        Ativado = true;
    }
}