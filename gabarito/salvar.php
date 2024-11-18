<?php
include_once "conexao.php";
$conexao = conectar();

//pega os dados cru da entrada do PHP e transforma em um objeto JSON
$pessoa = json_decode(file_get_contents("php://input"));

// se for inserir
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $sql = "INSERT INTO pessoa (nome, cpf) VALUES 
                           ('$pessoa->nome', '$pessoa->cpf')";
    $resultado = mysqli_query($conexao, $sql);
    if ($resultado == TRUE) {
        $pessoa->id = mysqli_insert_id($conexao);
        // converte o objeto pessoa em uma string no formato JSON
        echo json_encode($pessoa);
    } else {
        die("Erro ao inserir a pessoa no banco de dados. " .
            mysqli_errno($conexao) . ": " . mysqli_error($conexao));
    }
} else if ($_SERVER['REQUEST_METHOD'] == "PUT") { // editar
    $sql = "UPDATE pessoa SET nome='$pessoa->nome', 
                    cpf='$pessoa->cpf' WHERE id=$pessoa->id";
    $resultado = mysqli_query($conexao, $sql);
    if ($resultado == TRUE) {
        // converte o objeto pessoa em uma string no formato JSON
        echo json_encode($pessoa);
    } else {
        die("Erro ao inserir a pessoa no banco de dados. " .
            mysqli_errno($conexao) . ": " . mysqli_error($conexao));
    }
}
