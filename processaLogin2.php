<?php

require_once 'cliente.php';

$hostname = "localhost";
$nome_bd = "00_ecommerce_esportes";
$user = $_POST['login'];
$password = $_POST['senha'];

$a = new Cliente($nome_bd, $hostname, $user, $password);

?>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Ecommerce de Esportes</title>
</head>
<body>

    <h2>Bem-vindo ao Banco de Dados do Ecommerce de Esportes!</h2>
    <h3>Página do cliente</h3>

    <section id='direita'>
    <table>

        <?php
            $dados = $a->buscarDados();

            if (count($dados) > 0) //se tem produtos cadastrados no banco
            {
                echo "<pre>";
                print_r($dados);
                echo "</pre>";
            }
            else 
                echo "<br><br>Banco está vazio!"
        ?>

    </table>
    </section>

    <br><br><br><br>
    <a href='index.html'>Voltar para página principal</a>
    <br><br>
    <a href='login2.php'>Voltar para página de login</a>  

</body>
</html>
