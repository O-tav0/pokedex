import 'package:flutter/cupertino.dart';
import 'package:pokeapi_dart/pokeapi_dart.dart';

class HabilidadePokemon extends StatelessWidget {

  PokemonMove _habilidade;
  
  HabilidadePokemon(this._habilidade);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_habilidade.move.name),
        Text(_habilidade.versionGroupDetails[0].levelLearnedAt.toString()),
        Text(_habilidade.versionGroupDetails[0].moveLearnMethod.name)
      ]
    );
  }
}