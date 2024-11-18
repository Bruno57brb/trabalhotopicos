<?php
include "conexao.php";
$conexao = conectar();
$id = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    $sql = "DELETE FROM pessoa WHERE id=$id)";
    $resultado = mysqli_query($conexao, $sql);
    if ($resultado) {
        //não precisa fazer nd
    } else {
        die("Problemas ao salvar a pessoa. Erro:" .
            mysqli_errno($conexao) . "" . mysqli_error($conexao));
    }
}
