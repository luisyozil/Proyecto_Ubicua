import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/QuienesSomos.dart';
import 'PantallaCondiciones.dart';
import 'package:flutter/cupertino.dart';

class PantallaAyuda extends StatelessWidget {
  final List<int> items;

  PantallaAyuda({this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage('Images/ayuda.png'))),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 255, 204, 0),
                        spreadRadius: 2),
                  ],
                ),
                child: FlatButton(
                  splashColor: Color.fromARGB(125, 255, 204, 0),
                  onPressed: () {},
                  child: Text(
                    'Preguntas Frecuentes',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 255, 204, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 255, 204, 0),
                        spreadRadius: 2),
                  ],
                ),
                child: FlatButton(
                  splashColor: Color.fromARGB(125, 255, 204, 0),
                  onPressed: () {},
                  child: Text(
                    'Contacto',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 255, 204, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 255, 204, 0),
                        spreadRadius: 2),
                  ],
                ),
                child: FlatButton(
                  splashColor: Color.fromARGB(125, 255, 204, 0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuienesSomos()),
                    );
                  },
                  child: Text(
                    'Quienes Somos',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 255, 204, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 255, 204, 0),
                        spreadRadius: 2),
                  ],
                ),
                child: FlatButton(
                  splashColor: Color.fromARGB(125, 255, 204, 0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PantallaCondiciones()));
                  },
                  child: Text(
                    'Términos y Condiciones',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 255, 204, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 255, 204, 0),
                        spreadRadius: 2),
                  ],
                ),
                child: FlatButton(
                  splashColor: Color.fromARGB(125, 255, 204, 0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PantallaCondiciones()));
                  },
                  child: Text(
                    'Privacidad y Seguridad',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 255, 204, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
            ],
          ),
        ],
      ),
    );
  }
}
