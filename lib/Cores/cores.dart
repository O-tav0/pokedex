import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Cores {
  Cores._();
  static const _vermelho = 0xFFDF1010;

  static const MaterialColor vermelhoPrincipal = const MaterialColor(
    _vermelho,
    const <int, Color>{
      500:  const Color(_vermelho),
    },
  );

  //static const Vermelho =  MaterialColor(primary, swatch) Color(0xFFDF1010);
}
