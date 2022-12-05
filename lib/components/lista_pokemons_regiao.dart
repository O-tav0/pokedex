import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Cores/cores.dart';
import 'package:pokedex/components/detalhes_pokemon.dart';
import 'package:pokedex/components/menu_lateral.dart';
import 'package:pokedex/models/regiao_selecionada.dart';
import 'package:pokeapi_dart/pokeapi_dart.dart';


class ListaPokemonsRegiao extends StatefulWidget {

  RegiaoSelecionada _regiaoSelecionada;
  ListaPokemonsRegiao(this._regiaoSelecionada);
  
  @override
  _ListaPokemonsRegiaoState createState() => _ListaPokemonsRegiaoState();
}

class _ListaPokemonsRegiaoState extends State<ListaPokemonsRegiao> {
  final GlobalKey<ScaffoldState> _sccafold = GlobalKey();

  List<PokemonEntry> _listaPokemon = [];
  final api = PokeApi();

  selecionarRegiao(RegiaoSelecionada regiao) {
    setState(() {
      widget._regiaoSelecionada = regiao;
      _listaPokemon.clear();
      buscarPokemonsDaRegiao();
    });
  }
  
  Future<Pokedex>buscarPokemonsDaRegiao() {
    int nrRegiao = widget._regiaoSelecionada.numero;
    return PokeApi().pokedexes.get(id: nrRegiao);
  }

  _navegarDetalhesPokemon(BuildContext context, String nomePokemon) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return DetalhePokemon(nomePokemon);
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    buscarPokemonsDaRegiao();
    return Scaffold(
      key: _sccafold,
      drawer: MenuLateral(selecionarRegiao),
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
            icon: Icon(Icons.menu), 
            onPressed: () => _sccafold.currentState!.openDrawer(), 
          ),
      ),
      body: new FutureBuilder<Pokedex>(
        future: buscarPokemonsDaRegiao(), // a Future<String> or null
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            Pokedex ?pokedex = snapshot.data;
            List<PokemonEntry> pokemonsDaRegiao = pokedex!.pokemonEntries;

            return ListView.builder(
      
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8),
                    itemCount: pokemonsDaRegiao.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                      children: [
                        Card(
                            shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Cores.vermelhoPrincipal,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10.0)
                            ),
                            elevation: 10,
                            child:
                            InkWell(
                              splashColor: Colors.redAccent[100],
                              onTap: () => _navegarDetalhesPokemon(context, pokemonsDaRegiao[index].pokemonSpecies.name),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Cores.vermelhoPrincipal,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(10.0)
                              ),
                                tileColor: Colors.white,
                                title: Text(pokemonsDaRegiao[index].entryNumber.toString() + " " + pokemonsDaRegiao[index].pokemonSpecies.name.toUpperCase()),
                                trailing: Icon(Icons.keyboard_arrow_right),
                              ),
                            ),                                               
                          ),
                        ],
                      ); 
                  }
                );
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      )
    );
  }
}