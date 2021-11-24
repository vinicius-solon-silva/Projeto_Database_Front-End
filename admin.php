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
        catch(PDOException $e){
            echo "Erro genérico: ".$e->getMessage();
            exit();
        }
    }

    public function buscarDados(){
        $cmd = $this->db->prepare("SELECT * FROM produto ORDER BY Cod_prod");
        $res = array();
        $res = $cmd->fetchAll(PDO::FETCH_ASSOC);
        return $res;
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