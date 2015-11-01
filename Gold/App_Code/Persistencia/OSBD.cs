using Gold.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Gold.Persistencia
{

    /// <summary>
    /// Summary description for OSBD
    /// </summary>
    public class OSBD
    {
        /// <summary>
        /// Metodo para inserir um novo funcionario no banco
        /// </summary>
        /// <param name="os">Objeto Funcionario que deseja inserir</param>
        /// <returns>retorna true caso inclua com sucesso. Em caso de falha retorna false.</returns>
        public bool Insert(OS os)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO TBL_OS (OS_LOJA, OS_OBS, OS_ATIVADO) VALUES (?loja, ?obs, ?ativado)";

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);


            objCommand.Parameters.Add(Mapped.Parameter("?loja", os.Loja));
            objCommand.Parameters.Add(Mapped.Parameter("?obs", os.Observacao));
            objCommand.Parameters.Add(Mapped.Parameter("?ativado", os.Ativado));

            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();

            return true;
        }

        /// <summary>
        /// Metodo que busca a ID da ultima ordem de servico cadastrada no banco
        /// </summary>
        /// <returns>id da ordem de servico</returns>
        public int SelectLast()
        {
            int codigo = 0;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM TBL_OS ORDER BY OS_ID DESC LIMIT 1", objConexao);
            

            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                codigo = Convert.ToInt32(objDataReader["OS_ID"]);
            }

            objDataReader.Close();
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();

            return codigo;
        }

        public OSBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}