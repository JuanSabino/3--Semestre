using Gold.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Gold.Persistencia
{
    /// <summary>
    /// Summary description for AliancaBD
    /// </summary>
    public class AliancaBD
    {
        /// <summary>
        /// Metodo para inserir um novo funcionario no banco
        /// </summary>
        /// <param name="alianca">Objeto Funcionario que deseja inserir</param>
        /// <returns>retorna true caso inclua com sucesso. Em caso de falha retorna false.</returns>
        public bool Insert(Alianca alianca)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "INSERT INTO TBL_ALIANCA (ALI_ID, ALI_PRODUTO, MOD_ID, TAM_ID, OS_ID, ALI_ATIVADO) VALUES (?id, ?produto, ?modelo, ?tamanho, ?os, ?ativado)";

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);

            objCommand.Parameters.Add(Mapped.Parameter("?id", alianca.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?produto", alianca.Produto));
            objCommand.Parameters.Add(Mapped.Parameter("?modelo", alianca.modelo.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?tamanho", alianca.Tamanho));
            objCommand.Parameters.Add(Mapped.Parameter("?os", alianca.OS));
            objCommand.Parameters.Add(Mapped.Parameter("?ativado", alianca.Ativado));

            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();

            return true;
        }

        public Alianca Select(int id)
        {
            Alianca alianca = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM TBL_ALIANCA AS ALI INNER JOIN TBL_MODELO AS MODELO ON ALI.MOD_ID=MODELO.MOD_ID WHERE ALI_ID = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));

            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                alianca = new Alianca();
                alianca.ID = Convert.ToInt32(objDataReader["ALI_ID"]);
                alianca.modelo.ID = Convert.ToInt32(objDataReader["MOD_ID"]);
                alianca.modelo.Nome = Convert.ToString(objDataReader["MOD_NOME"]);
                alianca.modelo.Peso = Convert.ToDouble(objDataReader["MOD_PESO"]);
                alianca.modelo.Ferramenta = Convert.ToString(objDataReader["MOD_FERRAMENTA"]);
                alianca.modelo.Descricao = Convert.ToString(objDataReader["MOD_DESCRICAO"]);
                alianca.modelo.Largura = Convert.ToDouble(objDataReader["MOD_LARGURA"]);
                alianca.modelo.Altura = Convert.ToDouble(objDataReader["MOD_ALTURA"]);
                alianca.modelo.Ativado = Convert.ToBoolean(objDataReader["CAR_ATIVADO"]);
            }

            objDataReader.Close();
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();

            return alianca;
        }

        public DataSet SelectAll(int OS = 0)
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            objConexao = Mapped.Connection();
            if (OS == 0)
            {
                objCommand = Mapped.Command("SELECT * FROM TBL_ALIANCA AS ALI INNER JOIN TBL_MODELO AS MODELO ON ALI.ALI_ID=MODELO.MOD_ID WHERE OS_ID = ?os AND ALI_ATIVADO = 1 AND MOD_ATIVADO = 1", objConexao);
                objCommand.Parameters.Add(Mapped.Parameter("?os", OS));
            }
            else
            {
                objCommand = Mapped.Command("SELECT * FROM TBL_ALIANCA AS ALI INNER JOIN TBL_MODELO AS MOD ON ALI.MOD_ID=MOD.MOD_ID", objConexao);
            }

            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);

            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();

            return ds;
        }

        public AliancaBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}