using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Pages_Login : System.Web.UI.Page
{
    //metodo executado quando a pagina e carregada
    protected void Page_Load(object sender, EventArgs e)
    {
        //se a variavel de sessao FUN_ID existe, e porque o usuario ja esta logado
        //entao redireciona para a pagina Index.aspx
        if (Session["FUN_ID"] != null)
        {
            Response.Redirect("Index.aspx");
        }
    }


   

    protected void btnLogar_Click(object sender, EventArgs e)
    {
        if ( String.IsNullOrEmpty( txtCpf.Text.Trim() ))
        {
            lblMensagem.Text = "Por favor, digite o CPF!";
            txtCpf.Focus();
        }
        if (String.IsNullOrEmpty(txtSenha.Text.Trim()))
        {
            lblMensagem.Text = "Por favor, digite a Senha!";
            txtSenha.Focus();
        }

        //pega o CPF e a senha digitados pelo usuario
        string cpf = txtCpf.Text;
        string senha = txtSenha.Text;


        FuncionarioBD bd = new FuncionarioBD();
        int codigo = bd.Logar(cpf, senha);
        //se funcionario encontrado
        if (codigo > 0)
        {
            Session["FUN_ID"] = codigo;
            Response.Redirect("Index.aspx");
        }
        //se funcionario nao encontrado
        else if (codigo == 0)
        {
            lblMensagem.Text = "Funcionario nao localizado com esses dados.<br>Favor verificar CPF e senha!";
        }
        //se houve algum erro
        else
        {
            lblMensagem.Text = "Erro ao acessar o banco de dados.<br>Por favor, tente novamente mais tarde!";
        }
    }
}
