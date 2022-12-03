import 'package:flutter/material.dart';
import 'package:pokedex/Cores/cores.dart';

class MenuLateral extends StatelessWidget {
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
            title: Text("Trocar Região"), //header title
            children: [ 
              Container( 
                color: Colors.black12,
                padding:EdgeInsets.all(20),
                width: double.infinity,
                child:  Column(
                  children: [
                    ListTile(
                      title: Text('Paldea'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      tileColor: Colors.white,
                      title: Text('Galar'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      title: Text('Alola'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      title: Text('Kalos'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      title: Text('Unova'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      title: Text('Sinnoh'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      title: Text('Hoenn'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      title: Text('Johto'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      title: Text('Kanto'),
                      onTap: () => {Navigator.of(context).pop()},
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
}