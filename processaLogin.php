<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce de Esportes</title>
</head>
<body>

    <?php

    $hostname = "localhost";
    $nome_bd = "00_ecommerce_esportes";

    $user = $_POST['login'];
    $password = $_POST['senha'];

    if($user == "admin"){
        try{
            $bd = new PDO("mysql:dbname=".$nome_bd.";host=".$hostname, $user, $password);
            echo "Bem-vindo ao Banco de Dados do Ecommerce de Esportes, <strong>".$user."</strong>!<br>";
            echo "Página do admin<br>";
            
            //SELECT
            $cmd = $bd->prepare("SELECT * FROM produto");
            $cmd ->execute();
            $resultado = $cmd->fetchAll(PDO::FETCH_ASSOC); //transforma em um array, e retorna somente as colunas
            // echo "<pre>";
            // print_r($resultado);
            // echo "</pre>";
            foreach ($resultado as $key => $value) {
                echo $key.": ".$value."<br>";
            }

            //INSERT
            // $cmd = $bd->prepare("INSERT INTO garantia(Cod_gar, Descricao, Duracao, Valor) VALUES(:c, :de, :du, :v)");
            // $cmd->bindValue(":c", 3);
            // $cmd->bindValue(":de", "Futebol Americano e relacionados");
            // $cmd->bindValue(":du", "2 anos");
            // $cmd->bindValue(":v", 599.99);
            // $cmd->execute();

        }
        catch(PDOException $e){
            echo "<br><br>Falha ao conectar: " . $e->getMessage();
        }
        catch(Exception $e){
            echo "<br><br>Erro genérico: " . $e->getMessage();
        }
    }
    
    else if($user == "cliente"){
        try{
            $bd = new PDO("mysql:dbname=".$nome_bd.";host=".$hostname, $user, $password);
            echo "Bem-vindo ao Banco de Dados do Ecommerce de Esportes, <strong>".$user."</strong>!<br>";
            echo "Página do cliente";
        }
        catch(PDOException $e){
            echo "Falha ao conectar: " . $e->getMessage();
        }
        catch(Exception $e){
            echo "Erro genérico: " . $e->getMessage();
        }
    }
    
    else if($user == "transportadora"){
        try{
            $bd = new PDO("mysql:dbname=".$nome_bd.";host=".$hostname, $user, $password);
            echo "Bem-vindo ao Banco de Dados do Ecommerce de Esportes, <strong>".$user."</strong>!<br>";
            echo "Página da transportadora<br>";

            $cmd = $bd->prepare("SELECT cli.Nome, cli.CEP, cli.No_casa, cli.Complemento, cli.Email, p.Nome AS Produto, c.Data_compra 
                                FROM compra c 
                                JOIN carrinho car 
                                ON car.Cod_compra = c.Cod_compra 
                                JOIN cliente cli 
                                ON cli.CPF = c.CPF_cliente
                                JOIN produto p  
                                ON p.Cod_prod = car.Cod_prod 
                                WHERE cli.CPF = 321234876 ");
            $cmd ->execute();
            $resultado = $cmd->fetch();
            print_r($resultado);

        }
        catch(PDOException $e){
            echo "Falha ao conectar: " . $e->getMessage();
        }
        catch(Exception $e){
            echo "Erro genérico: " . $e->getMessage();
        }
    }

    else{ 
        echo "Usuário/Senha incorretos.";
    }
    
    ?>
    
    <br><br><a href='login.php'>Voltar para página de login</a>  

</body>
</html>
