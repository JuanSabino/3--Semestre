using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Relatorios_OSPorPeriodo_Config : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (! Page.IsPostBack)
        {
            ddlClassifica.Items.Add("Maior tempo");
            ddlClassifica.Items.Add("Data");
            ddlClassifica.SelectedIndex = 0;
        }
    }

    protected void btnGerar_Click(object sender, EventArgs e)
    {
        //validacao no servidor
        if ( String.IsNullOrEmpty( txtDataInicial.Text.Trim() ))
        {
            lblMensagem.Text = "Digite a data inicial!";
            return;
        }
        if (String.IsNullOrEmpty(txtDataFinal.Text.Trim()))
        {
            lblMensagem.Text = "Digite a data final!";
            return;
        }
        DateTime Inicial = Convert.ToDateTime(txtDataInicial.Text);
        DateTime Final = Convert.ToDateTime(txtDataFinal.Text);
        //Verifica se a data final é menor que a inicial
        if (Inicial.CompareTo(Final) > 0)
        {
            lblMensagem.Text = "Data final deve ser maior que data inicial!";
            return;
        }
        Session["DATA_INICIAL"] = txtDataInicial.Text;
        Session["DATA_FINAL"] = txtDataFinal.Text;
        Session["CLASSIFICA"] = ddlClassifica.SelectedIndex;
        Response.Redirect("Relatorio.aspx");



    }
}