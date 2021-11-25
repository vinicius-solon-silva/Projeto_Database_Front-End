<?php

class Cliente{
    private $bd;
    
    public function __construct($nome_bd, $hostname, $user, $password){
        try{
        $this->bd = new PDO("mysql:dbname=".$nome_bd.";host=".$hostname, $user, $password);
        echo "<h2>Bem-vindo ao Banco de Dados do Ecommerce de Esportes, ".$user."!</h2>
                <h3>Página do cliente</h3><br>";
        }
        catch(PDOException $e){
            echo "Erro do banco de dados: ".$e->getMessage();
            exit();
        }
        catch(Exception $e){
            echo "Erro genérico: ".$e->getMessage();
            exit();
        }
    }

    //BUSCA DADOS E COLOCA NA TABELA ABAIXO DO FORMULARIO
    public function buscarDados(){
        
        $cmd = $this->bd->prepare("SELECT cli.Nome, p.Nome AS Produto, p.Preco, c.Data_compra, r.Estado_do_rastreio 
                                   FROM compra c 
                                   JOIN rastreio_compra r 
                                   ON c.Cod_rast = r.Cod_rast 
                                   JOIN carrinho car 
                                   ON car.Cod_compra = c.Cod_compra 
                                   JOIN cliente cli 
                                   ON cli.CPF = c.CPF_cliente 
                                   JOIN produto p  
                                   ON p.Cod_prod = car.Cod_prod;");
        $cmd->execute();
        $res = $cmd->fetchAll(PDO::FETCH_ASSOC);
        
        return $res;
        
    }
}
