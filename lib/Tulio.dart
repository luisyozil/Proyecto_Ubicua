import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: perfil(),
  ));
}

class perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(

          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text("Perfil"),

        ),

      ),
      body: ListView(

        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 20,),
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
                            image: new AssetImage('Images/Genghis.jpg')
                        )
                    ),

                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Marco Nuñez")
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("México")
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("         9"+ '\n\n' + "Guardados")
                    ],
                  ),
                  SizedBox(width: 50,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("      999"+ '\n\n' + "Seguidores")
                    ],
                  ),
                  SizedBox(width: 50,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("       0"+ '\n\n' + "Siguiendo")
                    ],
                  ),


                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonBar(
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,

                        child:FlatButton(

                          child: Container(

                            child: Row(
                              children: [


                                Text('Lista de '+ '\n' +'deseos'),

                              ],
                            ),

                          ),
                          color: Colors.white,
                          onPressed: () {



                          },
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,

                        child: FlatButton(

                          child: Container(

                            child: Row(
                              children: [

                                Text('Reseñas'),

                              ],
                            ),

                          ),
                          color: Colors.white,
                          onPressed: () {


                          },
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,

                        child: FlatButton(

                          child: Container(

                            child: Row(
                              children: [

                                Text('Cargas'),

                              ],
                            ),

                          ),
                          color: Colors.white,
                          onPressed: () {

                          },
                        ),
                      ),



                    ],
                  )

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonBar(
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,

                        child:FlatButton(

                          child: Container(

                            child: Row(
                              children: [


                                Text('Mis listas de deseos'),

                              ],
                            ),

                          ),
                          color: Colors.white,
                          onPressed: () {



                          },
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,

                        child: FlatButton(

                          child: Container(

                            child: Row(
                              children: [

                                Text('Listas de deseos seguidas'),

                              ],
                            ),

                          ),
                          color: Colors.white,
                          onPressed: () {


                          },
                        ),
                      ),
                    ],
                  )

                ],
              ),
              Row(
                children: <Widget>[
                  Image.asset("Images/ListaDeseos.png",
                    width: 400,),
                ],
              ),
            ],
          ),

        ],

      ),

    );

  }

}