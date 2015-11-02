using Gold.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Gold.Persistencia
{

    /// <summary>
    /// Summary description for FuncionarioBD
    /// </summary>
    public class FuncionarioBD
    {

        /// <summary>
        /// Metodo para inserir um novo funcionario no banco
        /// </summary>
        /// <param name="funcionario">Objeto Funcionario que deseja inserir</param>
        /// <returns>retorna true caso inclua com sucesso. Em caso de falha retorna false.</returns>
        public bool Insert(Funcionario funcionario)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO TBL_FUNCIONARIO (FUN_ID, FUN_NOME, FUN_CPF, FUN_SENHA, FUN_ATIVADO, CAR_ID) VALUES (?id, ?nome, ?cpf, ?senha, ?ativado, ?cargo)";

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);

            objCommand.Parameters.Add(Mapped.Parameter("?id", funcionario.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?nome", funcionario.Nome));
            objCommand.Parameters.Add(Mapped.Parameter("?cpf", funcionario.CPF));
            objCommand.Parameters.Add(Mapped.Parameter("?senha", funcionario.Senha));
            objCommand.Parameters.Add(Mapped.Parameter("?ativado", funcionario.Ativado));
            //insere a ID do cargo
            objCommand.Parameters.Add(Mapped.Parameter("?cargo", funcionario.Cargo.ID));

            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();

            return true;
        }


        /// <summary>
        /// Metodo que busca no banco o funcionario desejado
        /// </summary>
        /// <param name="id">id do funcionario</param>
        /// <returns>objeto Funcionario ou null caso nao encontre o id informado</returns>
        public Funcionario Select(int id)
        {
            Funcionario funcionario = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM TBL_FUNCIONARIO AS FUN INNER JOIN TBL_CARGO AS CAR ON FUN.CAR_ID=CAR.CAR_ID WHERE FUN_ID = ?codigo ", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));

            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                funcionario = new Funcionario();
                funcionario.ID = Convert.ToInt32(objDataReader["FUN_ID"]);
                funcionario.Nome = Convert.ToString(objDataReader["FUN_NOME"]);
                funcionario.CPF = Convert.ToInt32(objDataReader["FUN_CPF"]);
                funcionario.Ativado = Convert.ToBoolean(objDataReader["FUN_ATIVADO"]);
                //puxa os dados do relacionamento
                funcionario.Cargo.ID = Convert.ToInt32(objDataReader["CAR_ID"]);
                funcionario.Cargo.Nome = Convert.ToString(objDataReader["CAR_NOME"]);
            }

            objDataReader.Close();
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();

            return funcionario;
        }

        /// <summary>
        /// Metodo que busca no banco todos os funcionarios que estao ativos
        /// </summary>
        /// <returns>Dataset com todos os funcionarios</returns>
        public DataSet SelectAll(bool ativos = false)
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            objConexao = Mapped.Connection();
            if (ativos)
            {
                objCommand = Mapped.Command("SELECT * FROM TBL_FUNCIONARIO AS FUN INNER JOIN TBL_CARGO AS CAR ON FUN.CAR_ID=CAR.CAR_ID WHERE FUN_ATIVADO = 1", objConexao);
            }
            else
            {
                objCommand = Mapped.Command("SELECT * FROM TBL_FUNCIONARIO AS FUN INNER JOIN TBL_CARGO AS CAR ON FUN.CAR_ID=CAR.CAR_ID", objConexao);
            }
            
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);

            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();

            return ds;
        }



        /// <summary>
        /// Metodo para realizar o login no sistema
        /// </summary>
        /// <param name="CPF">CPF do funcionario</param>
        /// <param name="Senha">Senha do funcionario</param>
        /// <returns>Id do funcionario logado ou
        ///          0 caso nao seja encontrado o funcionario ou
        ///          menor que 0 caso de algum erro </returns>
        public int Logar(string CPF, string Senha)
        {
            int codigo = 0;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM TBL_FUNCIONARIO WHERE FUN_CPF = ?cpf AND FUN_SENHA= ?senha and FUN_ATIVADO=1", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?cpf", CPF));
            objCommand.Parameters.Add(Mapped.Parameter("?senha", Senha));

            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                codigo = Convert.ToInt32(objDataReader["FUN_ID"]);
            }

            objDataReader.Close();
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();

            return codigo;
        }


        public FuncionarioBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}