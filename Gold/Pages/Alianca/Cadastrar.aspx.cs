using Gold.Classes;
using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Alianca_Cadastrar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //lista os modelos 
            ModeloBD bd = new ModeloBD();
            DataSet ds = new DataSet();
            ds = bd.SelectAll(true);
            ddlModelo.DataSource = ds;
            ddlModelo.DataBind();
            ddlModelo.Items.Insert(0, "Selecione um modelo");
            ddlModelo.SelectedIndex = 0;

            while (ddlTamanho.Items.Count > 0)
            {
                ddlTamanho.Items.RemoveAt(0);
            }
            for (int i = 1; i <= 35; i++)
            {
                ddlTamanho.Items.Add(Convert.ToString(i));
            }
            
          
        };

    }

   

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        string pagina;
        if (Session["OS"] != null)
        {
            pagina = "../OS/Cadastrar.aspx";
        }
        else
        {
            pagina = "../Index.aspx";
        }
        Response.Redirect(pagina);
    }

    protected void btnCadastrar_Click(object sender, EventArgs e)
    {
        //validação no servidor
        if (String.IsNullOrEmpty(ddlTamanho.SelectedItem.ToString().Trim()))
        {
            lblMensagem.Text = "Preencha o tamanho!";
            return;
        }
        if ( ddlModelo.SelectedIndex == 0)
        {
            lblMensagem.Text = "Selecione um modelo!";
            return;
        }


        Alianca alianca = new Alianca();

        alianca.modelo.ID = Convert.ToInt32(ddlModelo.SelectedItem.Value);
        alianca.Tamanho = Convert.ToInt32(ddlTamanho.SelectedItem.ToString());
        if (Session["OS"] != null)
        {
            alianca.OS = Convert.ToInt32(Session["OS"]);
        }
        else
        {
            alianca.OS = 0;
        }
        alianca.Ativado = true;

        AliancaBD bd = new AliancaBD();
        bd.Insert(alianca);

        if (Session["OS"] != null)
        {
            Response.Redirect("../OS/Cadastrar.aspx");
        }
        lblMensagem.Text = "Aliança cadastrada com sucesso!";
    }
}