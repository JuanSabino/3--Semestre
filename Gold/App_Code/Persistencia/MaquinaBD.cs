using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Gold.Persistencia
{

    /// <summary>
    /// Summary description for MaquinaBD
    /// </summary>
    public class MaquinaBD
    {
        /// <summary>
        /// Metodo que busca no banco todos as maquinas que estao ativas
        /// </summary>
        /// <returns>Dataset com todas as maquinas</returns>
        public DataSet SelectAll()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM TBL_MAQUINA", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);

            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();

            return ds;
        }

        public MaquinaBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}