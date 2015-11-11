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
    public class PerdasBD
    {

        public DataSet SelectAll(DateTime DataInicial, DateTime DataFinal, int Classifica)
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            string Sql = " SELECT " +
                            "(aliancaconta.ALC_ENTRADA - aliancaconta.ALC_SAIDA) AS Perda," +
                            "conta.CON_NOME AS Conta," +
                            "funcionario.FUN_NOME AS Funcionario," +
                            "maquina.MAQ_NOME AS Maquina," +
                            "alianca.OS_ID as OS" +
                        " FROM " +
                            "tbl_alianca_conta AS aliancaconta" +
                        "INNER JOIN" +
                            "tbl_conta AS conta" +
                        "ON" +
                            "aliancaconta.CON_ID = conta.CON_ID" +
                        "INNER JOIN" +
                            "tbl_funcionario AS funcionario" +
                        "ON" +
                            "aliancaconta.FUN_ID = funcionario.FUN_ID" +
                        "INNER JOIN" +
                            "tbl_maquina AS maquina" +
                        "ON" +
                            "aliancaconta.MAQ_ID = maquina.MAQ_ID" +
                        "LEFT JOIN" +
                            "(SELECT * FROM tbl_alianca WHERE ALI_ATIVADO = 1) AS alianca" +
                        "ON" +
                            "aliancaconta.ALI_ID = alianca.ALI_ID" +
                        "WHERE" +
                            "ALC_ATIVADO = 1" +
                            "AND CON_ATIVADO = 1" +
                            "AND FUN_ATIVADO = 1" +
                            "AND MAQ_ATIVADO = 1";

            if (Classifica == 0) //Conta
            {
                Sql += " order by conta.CON_ID";
            }
            else if (Classifica == 1) //Funcionario
            {
                Sql += " order by funcionario.FUN_NOME ";
            }
            else //OS
            {
                Sql += " order by os.OS_ID ";
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

        public PerdasBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}
