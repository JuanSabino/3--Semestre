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


    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        //pega o CPF e a senha digitados pelo usuario
        String cpf = Login1.UserName;
        string senha = Login1.Password;
        
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
            Login1.FailureText = "Funcionario nao localizado com esses dados.<br>Favor verificar CPF e senha!";
        }
        //se houve algum erro
        else
        {
            Login1.FailureText = "Erro ao acessar o banco de dados.<br>Por favor, tente novamente mais tarde!";
        }
    }
}
