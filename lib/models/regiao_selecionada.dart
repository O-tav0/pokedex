
class RegiaoSelecionada {
  String nomeRegiao;
  String imagemRegiao;

  String get imagem {
    return imagemRegiao;
  }

  String get nome {
    return nomeRegiao;
  }

  RegiaoSelecionada(this.nomeRegiao, this.imagemRegiao);

  static RegiaoSelecionada kanto() {
    return new RegiaoSelecionada('Kanto', 'assets/images/kanto.png');
  }

  static RegiaoSelecionada johto() {
    return new RegiaoSelecionada('Johto', 'assets/images/johto.png');
  }

  static RegiaoSelecionada hoenn() {
    return new RegiaoSelecionada('Hoenn', 'assets/images/hoenn.png');
  }

  static RegiaoSelecionada sinnoh() {
    return new RegiaoSelecionada('Sinnoh', 'assets/images/sinnoh.png');
  }

  static RegiaoSelecionada unova() {
    return new RegiaoSelecionada('Unova', 'assets/images/unova.png');
  }

  static RegiaoSelecionada kalos() {
    return new RegiaoSelecionada('Kalos', 'assets/images/kalos.png');
  }

  static RegiaoSelecionada alola() {
    return new RegiaoSelecionada('Alola', 'assets/images/alola.png');
  }

  static RegiaoSelecionada galar() {
    return new RegiaoSelecionada('Galar', 'assets/images/galar.png');
  }

  static RegiaoSelecionada paldea() {
    return new RegiaoSelecionada('Paldea', 'assets/images/paldea.png');
  }
}