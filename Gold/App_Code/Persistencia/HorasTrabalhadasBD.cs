using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


namespace Gold.Persistencia
{
    /// <summary>
    /// Summary description for HorasTrabalhadasBD
    /// </summary>
    public class HorasTrabalhadasBD
    {

        public DataSet SelectAll(DateTime DataInicial, DateTime DataFinal, int Classifica)
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            string Sql = " SELECT " +
                            "conta.CON_NOME AS Conta, " +
                            "TIMESTAMPDIFF(MINUTE, aliancaconta.ALC_INICIO, ifnull(aliancaconta.ALC_TERMINO, now())) AS HorasTrabalhadas, " +
                            "funcionario.FUN_NOME AS Funcionario, " +
                            "os.OS_ID AS OS " +
                        " FROM " +
                            "tbl_alianca_conta AS aliancaconta " +
                        "INNER JOIN " +
                            "tbl_conta AS conta " +
                        "ON " +
                            "aliancaconta.CON_ID = conta.CON_ID " +
                        "INNER JOIN " +
                            "tbl_funcionario AS funcionario " +
                        "ON " +
                            "aliancaconta.FUN_ID = funcionario.FUN_ID " +
                        "LEFT JOIN " +
                            "tbl_alianca AS alianca " +
                        "ON " +
                            "aliancaconta.ALI_ID = alianca.ALI_ID " +
                        "LEFT JOIN " +
                            "tbl_os AS os " +
                        "ON " +
                            "alianca.OS_ID = os.OS_ID " +
                        "WHERE " +
                            "ALC_ATIVADO = 1 " +
                            "AND CON_ATIVADO = 1 " +
                            " " +
                            "and cast(aliancaconta.ALC_INICIO as Date)  between ?DataInicial and ?DataFinal  ";

            if (Classifica == 0) //Conta
            {
                Sql += " order by conta.CON_ID";
            }
            else //Funcionario
            {
                Sql += " order by funcionario.FUN_ID";
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

        public HorasTrabalhadasBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}
