import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi_dart/pokeapi_dart.dart';
import 'package:pokedex/Cores/cores.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pokedex/components/barra_status_pokemon.dart';
import 'package:pokedex/components/carrossel_detalhe_pokemon.dart';
import 'package:pokedex/components/slide_esquerda_animation.dart';

class DetalhePokemon extends StatefulWidget {

  final String _nomePokemonSelecionado;
  final List<PokemonEntry> _listaDePokemons;

  DetalhePokemon(this._nomePokemonSelecionado, this._listaDePokemons);

  @override
  State<DetalhePokemon> createState() => _DetalhePokemonState();
}

class _DetalhePokemonState extends State<DetalhePokemon> {
  @override
  Widget build(BuildContext context) {

    String _nomePokemonSelecionado = widget._nomePokemonSelecionado;
    List<PokemonEntry> _listaDePokemons = widget._listaDePokemons;

    final api = PokeApi(); 

    _retornarPaginaAnterior(BuildContext context) {
      Navigator.of(context).pop();
    }

    _buscarDetalhesDoPokemon() {
      return api.pokemon.get(name: _nomePokemonSelecionado);
    }

    Color _trataTipoPokemon(String tipo) {
      Color corCard = Colors.white;
      switch(tipo) {
        case 'normal':
        corCard = Colors.brown.shade200;
        break;

        case 'fighting':
        corCard = Colors.red;
        break;

        case 'flying':
        corCard = Colors.indigo.shade200;
        break;

        case 'poison':
        corCard = Colors.purple;
        break;

        case 'ground':
        corCard = Colors.orange.shade200;
        break;

        case 'rock':
        corCard = Colors.brown.shade700;
        break;

        case 'bug':
        corCard = Colors.green.shade400;
        break;

        case 'ghost':
        corCard = Colors.deepPurple;
        break;

        case 'steel':
        corCard = Colors.grey.shade200;
        break;

        case 'fire':
        corCard = Colors.orange;
        break;

        case 'water':
        corCard = Colors.blue;
        break;

        case 'grass':
        corCard = Colors.green;
        break;

        case 'electric':
        corCard = Colors.yellow;
        break;

        case 'psychic':
        corCard = Colors.pink.shade300;
        break;

        case 'ice':
        corCard = Colors.lightBlue.shade100;
        break;

        case 'dragon':
        corCard = Colors.indigo.shade800;
        break;

        case 'dark':
        corCard = Colors.grey.shade800;
        break;

        case 'fairy':
        corCard = Colors.pink.shade100;
        break;

      }

      return corCard;
    }

    Color _trataCorTipoPokemon(String tipo) {
      Color corCard = Colors.white;

      if(tipo == 'electric') {
        corCard = Colors.black;
      }

      return corCard;
    }

    _selecionarProximoPokemon(BuildContext context) {
      int indiceProximoPokemon = _listaDePokemons.indexWhere((element) => element.pokemonSpecies.name == _nomePokemonSelecionado) + 1;
      PokemonEntry proximoPokemon = _listaDePokemons[indiceProximoPokemon];
      
      Navigator.of(context).pop();
      Navigator.of(context).push(
        CupertinoPageRoute(builder: (context) => DetalhePokemon(proximoPokemon.pokemonSpecies.name, _listaDePokemons)),
      );
  }

    _selecionarPokemonAnterior(BuildContext context) {
      int indicePokemonAnterior = _listaDePokemons.indexWhere((element) => element.pokemonSpecies.name == _nomePokemonSelecionado) - 1;
      if(indicePokemonAnterior <= 0) {
        Navigator.of(context).pop();
      } else {
        PokemonEntry proximoPokemon = _listaDePokemons[indicePokemonAnterior];
        Navigator.of(context).pop();
        Navigator.of(context).push(
          SlideRightRoute(page: DetalhePokemon(proximoPokemon.pokemonSpecies.name, _listaDePokemons)),
      );
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(100),
                  width: 60,
                  child: Image.asset(
                 'assets/images/pokebola.png',
                  fit: BoxFit.contain,
                  height: 100,       
                ),   
              ),
            ],
          ),
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left), 
            onPressed:() => _retornarPaginaAnterior(context), 
          ),
      ),
      body: new FutureBuilder<Pokemon>(
        future: _buscarDetalhesDoPokemon(), // a Future<String> or null
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            
            List<String> imagensPokemon = [];
            imagensPokemon.add(snapshot.data!.sprites.other.officialArtwork.frontDefault);
            

            return Column(
              children: [
                  Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 100, 0),
                      child: Text(
                        'NO' + snapshot.data!.id.toString().toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      snapshot.data!.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 2,
                          color: Cores.vermelhoPrincipal,
                        ),
                        bottom: BorderSide(
                          width: 2,
                          color: Cores.vermelhoPrincipal,
                        )
                      ),
                    ),
                    child: CarroselDetalhePokemon(imagensPokemon),
                  ),
                ),               
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 150, 0),
                      child: Text(
                        "Peso: " + snapshot.data!.weight.toString() + " lbs",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Altura: " +snapshot.data!.height.toString() + " ft",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: snapshot.data!.types.map((tipo)=>  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: SizedBox(
                          width: 70,
                          height: 40,
                          child: Card(
                            color: _trataTipoPokemon(tipo.type.name),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Center(
                              child: 
                                Text(
                                  tipo.type.name.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: _trataCorTipoPokemon(tipo.type.name),
                                  ),
                                )
                              )
                          ),
                      ),
                  )).toList()
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Column(
                    children: [
                      Text('Status Base'),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 20, 0, 10),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Column(
                            children: 
                                 snapshot.data!.stats.map((tipo) => BarraStatusPokemon(tipo)).toList()
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.width - 270, 0, 0),
                  child: Row(   
                    children: [
                      Container(
                        child: SizedBox(
                          width:60,
                          height: 50,
                          child: Center(
                            child: IconButton(
                              splashRadius: 20,
                              padding: EdgeInsets.zero,
                              splashColor: Colors.white,
                              iconSize: 40,
                                icon: Icon(Icons.keyboard_arrow_left),
                                color: Cores.vermelhoPrincipal,
                                onPressed: () => _selecionarPokemonAnterior(context),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(270, 0, 0, 0),
                        child: SizedBox(
                          width:60,
                          height: 50,
                          child: Center(
                            child: IconButton(
                              splashRadius: 20,
                              padding: EdgeInsets.zero,
                              splashColor: Colors.white,
                              iconSize: 40,
                                icon: Icon(Icons.keyboard_arrow_right),
                                color: Cores.vermelhoPrincipal,
                                onPressed:() => _selecionarProximoPokemon(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            );
          } else {
            return Center(child: 
              const CircularProgressIndicator(
                color: Cores.vermelhoPrincipal,
              )
            );
          }
        } 
      )  
    );
  }
}