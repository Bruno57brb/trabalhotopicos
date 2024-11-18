<?php

include_once "conexao.php";
$conexao = conectar();

$sql = "SELECT * FROM pessoa";
$resultado = mysqli_query($conexao, $sql);
if ($resultado == TRUE) {
    $pessoas = mysqli_fetch_all($resultado, MYSQLI_ASSOC);
    echo json_encode($pessoas);
} else {
    die("Erro ao buscar os dados das pessoas. " .
        mysqli_errno($conexao) . ": " . mysqli_error($conexao));
}
