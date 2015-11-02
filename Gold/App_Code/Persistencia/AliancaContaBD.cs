using Gold.Classes;
using System;
using System.Collections.Generic;
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
            string sql = "INSERT INTO TBL_ALIANCACONTA (ALC_ID, ALC_ENTRADA, ALC_OBSENTRADA, ALC_SAIDA, ALC_OBSSAIDA, ALC_INICIO, ALC_TERMINO, ALC_ATIVADO, FUN_ID, MAQ_ID, CON_ID, ALI_ID) VALUES (?id, ?entrada, ?obsentrada, ?saida, ?obssaida, ?inicio, ?termino, ?ativado, ?funcionario, ?maquina, ?conta, ?alianca)";

            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);

            objCommand.Parameters.Add(Mapped.Parameter("?id", aliancaConta.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?entrada", aliancaConta.Entrada));
            objCommand.Parameters.Add(Mapped.Parameter("?obsentrada", aliancaConta.ObsEntrada));
            objCommand.Parameters.Add(Mapped.Parameter("?saida", aliancaConta.Saida));
            objCommand.Parameters.Add(Mapped.Parameter("?obssaida", aliancaConta.ObsSaida));
            objCommand.Parameters.Add(Mapped.Parameter("?inicio", aliancaConta.Inicio));
            objCommand.Parameters.Add(Mapped.Parameter("?termino", aliancaConta.Termino));
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

        public AliancaContaBD()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

}