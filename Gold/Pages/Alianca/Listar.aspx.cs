using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Alianca_Listar : System.Web.UI.Page
{
    //METODO PARA CARREGAR A TABELA 
    private void CarregaGrid()
    {
        AliancaBD bd = new AliancaBD();
        DataSet ds = bd.SelectAll();
        if (ds.Tables[0].Rows.Count != 0)
        {
            gvAlianca.DataSource = ds.Tables[0].DefaultView;
            gvAlianca.DataBind();
            lblVazio.Text = "";
        }
        else
        {
            lblVazio.Text = "Nenhum registro encontrado!";
        }
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        CarregaGrid();
    }

    protected void gvAlianca_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}