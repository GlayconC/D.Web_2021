<?php
    $Pagina = $_GET['offset'] * 5;
    $Offset = $Pagina - 5;
    if (isset($_GET['id']))
        $id = $_GET['id'];
 
    try {
        if (isset($id)) {
            $stmt = $conn->prepare('SELECT * FROM produtos WHERE id = :id');
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        } else {
            $stmt = $conn->prepare('SELECT * FROM produtos
                                    LIMIT :offset,:pag ');
            $stmt->bindParam(':offset',$Offset, PDO::PARAM_INT);
            $stmt->bindParam(':pag', $Pagina, PDO::PARAM_INT); 
        }
        //$stmt->execute(array('id' => $id));
        $stmt->execute();
    


        
        //while($row = $stmt->fetch()) {
        //while($row = $stmt->fetch(PDO::FETCH_OBJ)) {
            //print_r($row);
        //}
 
        $result = $stmt->fetchAll();
?>
<table border="1" class="table table-striped">
<tr>
            <td>Nome</td>
            <td>Marca</td>           
            <td>Valor</td>    
            <td>Ação</td>
</tr>
<?php
        if ( count($result) ) {
            foreach($result as $row) {
                ?>
                <tr>
                    <td><?=$row['nome']?></td>
                    <td><?=$row['marca']?></td>
                    <td><?=$row['valor']?></td>
                    <td>
                        <a href="?modulo=produtos&pagina=alterar&nome=<?=$row['nome']?>">Alterar</a>
                        <a href="?modulo=produtos&pagina=deletar&nome=<?=$row['nome']?>">Excluir</a>
                    </td>
                </tr>
                <?php
            }
        } else {
            echo "Nenhum resultado retornado.";
        }
?>
</table>
<?php
    } catch(PDOException $e) {
        echo 'ERROR: ' . $e->getMessage();
    }
