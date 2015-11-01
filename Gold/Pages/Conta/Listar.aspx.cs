using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Gold.Persistencia;
using Gold.Classes;

public partial class Pages_Conta_Listar : System.Web.UI.Page
{

    private void CarregaGrid()
    {
        ContaBD conBD = new ContaBD();
        DataSet ds = conBD.SelectAll();
        gvConta.DataSource = ds.Tables[0].DefaultView;
        gvConta.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        CarregaGrid();
    }

    protected void gvConta_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
