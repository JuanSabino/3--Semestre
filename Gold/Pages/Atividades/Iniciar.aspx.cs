using Gold.Classes;
using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Atividades_Iniciar : System.Web.UI.Page
{

    //METODO PARA CARREGAR A TABELA 
    private void CarregaGrid()
    {
        AliancaBD bd = new AliancaBD();
        //busca todas as aliancas da ordem de servico
        DataSet ds = bd.SelectAll();
        gvAlianca.DataSource = ds.Tables[0].DefaultView;
        gvAlianca.DataBind();
    }

    private void CarregaDropDownFuncionario()
    {
        FuncionarioBD bd = new FuncionarioBD();
        DataSet ds = bd.SelectAll(true);
        ddlFuncionario.DataSource = ds.Tables[0].DefaultView;
        ddlFuncionario.DataBind();
    }

    private void CarregaDropDownConta()
    {
        ContaBD bd = new ContaBD();
        DataSet ds = bd.SelectAll(true);
        ddlConta.DataSource = ds.Tables[0].DefaultView;
        ddlConta.DataBind();
    }

    private void CarregaDropDownMaquina()
    {
        MaquinaBD bd = new MaquinaBD();
        DataSet ds = bd.SelectAll(true);
        ddlMaquina.DataSource = ds.Tables[0].DefaultView;
        ddlMaquina.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CarregaGrid();
            CarregaDropDownFuncionario();
            CarregaDropDownConta();
            CarregaDropDownMaquina();
        }
            
    }

    

    protected void rblAlianca_SelectedIndexChanged(object sender, EventArgs e)
    {
        //se selecionou sim
        if (rblAlianca.SelectedValue == "1")
        {
            gvAlianca.Enabled = true;
            CarregaGrid();
        }
        else
        {
            gvAlianca.Enabled = false;
            gvAlianca.DataSource = null;
            gvAlianca.DataBind();
            Session["ALIANCA"] = 0;
            lblMensagem.Text = "";
        }
    }

    protected void gvAlianca_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "selecionar":
                Session["ALIANCA"] = Convert.ToInt32(e.CommandArgument);
                lblMensagem.Text = "Aliança: " + Convert.ToString(e.CommandArgument);
                //gvrSelecionado.CssClass = "selecionado";
                break;
            default:
                break;
        }
    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        int alianca = Convert.ToInt32(Session["ALIANCA"]);
            

        AliancaConta aliancaConta = new AliancaConta();
        aliancaConta.Entrada = Convert.ToDouble(txtEntrada.Text);
        aliancaConta.ObsEntrada = txtObs.Text;
        aliancaConta.alianca.ID = alianca;
        aliancaConta.funcionario.ID = Convert.ToInt32(ddlFuncionario.SelectedValue);
        aliancaConta.conta.ID = Convert.ToInt32(ddlConta.SelectedValue);
        aliancaConta.maquina.ID = Convert.ToInt32(ddlMaquina.SelectedValue);
        aliancaConta.Inicio = DateTime.Now;
        aliancaConta.Termino = null ;

        AliancaContaBD bd = new AliancaContaBD();
        if (bd.Insert(aliancaConta))
        {
            lblMensagem2.Text = "Atividade cadastrada!";
        }
        else
        {
            lblMensagem2.Text = "Erro ao cadastrar!";
        }



    }
}