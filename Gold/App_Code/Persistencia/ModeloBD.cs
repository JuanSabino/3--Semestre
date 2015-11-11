using Gold.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Gold.Persistencia
{
    /// <summary>
    /// Summary description for Modelo
    /// </summary>
    public class ModeloBD
    {
        public Modelo Select(int id)
        {
            Modelo modelo = null;

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM TBL_MODELO WHERE MOD_ID = ?codigo", objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", id));

            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                modelo = new Modelo();
                modelo.ID = Convert.ToInt32(objDataReader["MOD_ID"]);
                modelo.Nome = Convert.ToString(objDataReader["MOD_NOME"]);
                modelo.Peso = Convert.ToDouble(objDataReader["MOD_PESO"]);
                modelo.Descricao = Convert.ToString(objDataReader["MOD_DESCRICAO"]);
                modelo.Largura = Convert.ToDouble(objDataReader["MOD_LARGURA"]);
                modelo.Altura = Convert.ToDouble(objDataReader["MOD_ALTURA"]);
                modelo.Ativado = Convert.ToBoolean(objDataReader["CAR_ATIVADO"]);
            }

            objDataReader.Close();
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();

            return modelo;
        }

        /// <summary>
        /// Metodo que busca no banco todos modelos de alianca que estao ativos 
        /// </summary>
        /// <returns>Dataset com todos os modelos de alianca</returns>
        public DataSet SelectAll(bool SoAtivos = false)
        {
            DataSet ds = new DataSet();

            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataAdapter objDataAdapter;

            objConexao = Mapped.Connection();
            if (SoAtivos)
            {
                objCommand = Mapped.Command("SELECT * FROM TBL_MODELO WHERE MOD_ATIVADO = 1", objConexao);
            }
            else
            {
                objCommand = Mapped.Command("SELECT * FROM TBL_MODELO", objConexao);
            }
            
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);

            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();

            return ds;
        }

        public ModeloBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}