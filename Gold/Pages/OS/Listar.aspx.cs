using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_OS_Listar : System.Web.UI.Page
{

    //METODO PARA CARREGAR A TABELA 
    private void CarregaGrid()
    {
        OSBD osbd = new OSBD();
        DataSet ds = osbd.SelectAll();
        gvOS.DataSource = ds.Tables[0].DefaultView;
        gvOS.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        CarregaGrid();
    }
}
