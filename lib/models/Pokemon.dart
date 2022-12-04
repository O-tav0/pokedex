import 'package:pokedex/models/pokemonSpecies.dart';

class Pokemon {
  int entry_number;
  PokemonSpecies pokemon_species;
  String imgUrl;

  Pokemon(this.entry_number, this.pokemon_species, this.imgUrl);

  // factory Pokemon.fromJson(Map<String, dynamic> data) {
  // // note the explicit cast to String
  // // this is required if robust lint rules are enabled
  //   final entry_number = data['entry_number'] as int;
  //   final pokemon_species = data['pokemon_species'] as PokemonSpecies;

  //   return Pokemon(entry_number, pokemon_species, imgUrl);
  // }
}