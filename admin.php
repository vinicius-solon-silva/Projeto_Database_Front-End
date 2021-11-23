<?php

require('./login/processaLogin.php');

if($user=='admin'){

$res = $bd->prepare("INSERT INTO categoria() VALUES (:cod_cat, :nome, :descricao)");

$res->bindValue(":cod_cat", "5");
$res->bindValue(":nome","Pingentes");
$res->bindValue(":descricao", "Decoração para acessórios");
$res->execute();

echo "Inserido!";
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