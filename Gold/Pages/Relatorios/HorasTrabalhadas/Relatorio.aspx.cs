using Gold.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Relatorios_HorasTrabalhadas_Relatorio : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["DATA_INICIAL"] == null || Session["DATA_FINAL"] == null || Session["CLASSIFICA"] == null)
        {
            Response.Redirect("Config.aspx");
        }
        /*
         *variáveis e objetos
         */
        DateTime DataInicial;
        DateTime DataFinal;
        int Classifica;
        HorasTrabalhadasBD bd;
        DataSet ds;
        DataView dv;
        int Ordem;

        DataInicial = Convert.ToDateTime(Session["DATA_INICIAL"]);
        DataFinal = Convert.ToDateTime(Session["DATA_FINAL"]);
        Classifica = Convert.ToInt32(Session["CLASSIFICA"]);

        /*
         *realiza a consulta no banco
         */
        bd = new HorasTrabalhadasBD();
        ds = bd.SelectAll(DataInicial, DataFinal, Classifica);
        lblVazio.Text = "";
        if (ds.Tables[0].Rows.Count == 0)
        {
            lblVazio.Text = "Nenhum registro encontrado com os parâmetros informados.";
            return;
        }
        dv = ds.Tables[0].DefaultView;

        /*
         *verifica o filtro selecionado pelo usuario
         */
        switch (Classifica)
        {
            //filtra por Conta
            default:
            case 0:
                Ordem = 0;
                break;
            //filtra por Funcionario
            case 1:
                Ordem = 2;
                break;
        }
        ImprimeRelatorio(Ordem, dv);

        lblInicial.Text = Convert.ToString(DataInicial.Day) + "/" + Convert.ToString(DataInicial.Month) + "/" + Convert.ToString(DataInicial.Year);
        lblFinal.Text = Convert.ToString(DataFinal.Day) + "/" + Convert.ToString(DataFinal.Month) + "/" + Convert.ToString(DataFinal.Year);
        switch (Classifica)
        {
            //filtra por Conta
            default:
            case 0:
                lblOrdem.Text = "Conta";
                break;
            //filtra por Funcionario
            case 1:
                lblOrdem.Text = "Funcionario";
                break;
        }
    }

    private void ImprimeRelatorio(int Ordem, DataView dv)
    {
        int registros = dv.Count;
        string Filtro = "";
        int Soma = 0;
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
            if (Filtro.CompareTo(Convert.ToString(drvRegistro.Row.ItemArray[Ordem])) != 0)
            {
                //imprime a soma?
                tblRelatorio.Rows.Add(NovoRodape(Filtro, Soma, Ordem));
                Soma = 0;
                Filtro = Convert.ToString(drvRegistro.Row.ItemArray[Ordem]);
                //imprime linha em branco
                TableRow trLinha = new TableRow();
                trLinha.Cells.Add(NovaCelula("  "));
                trLinha.Cells[0].ColumnSpan = 5;
                tblRelatorio.Rows.Add(trLinha);
                //imprime o cabecalho da tabela?
                tblRelatorio.Rows.Add(NovoCabecalho(Ordem));
            }
            //imprime os registros?
            tblRelatorio.Rows.Add(NovaLinha(Ordem, drvRegistro));
            Soma += Convert.ToInt32(drvRegistro.Row.ItemArray[1]);

        }
        //imprime o total do ultimo bloco
        tblRelatorio.Rows.Add(NovoRodape(Filtro, Soma, Ordem));
    }

    private TableCell NovaCelula(string Texto)
    {
        TableCell trCelula = new TableCell();
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
            case 0:
                trCabecalho.Cells.Add(NovaCelulaCabecalho("Conta"));
                trCabecalho.Cells.Add(NovaCelulaCabecalho("Horas Trabalhadas"));
                trCabecalho.Cells.Add(NovaCelulaCabecalho("Funcionário"));
                trCabecalho.Cells.Add(NovaCelulaCabecalho("OS"));
                break;
            //filtra por Funcionario
            case 2:
                trCabecalho.Cells.Add(NovaCelula("Funcionário"));
                trCabecalho.Cells.Add(NovaCelula("Horas Trabalhadas"));
                trCabecalho.Cells.Add(NovaCelula("Conta"));
                trCabecalho.Cells.Add(NovaCelula("OS"));
                break;
        }
        return trCabecalho;
    }

    private TableRow NovaLinha(int Ordem, DataRowView drvRegistro)
    {
        int horas = Convert.ToInt32((Convert.ToInt32(drvRegistro.Row.ItemArray[1])) / 60);
        int minutos = Convert.ToInt32((Convert.ToInt32(drvRegistro.Row.ItemArray[1])) % 60);

        TableRow trLinha = new TableRow();
        switch (Ordem)
        {
            //filtra por Conta
            default:
            case 1:
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[0])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(horas) + ":" + Convert.ToString(minutos) ));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[2])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[3])));
                break;
            //filtra por Funcionario
            case 2:
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[2])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(horas) + ":" + Convert.ToString(minutos)));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[0])));
                trLinha.Cells.Add(NovaCelula(Convert.ToString(drvRegistro.Row.ItemArray[3])));
                break;
        }
        return trLinha;
    }

    private TableRow NovoRodape(string Filtro, int Soma, int Ordem)
    {
        int horas = Convert.ToInt32(Soma / 60);
        int minutos = Convert.ToInt32(Soma % 60);

        TableRow trLinha = new TableRow();
        switch (Ordem)
        {
            //filtra por Conta
            default:
            case 1:
                trLinha.Cells.Add(NovaCelula("<b>Total da conta " + Filtro + ": </b>"));
                break;
            //filtra por Funcionario
            case 2:
                trLinha.Cells.Add(NovaCelula("<b>Total do funcionário " + Filtro + ": </b>"));
                break;
        }
        trLinha.Cells.Add(NovaCelula("<b>" + Convert.ToString(horas) + ":" + Convert.ToString(minutos) + "</b>"));
        trLinha.Cells[1].ColumnSpan = 3;
        return trLinha;
    }
}
