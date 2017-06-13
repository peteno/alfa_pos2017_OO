<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
	<h2>Olá ${jogador.nome}</h2>
</div>
<div class="row">
	<h3>Você está no(a): ${jogador.lugar.descricao}</h3>
</div>
<div class="row">
	<h3>Participante(s): ${jogador.lugar.personagens}</h3>
</div>

<div class="row">
	<div class="col-md-4">
		<div class="row form-group">
			<div class="col-xs-12">
				<form action="JogadorController" method="POST">
					<input type="hidden" name="acao" value="mover">
					<input type="hidden" name="to" value="norte">
					<button type="submit" 
						class="btn btn-lg btn-info btn-block" ${jogador.lugar.norte == null ? 'disabled' : ''}>
						NORTE => ${jogador.lugar.norte != null ? jogador.lugar.norte.descricao : 'Vazio'}
					</button>
				</form>
			</div>
		</div>
		<div class="row">	
			<div class="col-xs-6 form-group">
				<form action="JogadorController" method="POST">
					<input type="hidden" name="acao" value="mover">
					<input type="hidden" name="to" value="oeste">
					<button type="submit" 
						class="btn btn-lg btn-info btn-block" ${jogador.lugar.oeste == null ? 'disabled' : ''}>
						OESTE => ${jogador.lugar.oeste != null ? jogador.lugar.oeste.descricao : 'Vazio'}
					</button>
				</form>
			</div>
			<div class="col-xs-6 form-group">
				<form action="JogadorController" method="POST">
					<input type="hidden" name="acao" value="mover">
					<input type="hidden" name="to" value="leste">
					<button type="submit" 
						class="btn btn-lg btn-info btn-block" ${jogador.lugar.leste == null ? 'disabled' : ''}>
						LESTE => ${jogador.lugar.leste != null ? jogador.lugar.leste.descricao : 'Vazio'}
					</button>
				</form>
			</div>
		</div>
		<div class="row form-group">	
			<div class="col-xs-12">
				<form action="JogadorController" method="POST">
					<input type="hidden" name="acao" value="mover">
					<input type="hidden" name="to" value="sul">
					<button type="submit" 
						class="btn btn-lg btn-info btn-block" ${jogador.lugar.sul == null ? 'disabled' : ''}>
						SUL => ${jogador.lugar.sul != null ? jogador.lugar.sul.descricao : 'Vazio'}
					</button>
				</form>
			</div>
		</div>
		
		<div class="row form-group">	
			<div class="col-xs-12">
				<form action="JogadorController" method="POST">
					<input type="hidden" name="acao" value="sair">
					<button type="submit" class="btn btn-lg btn-danger btn-block">SAIR</button>
				</form>
			</div>
		</div>
	</div>
</div>	

<c:if test="${jogador.lugar.mensagens != null && !jogador.lugar.mensagens.isEmpty() }">
	<h4>Mensagem:</h4>
</c:if>
<c:forEach var="mensagem" items="${jogador.lugar.mensagens}">
	<div class="row">
		 ${mensagem}
	</div>
</c:forEach>
<div class="row coment">
	<form action="JogadorController" method="POST">
		<input type="hidden" name="acao" value="mensagem">
		<div class="form-group">
			<input type="hidden" name="idpost" value="${param.idpost}"/>
			<label for="comment">Deixe sua mensagem na sala:</label>
			<textarea 
				name="mensagem"
				class="form-control" rows="5"
				style="max-width: 100%;min-width: 100%"
				required></textarea>
		</div> 
		<button 
            type="submit" 
            class="btn btn-success"
            name="bOK">POSTAR
        </button>
	</form>
</div>
  
