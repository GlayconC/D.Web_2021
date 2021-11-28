<?php
    if (isset($_POST['deletar'])) {
        try {
            $stmt = $conn->prepare(
                'DELETE FROM produtos WHERE nome = :nome');
            
           $stmt->execute(array('nome' => $_GET['nome']));
            
            ?>
                <div class="alert alert-success" role="alert">
                    Sucesso! O registro foi deletado.
                </div>
            <?php
            exit();
        } catch(PDOException $e) {
            echo 'ERROR: ' . $e->getMessage();
        }
    }
 
    if (isset($_GET['nome'])) {
        $stmt = $conn->prepare('SELECT * FROM produtos WHERE nome = :nome');
        $stmt->bindParam(':nome', $_GET['nome'], PDO::PARAM_INT);
    }
    //$stmt->execute(array('id' => $id));
 //   $stmt->execute();
    $r = $stmt->fetchAll();
?>
<form method="post">
    Deseja realmente excluír esse produto?
    <input type="submit" name="deletar" value="Confirmar" class="btn btn-danger">
</form>
