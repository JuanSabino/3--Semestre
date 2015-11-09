using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Relatorios_OSPorPeriodo_Relatorio : System.Web.UI.Page
{
    private static DateTime DataInicial;
    private static DateTime DataFinal;
    private static int Classifica;

    protected void Page_Load(object sender, EventArgs e)
    {
        if ( Session["DATA_INICIAL"] == null  || Session["DATA_FINAL"] == null || Session["CLASSIFICA"] == null) {
            Response.Redirect("Config.aspx");
        }
        DataInicial = Convert.ToDateTime(Session["DATA_INICIAL"]);
        DataFinal = Convert.ToDateTime(Session["DATA_FINAL"]);
        Classifica = Convert.ToInt32(Session["CLASSIFICA"]);

    }
}