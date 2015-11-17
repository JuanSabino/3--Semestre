using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Maquina_Listar : System.Web.UI.Page
{
    //METODO PARA CARREGAR A TABELA 
    private void CarregaGrid()
    {
        MaquinaBD bd = new MaquinaBD();
        DataSet ds = bd.SelectAll();
        
        if (ds.Tables[0].Rows.Count != 0)
        {
            gvMaquina.DataSource = ds.Tables[0].DefaultView;
            gvMaquina.DataBind();
        }
        else
        {
            lblVazio.Text = "Nenhum registro encontrado!";
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //se nao houver a sessao com o codigo do funcionario, redireciona para a pagina de login
        if (Session["FUN_ID"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        CarregaGrid();
    }
}