<?php
    if (isset($_POST['gravar'])) {
        
        try {
            $stmt = $conn->prepare(
                'INSERT INTO produtos (nome,marca,valor) values (:nome,:marca,:valor)');
            $stmt->execute(array('nome' => $_POST['nome'], 'marca' => $_POST['marca'],'valor' => $_POST['valor']));
        } catch(PDOException $e) {
            echo 'ERROR: ' . $e->getMessage();
        }
    }
?>
<form method="post">
    <div class="form-group">
        <label for="nome">Nome</label>
        <input type="text" class="form-control" name="nome" id="nome" placeholder="Nome" required>

        <label for="valor">Valor</label>
        <input type="number" min="1" step="any" class="form-control" name="valor" id="valor" placeholder="Valor" required>

        <label for="marca">Marca</label>
        <input type="text" class="form-control" name="marca" id="marca" placeholder="Marca" required>

    </div>
    <input type="submit" name="gravar" value="Gravar" class="btn btn-success">
</form>
