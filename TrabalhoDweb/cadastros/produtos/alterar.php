<?php
    if (isset($_POST['alterar'])) {
        try {
            $stmt = $conn->prepare(
                'UPDATE produtos SET nome = :nome, marca = :marca, valor = :valor WHERE nome = :nome');
            
            $stmt->execute(array('nome' => $_POST['nome'], 'marca' => $_POST['marca'], 
                                 'valor' => $_POST['valor']));
           
        } catch(PDOException $e) {
            echo 'ERROR: ' . $e->getMessage();
        }
    }
 
    if (isset($_GET['nome'])) {
        $stmt = $conn->prepare('SELECT * FROM produtos WHERE nome = :nome');
        $stmt->bindParam(':nome', $_GET['nome'], PDO::PARAM_INT);
    }
   
    $stmt->execute();
    $r = $stmt->fetchAll();
 
?>
<form method="post">
    <input type="text" placeholder="nome" required name="nome" value="<?=$r[0]['nome']?>" >
    <input type="text" placeholder="marca" required name="marca" value="<?=$r[0]['marca']?>" >
    <input type="number" placeholder="valor" required name="valor" min="1" step="any" value="<?=$r[0]['valor']?>"> 
    <input type="submit" name="alterar" value="Confirmar" class="btn btn-success">
</form>
