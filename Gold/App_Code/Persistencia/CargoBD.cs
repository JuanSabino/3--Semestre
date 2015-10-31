using Gold.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Gold.Persistencia
{

    /// <summary>
    /// Summary description for CargoBD
    /// </summary>
    public class CargoBD
    {

        public Cargo Select(int id)
        {
            Cargo cargo = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM TBL_CARGO WHERE CAR_ID = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));

            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                cargo = new Cargo();
                cargo.ID = Convert.ToInt32(objDataReader["CAR_ID"]);
                cargo.Nome = Convert.ToString(objDataReader["CAR_NOME"]);
                cargo.Ativado = Convert.ToBoolean(objDataReader["CAR_ATIVADO"]);
            }

            objDataReader.Close();
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();

            return cargo;
        }

        public DataSet SelectAll()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM TBL_CARGO", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);

            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();

            return ds;
        }

        public CargoBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}