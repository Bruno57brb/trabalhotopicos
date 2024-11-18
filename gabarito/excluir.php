<?php

include_once "conexao.php";
$conexao = conectar();

$id = $_GET['id'];

$sql = "DELETE FROM pessoa WHERE id=$id";
$resultado = mysqli_query($conexao, $sql);
if ($resultado == TRUE) {
    echo '{"id":"' . $id . '"}';
} else {
    die("Erro ao deletar a pessoa. " . mysqli_errno($conexao) .
        ": " . mysqli_error($conexao));
}
