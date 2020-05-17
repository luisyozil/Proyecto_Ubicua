import 'package:flutter/cupertino.dart';
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
                child: InkWell(
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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180.0,
                    decoration:
                    BoxDecoration(
                      color: Colors.grey[900],
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter:
                        ColorFilter.mode(Colors.black.withOpacity(0.4),
                            BlendMode.dstATop),
                        image: new AssetImage(
                          'img/edc.jpg',
                        ),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "EDC México",
                                  style: TextStyle(fontSize: 25.0, color: Colors.white,fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    Text(
                                      " Ciudad de México",
                                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    Text(
                                      " 28 Marzo 2020",
                                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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

