<?php

require_once 'admin.php';

$hostname = "localhost";
$nome_bd = "00_ecommerce_esportes";
$user = $_POST['login'];
$password = $_POST['senha'];

$a = new Admin($nome_bd, $hostname, $user, $password);

?>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Ecommerce de Esportes</title>
</head>
<body>
    <?php
        if(isset($_POST['cod_prod'])){
            $cod_prod = addslashes($_POST['cod_prod']);
            $nome = addslashes($_POST['nome']);
            $descricao = addslashes($_POST['descricao']);
            $cor = addslashes($_POST['cor']);
            $tamanho = addslashes($_POST['tamanho']);
            $cod_categ = addslashes($_POST['cod_categ']);
            $preco = addslashes($_POST['preco']);
            $cod_gar = addslashes($_POST['cod_gar']);

            if (!empty($cod_prod) && !empty($nome) && !empty($descricao) && !empty($cor) && !empty($tamanho) && !empty($cod_categ) && !empty($preco) && empty($cod_gar)){
                //cadastrar
                if(!$a->cadastrarProduto($cod_prod, $nome, $descricao, $cor, $tamanho, $cod_categ, $preco, $cod_gar)) {
                    echo "Produto já cadastrado!";
                }
            else
                echo "Preencha todos os campos!";

            }  
        }
    
    ?>

    <section id='esquerda'>
        <form>
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
        </form> 
    </section> 
    
    
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
        <?php
            $dados = $a->buscarDados();

            if (count($dados) > 0) //se tem produtos cadastrados no banco
            {
                for ($i=0; $i < count($dados); $i++) 
                { 
                    echo "<tr>";
                    
                    foreach ($dados[$i] as $k => $v) 
                    {
                        echo "<td>".$v."</td>";
                    }
                    
                    echo "<td><a href=''>Editar</a> <a href=''>Excluir</a></td>";
                    echo "</tr>";
                }
            }
            else 
                echo "<br><br>Banco está vazio!"
        ?>

    </table>
    </section>

    <br><br><br><br>
    <a href='index.html'>Voltar para página principal</a>
    <br><br>
    <a href='login.php'>Voltar para página de login</a>  

</body>
</html>
