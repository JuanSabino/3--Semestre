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
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Alianca alianca = new Alianca();

        alianca.Produto = txtProduto.Text;
        alianca.modelo.ID = Convert.ToInt32(ddlModelo.SelectedItem.Value);
        alianca.Tamanho = Convert.ToInt32(txtTamanho.Text);
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
    }
}