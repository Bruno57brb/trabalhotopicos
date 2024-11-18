<?php
include "conexao.php";
$conexao = conectar();
$pessoa = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $sql = "INSERT INTO pessoa (nome, cpf) VALUES ('$pessoa->nome', '$pessoa->cpf')";
    $resultado = mysqli_query($conexao, $sql);
    if ($resultado) {
        $pessoa->id = mysqli_insert_id($conexao);
        echo json_encode($pessoa);
    } else {
        die("Problemas ao salvar a pessoa. Erro:" .
            mysqli_errno($conexao) . "" . mysqli_error($conexao));
    }
} else if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
    $sql = "UPDATE pessoa SET nome='$pessoa->nome', cpf='$pessoa->cpf' WHERE id=$pessoa->id";
    $resultado = mysqli_query($conexao, $sql);
    if ($resultado) {
        echo json_encode($pessoa);
    } else {
        die("Problemas ao salvar a pessoa. Erro:" .
            mysqli_errno($conexao) . "" . mysqli_error($conexao));
    }
}
