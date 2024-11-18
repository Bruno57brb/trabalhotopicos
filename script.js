document.addEventListener("DOMContentLoaded", () => {
  listarTodos();
  const modals = document.querySelectorAll(".modal");
  M.Modal.init(modals); // Inicializa todos os modais no documento
});

let idTabuleiroParaExcluir = null;

function listarTodos() {
  fetch("listar.php", {
      method: "GET",
      headers: { "Content-Type": "application/json; charset=UTF-8" },
  })
      .then((response) => response.json())
      .then((jogos) => inserirJogos(jogos))
      .catch((error) => console.log(error));
}

function inserirJogos(jogos) {
  let tbody = document.getElementById("jogos");
  tbody.innerHTML = ""; // Limpa o tbody antes de inserir os novos dados
  for (const jogo of jogos) {
      inserirJogo(jogo);
  }
}

function inserirJogo(jogo) {
  let tbody = document.getElementById("jogos");
  let tr = document.createElement("tr");

  let tdId = document.createElement("td");
  tdId.innerHTML = jogo.id_tabuleiro;

  let tdNome = document.createElement("td");
  tdNome.innerHTML = jogo.nome_do_jogo;

  let tdCategoria = document.createElement("td");
  tdCategoria.innerHTML = jogo.categoria;

  let tdJogadores = document.createElement("td");
  tdJogadores.innerHTML = jogo.numero_de_jogadores;

  let tdDuracao = document.createElement("td");
  tdDuracao.innerHTML = jogo.duracao;

  let tdAlterar = document.createElement("td");
  let btnAlterar = document.createElement("button");
  btnAlterar.innerHTML = "Alterar";
  btnAlterar.className = "btn blue";
  btnAlterar.addEventListener("click", buscaJogo, false);
  btnAlterar.id_tabuleiro = jogo.id_tabuleiro;
  tdAlterar.appendChild(btnAlterar);

  let tdExcluir = document.createElement("td");
  let btnExcluir = document.createElement("button");
  btnExcluir.innerHTML = "Excluir";
  btnExcluir.className = "btn red";
  btnExcluir.addEventListener("click", () => abrirModalExcluir(jogo.id_tabuleiro), false);
  tdExcluir.appendChild(btnExcluir);

  tr.appendChild(tdId);
  tr.appendChild(tdNome);
  tr.appendChild(tdCategoria);
  tr.appendChild(tdJogadores);
  tr.appendChild(tdDuracao);
  tr.appendChild(tdAlterar);
  tr.appendChild(tdExcluir);
  tbody.appendChild(tr);
}

// Função para abrir o modal de confirmação de exclusão
function abrirModalExcluir(id_tabuleiro) {
  // Atribui o id_tabuleiro do jogo a ser excluído
  idTabuleiroParaExcluir = id_tabuleiro;
  let modalExcluir = M.Modal.getInstance(document.getElementById("modalExcluir"));
  modalExcluir.open(); // Abre o modal
}

// Adiciona o evento de clique no botão "Confirmar Exclusão"
document.getElementById("confirmarExcluir").addEventListener("click", () => {
  if (idTabuleiroParaExcluir !== null) {
    // Se o id_tabuleiro estiver definido, chama a função para excluir o jogo
    excluirJogo(idTabuleiroParaExcluir);
    idTabuleiroParaExcluir = null; // Reseta a variável após a exclusão
  }
});

// Função para excluir o jogo
function excluirJogo(id_tabuleiro) {
  // Faz uma requisição para excluir o jogo no servidor
  fetch(`excluir.php?id_tabuleiro=${id_tabuleiro}`, {
    method: "GET",
    headers: { "Content-Type": "application/json; charset=UTF-8" },
  })
    .then((response) => response.json()) // Converte a resposta para JSON
    .then((jogo) => {
        // Se a exclusão for bem-sucedida, atualiza a lista de jogos
        listarTodos();
        M.toast({ html: 'Jogo excluído com sucesso!', classes: 'green', displayLength: 4000 });
        // Fecha o modal após a exclusão
        M.Modal.getInstance(document.getElementById("modalExcluir")).close();
    })
    .catch((error) => {
      console.log(error);
      M.toast({ html: 'Erro ao excluir o jogo. Tente novamente.', classes: 'red', displayLength: 4000 });
    });
}
function alterarJogo(jogo) {
  let tbody = document.getElementById("jogos");
  for (const tr of tbody.children) {
      if (tr.children[0].innerHTML == jogo.id_tabuleiro) {
          tr.children[1].innerHTML = jogo.nome_do_jogo;
          tr.children[2].innerHTML = jogo.categoria;
          tr.children[3].innerHTML = jogo.numero_de_jogadores;
          tr.children[4].innerHTML = jogo.duracao;
      }
  }
}

function buscaJogo(evt) {
  let id_tabuleiro = evt.currentTarget.id_tabuleiro;
  fetch("buscaJogo.php?id_tabuleiro=" + id_tabuleiro, {
      method: "GET",
      headers: { "Content-Type": "application/json; charset=UTF-8" },
  })
      .then((response) => response.json())
      .then((jogo) => preencheForm(jogo))
      .catch((error) => console.log(error));
}

function preencheForm(jogo) {
  document.getElementById("id_tabuleiro").value = jogo.id_tabuleiro;
  document.getElementById("nome_do_jogo").value = jogo.nome_do_jogo;
  document.getElementById("categoria").value = jogo.categoria;
  document.getElementById("numero_de_jogadores").value = jogo.numero_de_jogadores;
  document.getElementById("duracao").value = jogo.duracao;

  M.updateTextFields();

  var elem = document.querySelector("#editModal");
  var instance = M.Modal.getInstance(elem);
  instance.open();
}

function salvarJogo(event) {
  event.preventDefault();
  let id_tabuleiro = document.getElementById("id_tabuleiro").value;
  let nome_do_jogo = document.getElementById("nome_do_jogo").value;
  let categoria = document.getElementById("categoria").value;
  let numero_de_jogadores = document.getElementById("numero_de_jogadores").value;
  let duracao = document.getElementById("duracao").value;

  if (id_tabuleiro === "") {
      cadastrar(nome_do_jogo, categoria, numero_de_jogadores, duracao);
  } else {
      alterar(id_tabuleiro, nome_do_jogo, categoria, numero_de_jogadores, duracao);
  }

  M.Modal.getInstance(document.querySelector("#editModal")).close(); // Fecha o modal após o salvamento
}

function cadastrar(nome_do_jogo, categoria, numero_de_jogadores, duracao) {
  fetch("inserir.php", {
      method: "POST",
      body: JSON.stringify({
          nome_do_jogo: nome_do_jogo,
          categoria: categoria,
          numero_de_jogadores: numero_de_jogadores,
          duracao: duracao,
      }),
      headers: { "Content-Type": "application/json; charset=UTF-8" },
  })
      .then((response) => response.json())
      .then((jogo) => {
          inserirJogo(jogo);
          M.toast({ html: "Jogo cadastrado com sucesso!", classes: "green" });
      })
      .catch((error) => console.log(error));
}

function alterar(id_tabuleiro, nome_do_jogo, categoria, numero_de_jogadores, duracao) {
  fetch("alterar.php", {
      method: "POST",
      body: JSON.stringify({
          id_tabuleiro: id_tabuleiro,
          nome_do_jogo: nome_do_jogo,
          categoria: categoria,
          numero_de_jogadores: numero_de_jogadores,
          duracao: duracao,
      }),
      headers: { "Content-Type": "application/json; charset=UTF-8" },
  })
      .then((response) => response.json())
      .then((jogo) => {
          alterarJogo(jogo);
          M.toast({ html: "Jogo alterado com sucesso!", classes: "blue" });
      })
      .catch((error) => console.log(error));
}
