import 'package:flutter/material.dart';
import 'package:pokedex/Cores/cores.dart';
import 'package:pokedex/models/regiao_selecionada.dart';

class MenuLateral extends StatelessWidget {

  RegiaoSelecionada _regiaoSelecionada = RegiaoSelecionada.paldea();
  final void Function(RegiaoSelecionada) _setarEstadoHomePage;

  MenuLateral(this._setarEstadoHomePage);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 88,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                height: 20,
                width: 100,
                color: Cores.vermelhoPrincipal,
                padding: EdgeInsets.fromLTRB(0,5,0,0),
                child: Row(
                  children: [ Image.asset(
                    'assets/images/pokebola.png',
                      fit: BoxFit.contain,
                      height: 100,       
                    )
                  ],
                )  
              ),
            ),
          ),
          ExpansionTile(
            collapsedBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            collapsedTextColor: Colors.black,
            textColor: Colors.black,
            iconColor: Colors.black,
            leading: Icon(Icons.cached),
            title: Text("Trocar Região"), 
            children: [ 
              Container( 
                color: Colors.black12,
                padding:EdgeInsets.all(20),
                width: double.infinity,
                child:  Column(
                  children: [
                    ListTile(
                      tileColor: Colors.white,
                      title: Text('Paldea'),
                      onTap: () => trocarRegiao('Paldea', context),
                    ),
                    ListTile(
                      tileColor: Colors.white,
                      title: Text('Galar'),
                      onTap: () => trocarRegiao('Galar', context),
                    ),
                    ListTile(
                      title: Text('Alola'),
                      onTap: () => trocarRegiao('Alola', context),
                    ),
                    ListTile(
                      title: Text('Kalos'),
                      onTap: () => trocarRegiao('Kalos', context),
                    ),
                    ListTile(
                      title: Text('Unova'),
                      onTap: () => trocarRegiao('Unova', context),
                    ),
                    ListTile(
                      title: Text('Sinnoh'),
                      onTap: () => trocarRegiao('Sinnoh', context),
                    ),
                    ListTile(
                      title: Text('Hoenn'),
                      onTap: () => trocarRegiao('Hoenn', context),
                    ),
                    ListTile(
                      title: Text('Johto'),
                      onTap: () => trocarRegiao('Johto', context),
                    ),
                    ListTile(
                      title: Text('Kanto'),
                      onTap: () => trocarRegiao('Kanto', context),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void trocarRegiao(String nomeRegiao, context) {

    switch(nomeRegiao) {
      case 'Kanto':
      _regiaoSelecionada = RegiaoSelecionada.kanto();
      _setarEstadoHomePage(_regiaoSelecionada);
      break;

      case 'Johto':
      _regiaoSelecionada = RegiaoSelecionada.johto();
      _setarEstadoHomePage(_regiaoSelecionada);
      break;

      case 'Hoenn':
      _regiaoSelecionada = RegiaoSelecionada.hoenn();
      _setarEstadoHomePage(_regiaoSelecionada);
      break;

      case 'Sinnoh':
      _regiaoSelecionada = RegiaoSelecionada.sinnoh();
      _setarEstadoHomePage(_regiaoSelecionada);
      break;

      case 'Unova':
      _regiaoSelecionada = RegiaoSelecionada.unova();
      _setarEstadoHomePage(_regiaoSelecionada);
      break;

      case 'Kalos':
      _regiaoSelecionada = RegiaoSelecionada.kalos();
      _setarEstadoHomePage(_regiaoSelecionada);
      break;

      case 'Alola':
      _regiaoSelecionada = RegiaoSelecionada.alola();
      _setarEstadoHomePage(_regiaoSelecionada);
      break;

      case 'Galar':
      _regiaoSelecionada = RegiaoSelecionada.galar();
      _setarEstadoHomePage(_regiaoSelecionada);
      break;

      case 'Paldea':
      _regiaoSelecionada = RegiaoSelecionada.paldea();
      _setarEstadoHomePage(_regiaoSelecionada);
      break;
    }
    Navigator.of(context).pop();
  }
}