<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php

    $hostname = "localhost";
    $nome_bd = "00_ecommerce_esportes";

    $user = $_POST['login'];
    $password = $_POST['senha'];

    try{
        $bd = new PDO("mysql:dbname=".$nome_bd.";host=".$hostname, $user, $password);
        echo "Bem-vindo ao Banco de Dados do Ecommerce de Esportes, <strong>".$user."</strong>!";
    }
    catch(PDOException $e){
        echo "Falha ao conectar: " . $e->getMessage();
    }
    catch(Exception $e){
        echo "Erro genérico: " . $e->getMessage();
    }
    

    ?>    
</body>
</html>
