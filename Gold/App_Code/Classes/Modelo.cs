using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Modelo
/// </summary>
public class Modelo
{
    public int ID { get; set; }
    public string Nome { get; set; }
    public double Peso { get; set; }
    public string Ferramenta { get; set; }
    public string Descricao { get; set; }
    public double Largura { get; set; }
    public double Altura { get; set; }
    public Boolean Ativado { get; set; }
    public Modelo()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}