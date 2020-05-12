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

        return Column(
          children: <Widget>[
            SizedBox(height:8.0),
            Material(
              color: Colors.black,
              child: Ink(
                height: (MediaQuery.of(context).size.height / 4) - 10,
                decoration: BoxDecoration(
                  color: Colors.black,
                    border: Border.all(
                      color: Color.fromARGB(255, 255, 204, 0),
                      width :2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: InkWell(
                  splashColor: Color.fromARGB(100, 255, 204, 0),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          PantallaDetalleEvento(
                            Nombre: 'Evento $item',
                            DetalleEvento: "Este es una descripcion del el evento numero $item",
                            ImagenEvento: Image.asset('img/ImagenFest.jpg',
                              height: 160.0,
                              width: 160.0,
                              fit: BoxFit.cover,),)),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5.0,),
                      Container(
                        width: (MediaQuery.of(context).size.height / 4) - 30,
                        height: (MediaQuery.of(context).size.height / 4) - 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('img/ImagenFest.jpg',
                              ),
                            ),
                           color: Colors.black,
                            border: Border.all(
                              color: Color.fromARGB(255, 255, 204, 0),
                              width :2.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      Container(
                        width: MediaQuery.of(context).size.width - 154.0,
                        height: (MediaQuery.of(context).size.height / 4) - 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Este es un titulo para el evento numero $item",
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 230, 230, 230),),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(width: 5.0,),
                            Text(
                              "Este es una descripcion del el evento numero $item",
                              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 230, 230, 230),),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                          ],),
                      ),
                      SizedBox(width: 5.0,),
                    ],
                  ), // other widget
                ),
              ),
            ),
            SizedBox(height:8.0),
          ],
        );
      },
    );
  }
}


class PantallaEventos2 extends StatelessWidget {
  final List<int> items;

  PantallaEventos2({this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return
          Column(
            children: <Widget>[
              SizedBox(height:10.0),
              Material(
                child: Ink(
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
                  child: InkWell(
                    splashColor: Colors.black54,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            PantallaDetalleEvento(
                              Nombre: 'Evento $item',
                              DetalleEvento: "Este es una descripcion del el evento numero $item",
                              ImagenEvento: Image.asset('img/ImagenFest.jpg',
                                height: 160.0,
                                width: 160.0,
                                fit: BoxFit.cover,),)),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 5.0,),
                        Container(
                          width: (MediaQuery.of(context).size.height / 5) - 20,
                          height: (MediaQuery.of(context).size.height / 5) - 20,
                          decoration: BoxDecoration(
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
                              shape: BoxShape.rectangle
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Este es un titulo para el evento numero $item",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 230, 230, 230),),
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                "Este es una descripcion del el evento numero $item",
                                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 230, 230, 230),),
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                            ],),
                        ),
                        SizedBox(width: 5.0,),
                      ],
                    ), // other widget
                  ),
                ),
              ),
              SizedBox(height:10.0),
            ],
          );
      },
    );
  }
}

