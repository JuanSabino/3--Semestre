using Gold.Classes;
using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Atividades_Listar : System.Web.UI.Page
{

        //METODO PARA CARREGAR A TABELA 
        private void CarregaGrid()
        {
            AliancaContaBD aliancabd = new AliancaContaBD();
            DataSet ds = aliancabd.SelectAll(true,1);
            gvAtividade.DataSource = ds.Tables[0].DefaultView;
            gvAtividade.DataBind();
            ds = aliancabd.SelectAll(true,2);
            gvEncerradas.DataSource = ds.Tables[0].DefaultView;
    }

        protected void Page_Load(object sender, EventArgs e)
        {
            CarregaGrid();
        }

        protected void gvAtividade_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = 0;
            switch (e.CommandName)
            {
                case "fechar":
                    index = Convert.ToInt32(e.CommandArgument);
                    AliancaConta atividade = new AliancaConta();
                    AliancaContaBD bd = new AliancaContaBD();
                    atividade = bd.Select(index);
                    string Data = atividade.Termino.ToShortDateString();
                    if (Data == "01/01/0001")
                    {
                        Session["AliancaConta"] = index;
                        Response.Redirect("Fechar.aspx");
                        lblMensagem.Text = "";
                    }
                    else
                    {
                        lblMensagem.Text = "Atividade já encerrada!";
                    }
                    break;
                default:
                    break;
            }

    }

    protected void btnAbrir_Click(object sender, EventArgs e)
    {
        Response.Redirect("Iniciar.aspx");
    }
}
