using Gold.Classes;
using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Atividades_Fechar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            int codigo = Convert.ToInt32(Session["AliancaConta"]);
            AliancaConta aliancaConta = new AliancaConta();
            AliancaContaBD bd = new AliancaContaBD();
            aliancaConta = bd.Select(codigo);

            //Additional information: Referência de objeto não definida para uma instância de um objeto.

            txtID.Text = Convert.ToString(aliancaConta.ID);
            txtOS.Text = Convert.ToString(aliancaConta.alianca.OS);
            txtAlianca.Text = Convert.ToString(aliancaConta.alianca.ID);
            txtEntrada.Text = Convert.ToString(aliancaConta.Entrada);
            txtObsEntrada.Text = Convert.ToString(aliancaConta.ObsEntrada);
            txtInicio.Text = Convert.ToString(aliancaConta.Inicio);
            txtFuncionario.Text = Convert.ToString(aliancaConta.funcionario.Nome);
            txtMaquina.Text = Convert.ToString(aliancaConta.maquina.Nome);
            txtConta.Text = Convert.ToString(aliancaConta.conta.Nome);
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Session["AliancaConta"] = null;
        Response.Redirect("Listar.aspx");
    }

    protected void btnFinalizar_Click(object sender, EventArgs e)
    {
        int codigo = Convert.ToInt32(Session["AliancaConta"]);
        AliancaConta alianca = new AliancaConta();
        AliancaContaBD bd = new AliancaContaBD();
        alianca = bd.Select(codigo);
        alianca.Termino = DateTime.Now;
        alianca.Saida = Convert.ToDouble(txtSaida.Text);
        alianca.ObsSaida = txtObsSaida.Text;
        bd.Update(alianca);

        Session["AliancaConta"] = null;
        Response.Redirect("Listar.aspx");
    }

}
