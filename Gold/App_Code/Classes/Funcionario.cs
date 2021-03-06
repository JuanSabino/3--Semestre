﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gold.Classes
{

    /// <summary>
    /// Summary description for Funcionario
    /// </summary>
    public class Funcionario
    {
        public int ID { get; set; }
        public string Nome { get; set; }
        public int CPF { get; set; }
        public string Senha { get; set; }
        public Boolean Ativado { get; set; }
        //relacionamento
        public Cargo Cargo { get; set; }


        public Funcionario()
        {
            //ininia o atributo cargo
            Ativado = true;
            Cargo = new Cargo();
        }
    }

}