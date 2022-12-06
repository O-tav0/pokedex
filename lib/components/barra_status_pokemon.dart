import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi_dart/pokeapi_dart.dart';
import 'package:pokedex/Cores/cores.dart';

class BarraStatusPokemon extends StatelessWidget {

  PokemonStat _status;

  BarraStatusPokemon(this._status);

  Color _trataCorBarraStatus(PokemonStat status) {
      Color cor = Colors.white;
      int valorMinStatus = status.baseStat;
      int valorMaximoStatus = 250;

      double resultado = ((valorMinStatus * 100)/valorMaximoStatus)/100;

      if(resultado > 0 && resultado < 0.20) {
        cor = Cores.vermelhoPrincipal;
      }

      else if(resultado > 0.19 && resultado < 0.30) {
        cor = Colors.lightGreen;
      }

      else if(resultado > 0.29 && resultado < 0.50) {
        cor = Colors.yellow.shade700;
      }

      else if(resultado > 0.49 && resultado < 0.70) {
        cor = Colors.green;
      }

      else if(resultado > 0.71 && resultado < 1) {
        cor = Colors.limeAccent.shade400;
      }

      return cor;
    }

    double _defineTamanhoBarraPreenchido(PokemonStat status) {
      int valorMinStatus = status.baseStat;
      int valorMaximoStatus = 200;

      double resultado = 270 * ((valorMinStatus * 100)/valorMaximoStatus)/100;
      return resultado;
    }

    String trataNomeStatus(String nomeStatus) {
      if(nomeStatus == 'special-attack') {
        return 'SP.ATK';
      }
      else if(nomeStatus == 'special-defense') {
        return 'SP.DEF';
      }
      else {
        return nomeStatus;
      }
    }

  @override
  Widget build(BuildContext context) {
    return Row(
                              children: [
                                SizedBox(
                                  width: 65,
                                  child: Text(
                                        trataNomeStatus(_status.stat.name).toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                ),
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        _status.baseStat.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: 270,
                                      height: 20,
                                      child: Container(
                                        child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(30.0)
                                        ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: _defineTamanhoBarraPreenchido(_status),
                                      height: 20,
                                      child: Container(
                                        child: Card(
                                        color: _trataCorBarraStatus(_status),
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(30.0)
                                        ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
  }
}