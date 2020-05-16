import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/paquetes2.dart';


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
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('El nombre del evento es :  $Nombre', style: TextStyle(
                  color: Color.fromARGB(255, 230, 230, 230), fontSize: 22.0),),
              Text('Detalles: Los detalles de $Nombre consta de  .............', style: TextStyle(
                  color: Color.fromARGB(255, 230, 230, 230), fontSize: 20.0),),
              this.ImagenEvento,
              RaisedButton(
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
                  const Text('Paquetes', style: TextStyle(fontSize: 21)),
                ),
              ),
            ]
        ),
      ),

    );
  }
}