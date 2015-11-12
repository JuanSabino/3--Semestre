using Gold.Classes;
using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_OS_Listar : System.Web.UI.Page
{

    //METODO PARA CARREGAR A TABELA 
    private void CarregaGrid()
    {
        OSBD osbd = new OSBD();
        DataSet ds = osbd.SelectAll();
        gvOS.DataSource = ds.Tables[0].DefaultView;
        gvOS.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        CarregaGrid();
    }

    protected void gvOS_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = 0;
        switch (e.CommandName)
        {
            case "fechar":
                index = Convert.ToInt32(e.CommandArgument);
                OS os = new OS();
                OSBD bd = new OSBD();
                os = bd.Select(index);
                string Data = os.HoraSaida.ToShortDateString();
                if (Data == "01/01/0001")
                {
                    Session["OS"] = index;
                    Response.Redirect("Fechar.aspx");
                    lblMensagem.Text = "";
                    
                }
                else
                {
                    lblMensagem.Text = "OS ja encerrada!";
                }
                
                break;
            default:
                break;
        }
     
    }

    protected void btnAbrir_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cadastrar.aspx");
    }
}
