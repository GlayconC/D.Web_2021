<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <title>Logar</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body> 
    <?php
        session_start();
        include 'bibliotecas/parametros.php';
        include 'bibliotecas/conexao.php';

        $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

        if(!empty($dados['login'])){
            //var_dump($dados);

            $QueryLogin = "SELECT id,
                                  login,
                                  password,
                                  nome
                             FROM usuarios 
                            WHERE login = :login ";
            $ResultLogin = $conn->prepare($QueryLogin);
            $ResultLogin->bindParam(':login',$dados['login'],PDO::PARAM_STR);
            $ResultLogin->execute();

            if (($ResultLogin) and ($ResultLogin->rowCount() != 0)){
                $RowUsuario = $ResultLogin->fetch(PDO::FETCH_ASSOC);
                if(password_verify($dados['password'],$RowUsuario['password'])){
                    $_SESSION['Nome'] = $RowUsuario['nome'];
                    $_SESSION['Login'] = $RowUsuario['login'];
                    $_SESSION['Password'] = $RowUsuario['password'];
    
                    header('Location: index.php');                    
                }else{
                    $_SESSION['MsgLogin'] = "Erro: Usuário ou senha inválidos!";
                }
            }else{
                $_SESSION['MsgLogin'] = "Erro: Usuário ou senha inválidos11!";
            }
            
        }
        if(isset($_POST['registrar'])){
            header('Location: registrar.php');
        }else{
    ?>
    
    <form action="" class="login-box" method="post" >
        <?php
            if (isset($_SESSION['MsgLogin'])){
                echo '<h3 class="MsgErro">'.$_SESSION['MsgLogin'].'</h3>';
                unset($_SESSION['MsgLogin']);
            }
        ?>
        <h1>Login</h1>
        <section class="textbox">
            <input name="login" type="text" placeholder="Login" value="">
        </section>

        <section class="textbox">
            <input name="password" type="password" placeholder="Password" value="">
        </section>
        
        <input type="submit" value="Login" name="login" class="login">
        <a href="registrar.php">Registrar</a> 
    </form>
    </body>
</html>
<?php
    }