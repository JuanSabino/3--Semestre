using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Relatorios_Perdas_Relatorio : System.Web.UI.Page
{
    private static DateTime DataInicial;
    private static DateTime DataFinal;
    private static int Classifica;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["DATA_INICIAL"] == null || Session["DATA_FINAL"] == null || Session["CLASSIFICA"] == null)
        {
            Response.Redirect("Config.aspx");
        }
        /*
         *variáveis e objetos
         */
        PerdasBD bd;
        DataSet ds;
        DataView dv;
        //pega a quantidade de registros 
        int registros;
        //inicia a variavel do filtro
        String Filtro = "";
        Double Soma = 0;
        int Ordem;
        TableRow trLinha;
        TableCell tcCelula;


        DataInicial = Convert.ToDateTime(Session["DATA_INICIAL"]);
        DataFinal = Convert.ToDateTime(Session["DATA_FINAL"]);
        Classifica = Convert.ToInt32(Session["CLASSIFICA"]);

        /*
         *realiza a consulta no banco
         */
        bd = new PerdasBD();
        ds = bd.SelectAll(DataInicial, DataFinal, Classifica);
        dv = ds.Tables[0].DefaultView;
        registros = dv.Count;

        /*
         *verifica o filtro selecionado pelo usuario
         */
        switch (Classifica)
        {
            //filtra por Conta
            case 0:
                Ordem = 1;
                break;
            //filtra por Funcionario
            case 1:
                Ordem = 2;
                break;
            //filtra por OS
            case 2:
                Ordem = 4;
                break;
            default:
                Ordem = 1;
                break;
        }


        /*
         *percorre todos os registros para montar o relatório
         */
        for (int i = 0; i < registros; i++)
        {
            //pega o registro atual
            DataRowView drvRegistro = dv[i];
            //primeiro bloco
            if (Filtro == "")
            {
                Filtro = Convert.ToString(drvRegistro.Row.ItemArray[Ordem]);
                
                Soma = 0;
                //imprime o cabecalho da tabela?
                tblRelatorio.Rows.Add(NovoCabecalho(Ordem));
            }
            //proximo bloco
            if ( Filtro.CompareTo(Convert.ToString(drvRegistro.Row.ItemArray[Ordem]) ) != 0)
            {
                trLinha = new TableRow();
                //imprime a soma?
                trLinha.Cells.Add(NovaCelula("<b>Total de " + Filtro + ": </b>" ));
                trLinha.Cells.Add(NovaCelula("<b>" + Convert.ToString(Soma) + "</b>"));
                trLinha.Cells[1].ColumnSpan = 4;
                tblRelatorio.Rows.Add(trLinha);
                Soma = 0;
                Filtro = Convert.ToString(drvRegistro.Row.ItemArray[Ordem]);
                //imprime linha em branco
                trLinha = new TableRow();
                trLinha.Cells.Add(NovaCelula("  "));
                trLinha.Cells[0].ColumnSpan = 5;
                tblRelatorio.Rows.Add(trLinha);
                //imprime o cabecalho da tabela?
                tblRelatorio.Rows.Add( NovoCabecalho(Ordem) );
            }
            //imprime os registros?
            tblRelatorio.Rows.Add(NovaLinha(Ordem,drvRegistro));
            //String teste = Convert.ToString(drvRegistro.Row.ItemArray[2]);
            Soma += Convert.ToDouble(drvRegistro.Row.ItemArray[0]);
           
        }
        //imprime o total do ultimo bloco
        trLinha = new TableRow();
        trLinha.Cells.Add(NovaCelula("<b>Total de " + Filtro + ": </b>"));
        trLinha.Cells.Add(NovaCelula("<b>" + Convert.ToString(Soma) + "</b>"));
        trLinha.Cells[1].ColumnSpan = 4;
        tblRelatorio.Rows.Add(trLinha);



        lblInicial.Text = Convert.ToString(DataInicial.Day) + "/" + Convert.ToString(DataInicial.Month) + "/" + Convert.ToString(DataInicial.Year);
        lblFinal.Text = Convert.ToString(DataFinal.Day) + "/" + Convert.ToString(DataFinal.Month) + "/" + Convert.ToString(DataFinal.Year);
        if (Classifica == 0)
        {
            lblOrdem.Text = "Conta";
        }
        else if (Classifica == 1)
        {
            lblOrdem.Text = "Funcionario";
        }
        else
        {
            lblOrdem.Text = "Ordem de Servico";
        }
    }

    private TableCell NovaCelula(string Texto)
    {
        TableCell trCelula =  new TableCell();
        trCelula.Text = Texto;
        return trCelula;
    }

    private TableHeaderCell NovaCelulaCabecalho(string Texto)
    {
        TableHeaderCell trCelula = new TableHeaderCell();
        trCelula.Text = Texto;
        return trCelula;
    }

    private TableHeaderRow NovoCabecalho(int Ordem)
    {
        TableHeaderRow trCabecalho = new TableHeaderRow();
        switch (Ordem)
        {
            //filtra por Conta
            default:
            case 1:
                trCabecalho.Cells.Add(NovaCelulaCabecalho("Conta"));
                trCabecalho.Cells.Add(NovaCelulaCabecalho("Perda"));
                trCabecalho.Cells.Add(NovaCelulaCabecalho("Funcionário"));
                trCabecalho.Cells.Add(NovaCelulaCabecalho("Máquina"));
                trCabecalho.Cells.Add(NovaCelulaCabecalho("OS"));
                break;
            //filtra por Funcionario
            case 2:
                trCabecalho.Cells.Add(NovaCelula("Funcionário"));
                trCabecalho.Cells.Add(NovaCelula("Perda"));
                trCabecalho.Cells.Add(NovaCelula("Conta"));
                trCabecalho.Cells.Add(NovaCelula("Máquina"));
                trCabecalho.Cells.Add(NovaCelula("OS"));
                break;
            //filtra por OS
            case 4:
                trCabecalho.Cells.Add(NovaCelula("OS"));
                trCabecalho.Cells.Add(NovaCelula("Perda"));
                trCabecalho.Cells.Add(NovaCelula("Funcionário"));
                trCabecalho.Cells.Add(NovaCelula("Máquina"));
                trCabecalho.Cells.Add(NovaCelula("Conta"));
                break;
        }
        return trCabecalho;
    }

    private TableRow NovaLinha(int Ordem, DataRowView drvRegistro)
    {
        TableRow trLinha = new TableRow();
        switch (Ordem)
        {
            //filtra por Conta
            default:
            case 1:
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[1])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[0])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[2])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[3])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[4])));
                break;
            //filtra por Funcionario
            case 2:
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[2])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[0])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[1])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[3])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[4])));
                break;
            //filtra por OS
            case 4:
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[4])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[0])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[2])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[3])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[1])));
                break;
        }
        return trLinha;
    }
}