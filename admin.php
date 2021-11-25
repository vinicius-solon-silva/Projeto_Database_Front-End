<?php
class Admin{
    private $bd;
    
    public function __construct($nome_bd, $hostname, $user, $password){
        try{
        $this->bd = new PDO("mysql:dbname=".$nome_bd.";host=".$hostname, $user, $password);
        echo "<h2>Bem-vindo ao Banco de Dados do Ecommerce de Esportes, ".$user."!</h2>
                <h3>Página do admin</h3><br>";
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
        
        $cmd = $this->bd->prepare("SELECT * FROM produto;");
        $cmd->execute();
        $res = $cmd->fetchAll(PDO::FETCH_ASSOC);
        
        return $res;
        
    }

    public function cadastrarProduto($cod_prod, $nome, $descricao, $cor, $tamanho, $cod_categ, $preco, $cod_gar){

        //ANTES DE CADASTRAR VERIFICAR SE JÁ EXISTE COD_PROD
        $cmd = $this->bd->prepare("SELECT cod_prod from produto Where cod_prod = :cod");
        $cmd->bindValue(":cod", $cod_prod);
        $cmd->execute();
        
        if($cmd->rowCount() > 0) //COD_PROD JÁ EXISTE
        {
            return false;
        }
        else
        {
            $cmd = $this->bd->prepare("INSERT INTO produto(cod_prod, nome, descricao, cor, tamanho, cod_categ, preco, cod_gar) VALUES(:cod, :n, :d, :c, :t, :cat, :p, :gar)");
            $cmd->bindValue(":cod", $cod_prod);
            $cmd->bindValue(":n",$nome);
            $cmd->bindValue(":d", $descricao);
            $cmd->bindValue(":c", $cor);
            $cmd->bindValue(":t", $tamanho);
            $cmd->bindValue(":cat", $cod_categ);
            $cmd->bindValue(":preco", $preco);
            $cmd->bindValue(":gar", $cod_gar);
            $cmd->execute();
            return true;
        }
    }
    
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

</body>
</html>