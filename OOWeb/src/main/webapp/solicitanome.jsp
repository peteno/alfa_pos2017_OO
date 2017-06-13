<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="JogadorController" method="post" method="POST">
	<input type="hidden" name="acao" value="entrar">
	<div class="form-group input-group-lg">
		<label for="nome">Informe um Nome:</label> <input
			class="form-control" 
			name="nome" placeholder="Nome" 
			required
			type="text">
	</div>
	<button type="submit" class="btn btn-lg btn-info">ENVIAR</button>
</form>