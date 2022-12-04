
class RegiaoSelecionada {
  String nomeRegiao;
  String imagemRegiao;
  int numeroRegiao;

  String get imagem {
    return imagemRegiao;
  }

  String get nome {
    return nomeRegiao;
  }

  int get numero {
    return numeroRegiao;
  }

  RegiaoSelecionada(this.nomeRegiao, this.imagemRegiao, this.numeroRegiao);

  static RegiaoSelecionada kanto() {
    return new RegiaoSelecionada('Kanto', 'assets/images/kanto.png', 2);
  }

  static RegiaoSelecionada johto() {
    return new RegiaoSelecionada('Johto', 'assets/images/johto.png', 3);
  }

  static RegiaoSelecionada hoenn() {
    return new RegiaoSelecionada('Hoenn', 'assets/images/hoenn.png', 4);
  }

  static RegiaoSelecionada sinnoh() {
    return new RegiaoSelecionada('Sinnoh', 'assets/images/sinnoh.png', 5);
  }

  static RegiaoSelecionada unova() {
    return new RegiaoSelecionada('Unova', 'assets/images/unova.png', 8);
  }

  static RegiaoSelecionada kalos() {
    return new RegiaoSelecionada('Kalos', 'assets/images/kalos.png', 12);
  }

  static RegiaoSelecionada alola() {
    return new RegiaoSelecionada('Alola', 'assets/images/alola.png', 16);
  }
  
  static RegiaoSelecionada galar() {
    return new RegiaoSelecionada('Galar', 'assets/images/galar.png', 27);
  }

  static RegiaoSelecionada paldea() {
    return new RegiaoSelecionada('Paldea', 'assets/images/paldea.png', 10);
  }
}