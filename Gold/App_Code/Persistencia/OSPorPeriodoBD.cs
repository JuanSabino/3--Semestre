using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


namespace Gold.Persistencia
{
    /// <summary>
    /// Summary description for OSPorPeriodoBD
    /// </summary>
    public class OSPorPeriodoBD
    {

        public DataSet SelectAll(DateTime DataInicial, DateTime DataFinal, int Classifica)
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            string Sql = "select  " +
                            "os.os_id as OrderServico " +
                            ", os.OS_LOJA as Loja " +
                            ", alianca.ali_id as Alianca " +
                            ", modelo.MOD_Nome as Modelo " +
                            ", alianca.ALI_TAMANHO as Tamanho " +
                            ", modelo.MOD_PESO as Peso " +
                            ", alianca.ALI_DETALHES as Detalhes " +
                            ", os.OS_DATAENTRADA AS DataAbertura " +
                            ", os.OS_DATASAIDA AS DataEncerramento " +
                            ", TIMESTAMPDIFF(DAY,os.OS_DATAENTRADA, ifnull( os.OS_DATASAIDA, now()) ) AS DiasAbertos " +
                        "from " +
                            "tbl_os as os " +
                        "inner join " +
                            "tbl_alianca as alianca " +
                        "on " +
                            "os.os_id = alianca.os_id " +
                        "inner join " +
                            "tbl_modelo as modelo " +
                        "on " +
                            "alianca.mod_id = modelo.mod_id " +
                        "where " +
                            " os.os_ativado = 1 " +
                            "and modelo.mod_ativado = 1 " +
                            "and cast(os.OS_DATAENTRADA as Date)  between ?DataInicial and ?DataFinal ";
            if (Classifica == 0) //Maior tempo
            {
                Sql += " order by ( os.OS_DATASAIDA - os.OS_DATAENTRADA )";
            }
            else //data de abertura
            {
                Sql += " order by os.OS_DATAENTRADA ";
            }



            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(Sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?DataInicial", DataInicial.Date));
            objCommand.Parameters.Add(Mapped.Parameter("?DataFinal", DataFinal.Date));
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);

            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();

            return ds;
        }

        public OSPorPeriodoBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}