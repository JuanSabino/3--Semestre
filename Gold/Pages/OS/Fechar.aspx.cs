using Gold.Classes;
using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_OS_Fechar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int codigo = Convert.ToInt32(Session["OS"]);
            OS os = new OS();
            OSBD bd = new OSBD();
            os = bd.Select(codigo);

            txtId.Text = Convert.ToString(os.ID);
            txtAbertura.Text = Convert.ToString(os.HoraEntrada);
            txtLoja.Text = os.Loja;
            txtObs.Text = os.Observacao;
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Session["OS"] = null;
        Response.Redirect("Listar.aspx");
    }

    protected void btnFinalizar_Click(object sender, EventArgs e)
    {
        int codigo = Convert.ToInt32(Session["OS"]);

        AliancaBD aliBD = new AliancaBD();
        DataSet ds = aliBD.SelectAll(codigo, 1);

        OS os = new OS();
        OSBD bd = new OSBD();
        os = bd.Select(codigo);
        os.HoraSaida = DateTime.Now;
        os.Ativado = true;
        bd.Update(os);
        
        Session["OS"] = null;
        Response.Redirect("Listar.aspx");
    }
}