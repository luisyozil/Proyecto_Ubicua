import 'package:flutter/material.dart';
import 'Login.dart';

void main() => runApp(
  MaterialApp(
    themeMode: ThemeMode.dark,
    theme: ThemeData(fontFamily: 'Proxima_nova',
        primaryColor: Colors.grey[900],
        accentColor: Colors.yellow[600],
        cursorColor: Colors.yellow[600],
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black
    ),
    debugShowCheckedModeBanner: false,
    home: Login(),
  ),
);
