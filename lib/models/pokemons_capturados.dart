class PokemonsCapturados {

  int numero;
  String imagemPokemon;

  PokemonsCapturados(this.numero, this.imagemPokemon);

  String get imagem {
    return imagemPokemon;
  }

  int get id {
    return numero;
  }

  static PokemonsCapturados turtwig() {
    return new PokemonsCapturados(387, 'assets/images/turtwig.png');
  }

  static PokemonsCapturados aggron() {
    return new PokemonsCapturados(306, 'assets/images/aggron.png');
  }

  static PokemonsCapturados glalie() {
    return new PokemonsCapturados(362, 'assets/images/glalie.png');
  }

  static PokemonsCapturados luxray() {
    return new PokemonsCapturados(405, 'assets/images/luxray.png');
  }

  static PokemonsCapturados rayquaza() {
    return new PokemonsCapturados(384, 'assets/images/rayquaza.png');
  }
}