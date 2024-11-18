<?php

require_once "conexao.php";
$conexao = conectar();

$sql = "SELECT * FROM tabuleiro";
$resultado = executarSQL($conexao, $sql);
$jogos = mysqli_fetch_all($resultado, MYSQLI_ASSOC);
echo json_encode($jogos);
