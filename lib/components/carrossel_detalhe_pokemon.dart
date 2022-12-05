import 'package:flutter/cupertino.dart';

class CarroselDetalhePokemon extends StatefulWidget {

  final List<String> _listaImagens;

  CarroselDetalhePokemon(this._listaImagens);

  @override
  State<CarroselDetalhePokemon> createState() => _CarroselDetalhePokemonState();
}

class _CarroselDetalhePokemonState extends State<CarroselDetalhePokemon> {

  @override
  Widget build(BuildContext context) {

  final List<String> _listaImagens = widget._listaImagens;

    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width - 30,
      child: PageView.builder(
      itemCount: _listaImagens.length,
      pageSnapping: true,
      itemBuilder: (context,pagePosition){
        return Container(
          margin: EdgeInsets.all(10),
          child: Image.network(
            _listaImagens[pagePosition],
            fit: BoxFit.fill,
          ));
      }),
    );
  }
}