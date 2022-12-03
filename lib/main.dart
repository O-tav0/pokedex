import 'package:flutter/material.dart';
import 'package:pokedex/components/menu_lateral.dart';
import 'package:pokedex/cores/cores.dart';
import 'package:pokedex/models/pokemons_capturados.dart';
import 'package:pokedex/models/regiao_selecionada.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final ThemeData tema = ThemeData();

    @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
 
    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Cores.vermelhoPrincipal,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Cores.vermelhoPrincipal
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<PokemonsCapturados> _capturadosRecentemente = [
    PokemonsCapturados.turtwig(),
    PokemonsCapturados.aggron(),
    PokemonsCapturados.glalie(),
    PokemonsCapturados.luxray(),
    PokemonsCapturados.rayquaza() 
  ];
  
  RegiaoSelecionada _regiaoSelecionada = RegiaoSelecionada.paldea();
 
  selecionarRegiao(RegiaoSelecionada regiao) {
    setState(() {
      _regiaoSelecionada = regiao;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _sccafold = GlobalKey();
    
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
             margin: EdgeInsets.all(20), 
             child: Text(
              'Pokédex',
                style: TextStyle(
                  fontSize: 20
                ),
              ),   
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 15),
                    child: Column(
                    children: [
                      Text(
                        _regiaoSelecionada.nome,
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                      Image.asset(
                        _regiaoSelecionada.imagem,
                        fit: BoxFit.none,
                        height: 200,
                        width: 180       
                      ),
                    ],
                  ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 135),
                        child: Row(
                        children: [
                          Image.asset(
                            'assets/images/pokebola.png',
                            fit: BoxFit.fill,
                            height: 20,
                            width: 25       
                          ),
                          Text('Capturados: 0'),
                        ],
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Row(
                        children: [
                          Image.asset(
                            'assets/images/batalhados.png',
                            fit: BoxFit.fill,
                            height: 15,
                            width: 20       
                          ),
                          Text('Batalhados: 0'),
                        ],
                      ),
                      ),
                    ],
                  ),
                ]
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  alignment: Alignment.centerLeft,
                  child: Text('Capturados Recentemente',
                  style: TextStyle(
                    fontSize: 18
                  ),)
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: _capturadosRecentemente.length,
                    itemBuilder: (BuildContext context, int index) {
                       return 
                       Column(
                        children: [
                          Text('No.' + _capturadosRecentemente[index].numero.toString()),
                       Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: 200,
                        height: 200,
                        child: Card(                          
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Cores.vermelhoPrincipal,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          elevation: 10,
                           child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child:                              
                                Image.asset(
                                    _capturadosRecentemente[index].imagem,
                                    fit: BoxFit.fill,
                                    height: 150.0,
                                    width: 100.0,
                                ) 
                          )
                           
                        ),                      
                      ),   

                        ],
                       );
                    }
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
