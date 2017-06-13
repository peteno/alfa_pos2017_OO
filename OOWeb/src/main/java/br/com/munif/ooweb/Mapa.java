package br.com.munif.ooweb;

public class Mapa {

	private Lugar lugarInicialJogador;
	private Lugar lugarInicialNPC;
	private static final Mapa mapa = new Mapa();

	public Mapa() {
		criaLugares();
	}

	public static Mapa getInstance() {
		return mapa;
	}

	private void criaLugares() {
		Lugar sala = new Lugar("Sala");
		Lugar copa = new Lugar("Copa");
		Lugar corredor = new Lugar("Corredor");
		Lugar cozinha = new Lugar("Cozinha");
		Lugar quarto = new Lugar("Quarto");
		Lugar banheiro = new Lugar("Banheiro");
		sala.setSul(copa);
		copa.setNorte(sala);
		copa.setSul(cozinha);
		cozinha.setNorte(copa);
		sala.setOeste(corredor);
		copa.setOeste(corredor);
		cozinha.setOeste(corredor);
		corredor.setLeste(copa);
		corredor.setNorte(quarto);
		quarto.setSul(corredor);
		corredor.setSul(banheiro);
		banheiro.setNorte(corredor);
		lugarInicialJogador = sala;
		lugarInicialNPC = cozinha;
	}

	public Lugar getLugarInicialJogador() {
		return lugarInicialJogador;
	}

	public Lugar getLugarInicialNPC() {
		return lugarInicialNPC;
	}

}
