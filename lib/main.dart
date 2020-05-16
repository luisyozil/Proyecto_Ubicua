import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/Paquetes.dart';
import 'package:proyecto_ubicua/QuienesSomos.dart';
import 'package:proyecto_ubicua/login2.dart';
import 'package:proyecto_ubicua/paquetes2.dart';
import 'package:proyecto_ubicua/prueba.dart';
import 'Login.dart';
import 'intro.dart';

void main() => runApp(
  MaterialApp(
    themeMode: ThemeMode.dark,

    theme: ThemeData(fontFamily: 'Ubuntu',
        primaryColor: Colors.grey[900],
        accentColor: Colors.yellow[600],
        cursorColor: Colors.yellow[600],
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
    ),
    debugShowCheckedModeBanner: false,
    home: IntroPage(),
  ),
);