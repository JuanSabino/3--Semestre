using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Pages_Relatorios_OSPorPeriodo_Relatorio : System.Web.UI.Page
{
    private static DateTime DataInicial;
    private static DateTime DataFinal;

    protected void Page_Load(object sender, EventArgs e)
    {
        if ( Session["DATA_INICIAL"] == null  || Session["DATA_FINAL"] == null ) {
            Response.Redirect("Config.aspx");
        }
        DataInicial = Convert.ToDateTime(Session["DATA_INICIAL"]);
        DataFinal = Convert.ToDateTime(Session["DATA_FINAL"]);


        ModelosVendidosBD bd = new ModelosVendidosBD();
        DataSet ds = bd.SelectAll(DataInicial, DataFinal);
        if (ds.Tables[0].Rows.Count == 0)
        {
            lblVazio.Text = "Nenhum registro encontrado com os parâmetros informados.";
            return;
        }
        gvRelatorio.DataSource = ds.Tables[0].DefaultView;
        gvRelatorio.DataBind();

        //gráfico
        crtRelatorio.Series["Default"].Points.DataBind(ds.Tables[0].DefaultView,"Modelo", "Quantidade", ""); //utiliza o dataset para inserir informações no gráfico
        crtRelatorio.Series["Default"].ChartType = SeriesChartType.Pie; //tipo do gráfico
        crtRelatorio.Series["Default"]["PieLabelStyle"] = "Outside"; //estilo da legenda no gráfico
        crtRelatorio.Series["Default"]["DrawingStyle"] = "Concave"; //estilo do gráfico
        crtRelatorio.Series["Default"]["CollectedThreshold"] = "1"; //valor mínimo para exibir separadamente, abaixo disso agrupa
        crtRelatorio.Series["Default"]["CollectedLabel"] = "Outros Modelos"; //legenda para dados agrupados
        crtRelatorio.Series["Default"]["CollectedLegendText"] = "Outros Modelos";//legenda para dados agrupados
        crtRelatorio.Legends[0].Enabled = true;//exibe a legenda lateral
        //gráfico



        lblInicial.Text = Convert.ToString(DataInicial.Day) + "/" + Convert.ToString(DataInicial.Month) + "/" + Convert.ToString(DataInicial.Year);
        lblFinal.Text = Convert.ToString(DataFinal.Day) + "/" + Convert.ToString(DataFinal.Month) + "/" + Convert.ToString(DataFinal.Year);
        

    }

    protected void gvRelatorio_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}