class PokemonSpecies {
  String name;
  String url;

  PokemonSpecies(this.name, this.url);

  factory PokemonSpecies.fromJson(Map<String, dynamic> data) {
  // note the explicit cast to String
  // this is required if robust lint rules are enabled
    final name = data['name'] as String;
    final url = data['url'] as String;

    return PokemonSpecies(name, url);
  }
}