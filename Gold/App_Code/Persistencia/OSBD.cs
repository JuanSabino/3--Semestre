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

        public bool Update(OS os)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "UPDATE TBL_OS SET OS_DATAENTRADA = ?entrada, OS_DATASAIDA = ?saida, OS_LOJA = ?loja, OS_OBS = ?obs, OS_ATIVADO = ?ativado  WHERE OS_ID = ?codigo";
            //abre uma conexao com banco de dados
            objConexao = Mapped.Connection();
            //estruturar o comando a ser executado
            objCommand = Mapped.Command(sql, objConexao);
            //parametros
            objCommand.Parameters.Add(Mapped.Parameter("?entrada", os.HoraEntrada));
            objCommand.Parameters.Add(Mapped.Parameter("?saida", os.HoraSaida));
            objCommand.Parameters.Add(Mapped.Parameter("?loja", os.Loja));
            objCommand.Parameters.Add(Mapped.Parameter("?obs", os.Observacao));
            objCommand.Parameters.Add(Mapped.Parameter("?ativado", os.Ativado));
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", os.ID));
            // executa o comando no banco de dados
            objCommand.ExecuteNonQuery();
            //fecha a conexao
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();

            return true;
        }

        public OS Select(int id)
        {
            OS os = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM TBL_OS WHERE OS_ID = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));

            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                os = new OS();
                os.ID = Convert.ToInt32(objDataReader["OS_ID"]);
                os.HoraEntrada = Convert.ToDateTime(objDataReader["OS_DATAENTRADA"]);
                os.HoraSaida = (objDataReader["OS_DATASAIDA"] is DBNull) ? Convert.ToDateTime(null) : Convert.ToDateTime(objDataReader["OS_DATASAIDA"]);
                os.Loja = Convert.ToString(objDataReader["OS_LOJA"]);
                os.Observacao = Convert.ToString(objDataReader["OS_OBS"]);
            }

            objDataReader.Close();
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();

            return os;
        }

        public DataSet SelectAll()
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM TBL_OS", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);

            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();

            return ds;
        }



        public OSBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}