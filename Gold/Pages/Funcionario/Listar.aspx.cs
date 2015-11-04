using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Funcionario_Listar : System.Web.UI.Page
{
    //METODO PARA CARREGAR A TABELA 
    private void CarregaGrid()
    {
        FuncionarioBD bd = new FuncionarioBD();

        DataSet ds = bd.SelectAll();

        gvFuncionario.DataSource = ds.Tables[0].DefaultView;
        gvFuncionario.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        CarregaGrid();
    }
}