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
        //TODO
        //buscar em atividades, e exibir somente as alianças que não estão sendo trabalhadas
        AliancaBD bd = new AliancaBD();
        //busca todas as aliancas da ordem de servico
        DataSet ds = bd.SelectAll(0,2);
        gvAlianca.DataSource = ds.Tables[0].DefaultView;
        gvAlianca.DataBind();
    }

    private void CarregaDropDownFuncionario()
    {
        FuncionarioBD bd = new FuncionarioBD();
        DataSet ds = bd.SelectAll(true);
        ddlFuncionario.DataSource = ds.Tables[0].DefaultView;
        ddlFuncionario.DataBind();
        ddlFuncionario.Items.Insert(0, "Selecione um funcionário");
        ddlFuncionario.SelectedIndex = 0;
    }

    private void CarregaDropDownConta()
    {
        ContaBD bd = new ContaBD();
        DataSet ds = bd.SelectAll(true);
        ddlConta.DataSource = ds.Tables[0].DefaultView;
        ddlConta.DataBind();
        ddlConta.Items.Insert(0, "Selecione uma conta");
        ddlConta.SelectedIndex = 0;
    }

    private void CarregaDropDownMaquina()
    {
        MaquinaBD bd = new MaquinaBD();
        DataSet ds = bd.SelectAll(true);
        ddlMaquina.DataSource = ds.Tables[0].DefaultView;
        ddlMaquina.DataBind();
        ddlMaquina.Items.Insert(0, "Selecione uma máquina");
        ddlMaquina.SelectedIndex = 0;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CarregaGrid();
            CarregaDropDownFuncionario();
            CarregaDropDownConta();
            CarregaDropDownMaquina();
            if ( Convert.ToInt32( Session["OK"] ) == 1)
            {
                lblMensagem2.Text = "Atividade cadastrada!";
                Session["OK"] = null;
            }
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
        //validação no servidor
        if ( String.IsNullOrEmpty( txtEntrada.Text.Trim() ))
        {
            lblMensagem2.Text = "Preencha o valor de entrada em gramas!";
            return;
        }
        if ( ( rblAlianca.SelectedValue == "1" ) && ( Convert.ToInt32(Session["ALIANCA"]) == 0  || Session["ALIANCA"] == null ) )
        {
            lblMensagem2.Text = "Selecione uma aliança!";
            return;
        }
        if ( ddlFuncionario.SelectedIndex == 0)
        {
            lblMensagem2.Text = "Selecione um funcionário!";
            return;
        }
        if (ddlConta.SelectedIndex == 0)
        {
            lblMensagem2.Text = "Selecione uma conta!";
            return;
        }
        if (ddlMaquina.SelectedIndex == 0)
        {
            lblMensagem2.Text = "Selecione uma máquina!";
            return;
        }


        int alianca = Convert.ToInt32(Session["ALIANCA"]);
            

        AliancaConta aliancaConta = new AliancaConta();
        aliancaConta.Entrada = Convert.ToDouble(txtEntrada.Text);
        aliancaConta.ObsEntrada = txtObs.Text;
        aliancaConta.alianca.ID = alianca;
        aliancaConta.funcionario.ID = Convert.ToInt32(ddlFuncionario.SelectedValue);
        aliancaConta.conta.ID = Convert.ToInt32(ddlConta.SelectedValue);
        aliancaConta.maquina.ID = Convert.ToInt32(ddlMaquina.SelectedValue);

        AliancaContaBD bd = new AliancaContaBD();
        if (bd.Insert(aliancaConta))
        {
            Session["OK"] = 1;
            Response.Redirect("Iniciar.aspx");
        }
        else
        {
            lblMensagem2.Text = "Erro ao cadastrar!";
        }



    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Listar.aspx");
    }
}