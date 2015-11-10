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
        Session["DATA_INICIAL"] = txtDataInicial.Text;
        Session["DATA_FINAL"] = txtDataFinal.Text;
        Response.Redirect("Relatorio.aspx");



    }
}