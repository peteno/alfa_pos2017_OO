package br.com.munif.ooweb.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.munif.ooweb.Jogador;
import br.com.munif.ooweb.Lugar;
import br.com.munif.ooweb.Mapa;

@WebServlet("/JogadorController")
public class JogadorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;
	private HttpServletResponse response;
	private List<String> erros = new ArrayList<String>();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.request = req;
		this.response = resp;
		this.erros.clear();
		String acao = req.getParameter("acao");
		if (acao == null) {
			this.erros.add("Ação " + acao  + " inválida!");
			mostrarErros();
			return;
		}
		switch (acao) {
		case "entrar":
			entrar();
			break;
		case "mensagem":
			mensagem();
			break;
		case "mover":
			mover();
			break;
		case "sair":
			this.erros.add("Jogador " + getJogador().getNome()  + " saiu!");
			this.request.getSession().setAttribute("jogador", null);
			break;
		default:
			this.erros.add("Ação " + acao+ " inválida!");
			break;
		}
		mostrarErros();
	}

	private void entrar() {
		if (this.request.getSession().getAttribute("jogador") != null) {
			this.erros.add("Usuário já está na sala!");
			return;
		}
		String nome = this.request.getParameter("nome");
		if (nome == null || nome.trim().length() < 2) {
			this.erros.add("Nome " + nome  + " inválido!");
			return;
		}

    Mapa mapa = Mapa.getInstance();
		Jogador jogador = new Jogador(nome, mapa.getLugarInicialJogador());
    this.request.getSession().setAttribute("jogador", jogador);
    this.request.getSession().setAttribute("mapa", mapa);
	}

	private void mover() {
		String to = this.request.getParameter("to");
		if (to == null || to.trim().isEmpty()) {
			this.erros.add("Movimento não informado!");
			return;
		}
		Jogador jogador = getJogador();
		Lugar lugar = jogador.getLugar();
		switch (to) {
			case "norte":
				if (lugar.getNorte() != null) {
					jogador.setLugar(lugar.getNorte());
				}
				break;
			case "leste":
				if (lugar.getLeste() != null) {
					jogador.setLugar(lugar.getLeste());
				}
				break;
			case "oeste":
				if (lugar.getOeste() != null) {
					jogador.setLugar(lugar.getOeste());
				}
				break;
			case "sul":
				if (lugar.getSul() != null) {
					jogador.setLugar(lugar.getSul());
				}
				break;
			default:
				this.erros.add("Direção " + to +" inválido!");
				return;
		}
		if (lugar.equals(jogador.getLugar())) {
			this.erros.add("Ocorreu um erro ao mudar o usuário para o lugar: " + to);
		}
	}

	private void mensagem() {
		Jogador jogador = getJogador();
		String mensagem = this.request.getParameter("mensagem");
		if (mensagem == null || mensagem.trim().length() < 2) {
			this.erros.add("Mensagem " + mensagem  + " inválida!");
			return;
		}
		jogador.getLugar().getMensagens().add(jogador.getNome() + " disse: "+ mensagem);
	}

	private Jogador getJogador() {
	  return (Jogador)this.request.getSession().getAttribute("jogador");
  }



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  this.doGet(req, resp);
	}

	@Override
	public String getServletInfo() {
		return "Description Servlet";
	}

	private void mostrarErros() throws ServletException, IOException {
		request.getSession().setAttribute("mensagens", erros);
		request.setAttribute("mensagens", erros);
		response.sendRedirect("index.jsp");
	}
}