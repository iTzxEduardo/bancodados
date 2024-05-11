<?php
include 'functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';
// Verifica se os dados POST não estão vazios
if (!empty($_POST)) {
    // Se os dados POST não estiverem vazios, insere um novo registro
    // Configura as variáveis que serão inserid_entregaas. Devemos verificar se as variáveis POST existem e, se não existirem, podemos atribuir um valor padrão a elas.
    $id_entrega = isset($_POST['id_entrega']) && !empty($_POST['id_entrega']) && $_POST['id_entrega'] != 'auto' ? $_POST['id_entrega'] : NULL;
    // Verifica se a variável POST "nome" existe, se não existir, atribui o valor padrão para vazio, basicamente o mesmo para todas as variáveis
    $nome = isset($_POST['nome']) ? $_POST['nome'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $cel = isset($_POST['cel']) ? $_POST['cel'] : '';
    $pizza = isset($_POST['pizza']) ? $_POST['pizza'] : '';
    $situacao = isset($_POST['situacao']) ? $_POST['situacao'] :'';
    // Insere um novo registro na tabela contacts
    $stmt = $pdo->prepare('INSERT INTO entregas (id_entrega, nome, email, cel, pizza, situacao) VALUES (?, ?, ?, ?, ?, ?)');
    $stmt->execute([$id_entrega, $nome, $email, $cel, $pizza, $situacao]);
    // Mensagem de saída
    $msg = 'Entrega registrada!';
}
?>


<?=template_header('Cadastro de Entregas')?>

<div class="content update">
	<h2>Realizar Entrega</h2>
    <form action="createEntregas.php" method="post">
        <label for="id_entrega">ID</label>
        <label for="nome">Nome</label>
        <input type="text" name="id_entrega" placeholder="" value="" id_entrega="id_entrega" >
        <input type="text" name="nome" placeholder="Seu Nome" id_entrega="nome">
        <label for="email">Email</label>
        <label for="cel">Celular</label>
        <input type="text" name="email" placeholder="seuemail@seuprovedor.com.br" id_entrega="email">
        <input type="text" name="cel" placeholder="(XX) X.XXXX-XXXX" id_entrega="cel">
        <label for="pizza">Sabor Pizza</label>
        <label for="situacao">Situação do Pedido</label>
        <input type="text" name="pizza" placeholder="Pizza" id_entrega="pizza">
        <input type="text" name="situacao" placeholder="situação" id_entrega="situacao"l>
        <input type="submit" value="Realizar Pedido">
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>