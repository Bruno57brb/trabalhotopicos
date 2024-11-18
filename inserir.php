<?php

require_once "conexao.php";
$conexao = conectar();

$jogo = json_decode(file_get_contents("php://input"));
$sql = "INSERT INTO tabuleiro 
        (nome_do_jogo, categoria, numero_de_jogadores, duracao)
        VALUES 
        ('$jogo->nome_do_jogo', 
        '$jogo->categoria', 
        '$jogo->numero_de_jogadores', 
        '$jogo->duracao')";

executarSQL($conexao, $sql);

$jogo->id_tabuleiro = mysqli_insert_id($conexao);
echo json_encode($jogo);
