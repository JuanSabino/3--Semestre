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

    //método para buscar a Id da próxima OS
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

   
    

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        //validação no servidor
        if ( String.IsNullOrEmpty( txtLoja.Text.Trim() ))
        {
            lblMensagem.Text = "Digite uma loja!";
            return;
        }

        OS os = new OS();
        OSBD bd = new OSBD();

        os.Loja = txtLoja.Text;
        os.Observacao = txtObs.Text;
        os.Ativado = true;

        if ( bd.Insert(os) )
        {
            Session["LOJA"] = null;
            Session["OBS"] = null;
            lblMensagem.Text = "OS Cadastrada com Sucesso!";
            txtLoja.Text = "";
            txtObs.Text = "";
            Session["OS"] = ProximaOs();
            txtOs.Text = Convert.ToString(Session["OS"]);
            gvAlianca.DataSource = null;
            gvAlianca.DataBind();
        }
        else
        {
            lblMensagem.Text = "Houve um erro ao cadastrar!";
        }
       

    }

    protected void btnAddAlianca_Click(object sender, EventArgs e)
    {
        Session["LOJA"] = txtLoja.Text;
        Session["OBS"] = txtObs.Text;
        Response.Redirect("../Alianca/Cadastrar.aspx");
    }



    protected void btncancelar_Click(object sender, EventArgs e)
    {
        int index = Convert.ToInt32(Session["OS"]);
        AliancaBD bd = new AliancaBD();
        bd.Delete(index);
        Session["OS"] = null;
        Session["LOJA"] = null;
        Session["OBS"] = null;
        Response.Redirect("Listar.aspx");
    }

    protected void gvAlianca_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}