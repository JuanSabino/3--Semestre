using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Modelo_Listar : System.Web.UI.Page
{

    //METODO PARA CARREGAR A TABELA 
    private void CarregaGrid()
    {
        ModeloBD bd = new ModeloBD();
        DataSet ds = bd.SelectAll();
        gvModelo.DataSource = ds.Tables[0].DefaultView;
        gvModelo.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        CarregaGrid();
    }

    protected void gvModelo_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}