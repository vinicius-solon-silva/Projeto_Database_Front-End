<?php

$hostname = "localhost";
$nome_bd = "00_ecommerce_esportes";
$user = $_POST['login'];
$password = $_POST['senha'];

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
    <h3>Página do admin</h3>
    <form> 
       <section id='esquerda'>
            <strong>CADASTRAR PRODUTO</strong>
            <label for='codigo'>Código do Produto</label> <input type='text' name='codigo' id='codigo'>
            <label for='nome'>Nome</label> <input type='text' name='nome' id='nome'>
            <label for='descricao'>Descrição</label> <input type='text' name='descricao' id='descricao'>
            <label for='cor'>Cor</label> <input type='text' name='cor' id='cor'>
            <label for='tamanho'>Tamanho</label> <input type='text' name='tamanho' id='tamanho'>
            <label for='categoria'>Código da Categoria</label> <input type='text' name='categoria' id='categoria'>
            <label for='preco'>Preço</label> <input type='text' name='preco' id='preco'>
            <label for='codigo'>Código da Garantia</label> <input type='text' name='codigo' id='codigo'>
            <input type='submit' value='Cadastrar'></section>
       </section> 
    </form>
    
    <section id='direita'>
    <table>
        <tr>
            <td>Código do Produto</td>
            <td>Nome</td>
            <td>Descrição</td>
            <td>Cor</td>
            <td>Tamanho</td>
            <td>Código da Categoria</td>
            <td>Preço</td>
            <td>Código da Garantia</td>
        </tr>
        <tr>
            <td>10</td>
            <td>Calçado do Neymar</td>
            <td>Calçado brabo</td>
            <td>Amarelo</td>
            <td>52</td>
            <td>2</td>
            <td>29.90</td>
            <td>1</td>
            <td><a href=''>Editar</a><a href=''>Excluir</a></td>
        </tr>
    </table>
    </section>

    <a href='login.php'>Voltar para página de login</a>  

</body>
</html>
