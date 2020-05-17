import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/paquetes2.dart';
import 'package:shimmer/shimmer.dart';

class PantallaDetalleEvento extends StatelessWidget {
  final String Nombre;
  final String DetalleEvento;
  final Widget ImagenEvento;

  PantallaDetalleEvento({this.Nombre, this.DetalleEvento, this.ImagenEvento});


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Detalles del evento $Nombre',
          style: TextStyle(color: Color.fromARGB(255, 230, 230, 230),),
        ),
        backgroundColor: Color.fromARGB(255, 45, 45, 45),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20),),
                boxShadow:[ BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 230, 230, 230),
                ),]
            ),
            child: this.ImagenEvento,
          ),
          SizedBox(height: 15.0,),
          Expanded(
            child:ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Center(
                  child: Container(
                    width:MediaQuery.of(context).size.width-20.0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('El nombre del evento es :  $Nombre', style: TextStyle(
                              color: Color.fromARGB(255, 230, 230, 230), fontSize: 22.0),),
                          Text('Detalles: Los detalles de $Nombre consta de  .............', style: TextStyle(
                              color: Color.fromARGB(255, 230, 230, 230), fontSize: 20.0),),

                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*0.1,
          right: MediaQuery.of(context).size.width*0.1,
          bottom: 12,),
        child:  RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Paquetes2()
              ),
            );
          },
          textColor: Colors.white,
          color: Colors.black,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            height: 50,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.yellow[500],
                  Colors.yellow[600],
                  Colors.yellow[700],
                ],
              ),
            ),
            padding: const EdgeInsets.only(left:100.0,right: 100, top: 10,bottom: 10 ),
            child:
            Shimmer.fromColors(
              child: Text(
                'Paquetes',
                style: TextStyle(
                  fontSize: 21.0,
                ),
              ),
              baseColor: Colors.black12,
              highlightColor: Colors.white,
              //loop: 3,
            ),
          ),
        ),
      ),

    );
  }
}