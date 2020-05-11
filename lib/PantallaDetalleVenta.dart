import 'package:flutter/material.dart';


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
            ]
        ),
      ),
    );
  }
}