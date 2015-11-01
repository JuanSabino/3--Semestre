using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Gold.Classes;

/// <summary>
/// Summary description for ContaBD
/// </summary>
/// 

namespace Gold.Persistencia
{

    public class ContaBD
    {

        /// <summary>
        /// Metodo para inserir um novo funcionario no banco
        /// </summary>
        /// <param name="conta">Objeto Funcionario que deseja inserir</param>
        /// <returns>retorna true caso inclua com sucesso. Em caso de falha retorna false.</returns>
        /// 
        public bool Insert(Conta conta)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO tbl_conta (CON_ID, CON_NOME) VALUES (?id, ?nome)";

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);

            objCommand.Parameters.Add(Mapped.Parameter("?id", conta.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?nome", conta.Nome));

            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();

            return true;
        }

        public Conta Select(int id)
        {
            Conta conta = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM tbl_conta WHERE CON_ID = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));

            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                conta = new Conta();
                conta.ID = Convert.ToInt32(objDataReader["CON_ID"]);
                conta.Nome = Convert.ToString(objDataReader["CON_NOME"]);
            }

            objDataReader.Close();
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();

            return conta;
        }

        public DataSet SelectAll()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM tbl_conta", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);

            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();

            return ds;
        }

        public ContaBD()
        {

        }


    }

}
