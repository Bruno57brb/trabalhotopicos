<?php

$id_tabuleiro = $_GET['id_tabuleiro'];

require_once "conexao.php";
$conexao = conectar();

$sql = "SELECT id_tabuleiro, nome_do_jogo, categoria, numero_de_jogadores, duracao FROM tabuleiro 
        WHERE id_tabuleiro = $id_tabuleiro";
$resultado = executarSQL($conexao, $sql);
$tabuleiro = mysqli_fetch_assoc($resultado);
echo json_encode($tabuleiro);
