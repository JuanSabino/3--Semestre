using Gold.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


namespace Gold.Persistencia
{

    /// <summary>
    /// Summary description for AliancaContaBD
    /// </summary>
    public class AliancaContaBD
    {
        /// <summary>
        /// Metodo para inserir um novo funcionario no banco
        /// </summary>
        /// <param name="aliancaConta">Objeto Funcionario que deseja inserir</param>
        /// <returns>retorna true caso inclua com sucesso. Em caso de falha retorna false.</returns>
        public bool Insert(AliancaConta aliancaConta)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO TBL_ALIANCA_CONTA (ALC_ID, ALC_ENTRADA, ALC_OBSENTRADA,  ALC_ATIVADO, FUN_ID, MAQ_ID, CON_ID, ALI_ID) VALUES (?id, ?entrada, ?obsentrada, ?ativado, ?funcionario, ?maquina, ?conta, ?alianca)";

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);


            objCommand.Parameters.Add(Mapped.Parameter("?id", aliancaConta.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?entrada", aliancaConta.Entrada));
            objCommand.Parameters.Add(Mapped.Parameter("?obsentrada", aliancaConta.ObsEntrada));
            //objCommand.Parameters.Add(Mapped.Parameter("?inicio", aliancaConta.Inicio));
            //objCommand.Parameters.Add(Mapped.Parameter("?termino", aliancaConta.Termino));
            objCommand.Parameters.Add(Mapped.Parameter("?ativado", aliancaConta.Ativado));
            objCommand.Parameters.Add(Mapped.Parameter("?funcionario", aliancaConta.funcionario.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?maquina", aliancaConta.maquina.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?conta", aliancaConta.conta.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?alianca", aliancaConta.alianca.ID));

            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();

            return true;
        }

        public AliancaConta Select(int id)
        {
            AliancaConta aliancaConta = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            string sql = "SELECT* FROM tbl_alianca_conta AS ALI_CON";
            sql += " INNER JOIN tbl_funcionario AS FUN ON ALI_CON.FUN_ID=FUN.FUN_ID ";
            sql += " LEFT JOIN tbl_alianca AS ALI ON ALI_CON.ALI_ID = ALI.ALI_ID ";
            sql += " INNER JOIN tbl_conta AS CON ON ALI_CON.CON_ID = CON.CON_ID ";
            sql += " INNER JOIN tbl_maquina AS MAQ ON ALI_CON.MAQ_ID = MAQ.MAQ_ID ";
            sql += " WHERE ALC_ID = ?codigo  AND CON_ATIVADO = 1 AND MAQ_ATIVADO = 1";

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));

            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                aliancaConta = new AliancaConta();
                aliancaConta.ID = Convert.ToInt32(objDataReader["ALC_ID"]);
                aliancaConta.Entrada = Convert.ToInt32(objDataReader["ALC_ENTRADA"]);
                aliancaConta.ObsEntrada = Convert.ToString(objDataReader["ALC_OBSENTRADA"]);
                aliancaConta.Saida = Convert.ToInt32(objDataReader["ALC_SAIDA"]);
                aliancaConta.ObsSaida = Convert.ToString(objDataReader["ALC_OBSSAIDA"]);
                aliancaConta.Inicio = Convert.ToDateTime(objDataReader["ALC_INICIO"]);
                aliancaConta.Termino = (objDataReader["ALC_TERMINO"] is DBNull) ? Convert.ToDateTime(null) : Convert.ToDateTime(objDataReader["ALC_TERMINO"]);
                aliancaConta.Ativado = Convert.ToBoolean(objDataReader["ALC_ATIVADO"]);
                aliancaConta.funcionario.ID = Convert.ToInt32(objDataReader["FUN_ID"]);
                aliancaConta.funcionario.Nome = Convert.ToString(objDataReader["FUN_NOME"]);
                aliancaConta.maquina.ID = Convert.ToInt32(objDataReader["MAQ_ID"]);
                aliancaConta.maquina.Nome = Convert.ToString(objDataReader["MAQ_NOME"]);
                aliancaConta.alianca.ID = Convert.ToInt32(objDataReader["ALI_ID"]);
                aliancaConta.conta.ID = Convert.ToInt32(objDataReader["CON_ID"]);
                aliancaConta.conta.Nome = Convert.ToString(objDataReader["CON_NOME"]);

            }

            objDataReader.Close();
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();

            return aliancaConta;
        }

        public DataSet SelectAll(bool ativado = false)
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            string sql = "SELECT* FROM tbl_alianca_conta AS ALI_CON";
            sql += " INNER JOIN tbl_funcionario AS FUN ON ALI_CON.FUN_ID=FUN.FUN_ID ";
            sql += " LEFT JOIN tbl_alianca AS ALI ON ALI_CON.ALI_ID = ALI.ALI_ID ";
            sql += " INNER JOIN tbl_conta AS CON ON ALI_CON.CON_ID = CON.CON_ID ";
            sql += " INNER JOIN tbl_maquina AS MAQ ON ALI_CON.MAQ_ID = MAQ.MAQ_ID ";


            objConexao = Mapped.Connection();
            if (ativado)
            {
                objCommand = Mapped.Command(sql + " WHERE ALC_ATIVADO = 1", objConexao);
            }
            else
            {
                objCommand = Mapped.Command(sql, objConexao);
            }

            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);

            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();

            return ds;
        }

        public bool Update(AliancaConta aliancaConta)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "UPDATE TBL_ALIANCA_CONTA SET ALC_ENTRADA = ?Entrada, ALC_OBSENTRADA = ?ObsEntrada, ALC_SAIDA = ?Saida, ALC_OBSSAIDA = ?ObsSaida, ALC_INICIO = ?Inicio, ALC_TERMINO = ?Termino, ALC_ATIVADO = ?Ativado, FUN_ID = ?funcionario, MAQ_ID = ?maquina, CON_ID = ?conta, ALI_ID = ?alianca  WHERE ALC_ID = ?codigo";
            //abre uma conexao com banco de dados
            objConexao = Mapped.Connection();
            //estruturar o comando a ser executado
            objCommand = Mapped.Command(sql, objConexao);
            //parametros

            objCommand.Parameters.Add(Mapped.Parameter("?Entrada", aliancaConta.Entrada));
            objCommand.Parameters.Add(Mapped.Parameter("?ObsEntrada", aliancaConta.ObsEntrada));
            objCommand.Parameters.Add(Mapped.Parameter("?Saida", aliancaConta.Saida));
            objCommand.Parameters.Add(Mapped.Parameter("?ObsSaida", aliancaConta.ObsSaida));
            objCommand.Parameters.Add(Mapped.Parameter("?Inicio", aliancaConta.Inicio));
            objCommand.Parameters.Add(Mapped.Parameter("?Termino", aliancaConta.Termino));
            objCommand.Parameters.Add(Mapped.Parameter("?Ativado", aliancaConta.Ativado));
            objCommand.Parameters.Add(Mapped.Parameter("?funcionario", aliancaConta.funcionario.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?maquina", aliancaConta.maquina.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?conta", aliancaConta.conta.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?alianca", aliancaConta.alianca.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", aliancaConta.ID));

            // executa o comando no banco de dados
            objCommand.ExecuteNonQuery();
            //fecha a conexao
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();

            return true;
        }

        public AliancaContaBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}