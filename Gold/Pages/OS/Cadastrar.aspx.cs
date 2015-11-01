using Gold.Classes;
using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_OS_Cadastrar : System.Web.UI.Page
{

  
    private int ProximaOs()
    {
        OSBD bd = new OSBD();
        int codigo = bd.SelectLast();
        return codigo + 1;
    }

    //METODO PARA CARREGAR A TABELA 
    private void CarregaGrid()
    {
        AliancaBD bd = new AliancaBD();
        int codigo = Convert.ToInt32(Session["OS"]);
        //busca todas as aliancas da ordem de servico
        DataSet ds = bd.SelectAll(codigo);
        gvAlianca.DataSource = ds.Tables[0].DefaultView;
        gvAlianca.DataBind();
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        //verifica se ja existe o numero da OS na Session
        if (Session["OS"] == null)
        {
            Session["OS"] = ProximaOs();
        }
        txtOs.Text = Convert.ToString(Session["OS"]);
        if (!Page.IsPostBack)
        {
            txtLoja.Text = Session["LOJA"] == null ? "" : Convert.ToString(Session["LOJA"]);
            txtObs.Text = Session["OBS"] == null ? "" : Convert.ToString(Session["OBS"]);
        }
        
        
        CarregaGrid();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["LOJA"] = txtLoja.Text;
        Session["OBS"] = txtObs.Text;
        Response.Redirect("../Alianca/Cadastrar.aspx");
    }
    

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        OS os = new OS();
        OSBD bd = new OSBD();

        os.Loja = txtLoja.Text;
        os.Observacao = txtObs.Text;

        bd.Insert(os);
        Session["OS"] = null;
        Session[""] = null;
        Session["OS"] = null;
        Response.Redirect("Cadastrar.aspx");

    }
}