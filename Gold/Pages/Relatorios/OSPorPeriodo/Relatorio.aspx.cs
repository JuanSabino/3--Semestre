using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
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


        OSPorPeriodoBD bd = new OSPorPeriodoBD();
        DataSet ds = bd.SelectAll(DataInicial, DataFinal, Classifica);
        gvRelatorio.DataSource = ds.Tables[0].DefaultView;
        gvRelatorio.DataBind();

        lblInicial.Text = Convert.ToString(DataInicial.Day) + "/" + Convert.ToString(DataInicial.Month) + "/" + Convert.ToString(DataInicial.Year);
        lblFinal.Text = Convert.ToString(DataFinal.Day) + "/" + Convert.ToString(DataFinal.Month) + "/" + Convert.ToString(DataFinal.Year);
        if (Classifica == 0)
        {
            lblOrdem.Text = "Maior tempo";
        }
        else
        {
            lblOrdem.Text = "Data de abertura";
        }

    }
}