import 'package:flutter/material.dart';
import 'PantallaDetalleVenta.dart';

class PantallaEventos extends StatelessWidget {
  final List<int> items;

  PantallaEventos({this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return InkWell(
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Center(
              child: Container(
                height: (MediaQuery.of(context).size.height / 5) - 10,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color.fromARGB(255, 150, 150, 150),
                          Color.fromARGB(255, 100, 100, 100),
                          Color.fromARGB(255, 50, 50, 50),
                        ])),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5.0,),
                      Container(
                        width: (MediaQuery.of(context).size.height / 5) - 20,
                        height: (MediaQuery.of(context).size.height / 5) - 20,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 150, 150, 150),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('img/ImagenFest.jpg',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Container(
                        width: MediaQuery.of(context).size.width - 140.0,
                        height: (MediaQuery.of(context).size.height / 5) - 20,
                        decoration: BoxDecoration(
                          //  color: Color.fromARGB(255, 150, 150, 150),
                            shape: BoxShape.rectangle
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Text(
                            "Este es un titulo para el evento numero $item",
                            style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.bold,color: Color.fromARGB(255, 230, 230, 230),),
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                          ),
                            SizedBox(width: 5.0,),
                            Text(
                            "Este es una descripcion del el evento numero $item",
                            style: TextStyle(fontSize: 13.0,fontWeight:FontWeight.bold,color: Color.fromARGB(255, 230, 230, 230),),
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                          ),
                        ],),
                      ),
                      SizedBox(width: 5.0,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PantallaDetalleEvento(
                Nombre:'Evento $item',
                DetalleEvento:"Este es una descripcion del el evento numero $item",
                ImagenEvento: Image.asset('img/ImagenFest.jpg',
                  height: 160.0, width: 160.0, fit: BoxFit.cover,),)),
            );
          },
        );
      },
    );
  }
}

