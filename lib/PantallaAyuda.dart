import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/intro.dart';
import 'clipper.dart';
import 'CardItemModel.dart';
import 'Login.dart';
import 'FadeAnimation.dart';
import 'PantallaInicio.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'QuienesSomos.dart';
import 'PantallaCondiciones.dart';


class PantallaAyuda extends StatefulWidget{
  @override
  _PantallaAyuda createState() => _PantallaAyuda();
}

class _PantallaAyuda extends State<PantallaAyuda>{
  var width, height;



  int idx_Title = 2;
  //static final GlobalKey<FormState> user = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    double c_width = MediaQuery.of(context).size.width*0.9;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:
        Stack(
          children: <Widget>[
            _preguntas(height),
            Hero(
              tag: 'clipper',
              child: ClipPath(
                clipper: MainClipper(),
                child: Container(
                    height: height * .35,
                    alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow[500],
                          Colors.yellow[600],
                          Colors.yellow[700],
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                      )),
                  child: Image.asset(
                    "img/Ayuda.png",
                    width: width * .9,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _preguntas(height){

    return Material(
      //key:user,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
          child: Padding(
            padding: EdgeInsets.only(top: height*.38-60),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width*.93,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(color: Color.fromARGB(255, 255, 204, 0), spreadRadius: 2),
                            ],
                          ),
                          child: FlatButton(
                            splashColor: Color.fromARGB(125, 255, 204, 0),
                            onPressed: (){

                            },
                            child: Text('Preguntas Frecuentes',style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 255, 204, 0),),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width*.93,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(color: Color.fromARGB(255, 255, 204, 0), spreadRadius: 2),
                            ],
                          ),
                          child: FlatButton(
                            splashColor: Color.fromARGB(125, 255, 204, 0),
                            onPressed: (){

                            },
                            child: Text('Contacto',style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 255, 204, 0),),),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width*0.93,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(color: Color.fromARGB(255, 255, 204, 0), spreadRadius: 2),
                            ],
                          ),
                          child: FlatButton(
                            splashColor: Color.fromARGB(125, 255, 204, 0),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaCondiciones()));
                            },
                            child: Text('Términos y Condiciones',style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 255, 204, 0),),),
                          ),

                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width*.93,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(color: Color.fromARGB(255, 255, 204, 0), spreadRadius: 2),
                            ],
                          ),
                          child: FlatButton(
                            splashColor: Color.fromARGB(125, 255, 204, 0),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuienesSomos()
                                ),
                              );
                            },
                            child: Text('Quienes Somos',style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 255, 204, 0),),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width*.93,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(color: Color.fromARGB(255, 255, 204, 0), spreadRadius: 2),
                            ],
                          ),
                          child: FlatButton(
                            splashColor: Color.fromARGB(125, 255, 204, 0),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaCondiciones()));
                            },
                            child: Text('Privacidad y Seguridad',style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 255, 204, 0),),),
                          ),
                        ),
                      ],
                    ),

                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
