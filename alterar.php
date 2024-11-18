<?php

require_once "conexao.php";
$conexao = conectar();
$tabuleiro = json_decode(file_get_contents("php://input"));
$sql = "UPDATE tabuleiro SET
        nome_do_jogo='$tabuleiro->nome_do_jogo', 
        categoria='$tabuleiro->categoria', 
        numero_de_jogadores='$tabuleiro->numero_de_jogadores',
        duracao='$tabuleiro->duracao'
        WHERE id_tabuleiro=$tabuleiro->id_tabuleiro";

executarSQL($conexao, $sql);

echo json_encode($tabuleiro);


