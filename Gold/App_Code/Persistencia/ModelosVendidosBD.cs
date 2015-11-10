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
    public class ModelosVendidosBD
    {

        public DataSet SelectAll(DateTime DataInicial, DateTime DataFinal)
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            string Sql = "select MOD_NOME  as Modelo " +
                                ", (select " +
                                        "count(alianca.mod_id) " +
                                    "from " +
                                        "tbl_alianca as alianca " +
                                    "inner join " +
                                        "tbl_os as os " +
                                    "on " +
                                        "os.os_id = alianca.os_id " +
                                    "where alianca.mod_id = modelo.mod_id " +
                                        "and alianca.ALI_ATIVADO = 1 " +
                                        "and os.OS_ATIVADO = 1 " +
                                        "and cast(os.OS_DATAENTRADA as Date)  between ?DataInicial and ?DataFinal ) as Quantidade " +
                          "from tbl_modelo as modelo " + 
                          "where MOD_ATIVADO = 1";


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

        public ModelosVendidosBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}