import 'package:flutter/material.dart';
import 'PantallaDetalleVenta.dart';

class PantallaNotificaciones_State extends StatefulWidget {
  final List<int> items;
  PantallaNotificaciones_State({this.items});

  @override
  NotificacionesPantalla createState() {
    return NotificacionesPantalla(items: this.items);
  }
}

class CardFormatoGeneral {
  final String rutaImagen;
  final String Titulo;
  final String Descripcion;

  CardFormatoGeneral({this.rutaImagen, this.Titulo, this.Descripcion});
}

class NotificacionesPantalla extends State<PantallaNotificaciones_State> {
  final List<int> items;

  NotificacionesPantalla({this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });
          },
          background: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black),
          child: InkWell(
            child: Container(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Center(
                child: Container(
                  height: (MediaQuery.of(context).size.height / 8) - 10,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                        Color.fromARGB(255, 100, 100, 100),
                        Color.fromARGB(255, 45, 45, 45),
                      ])),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.height / 8) - 20,
                          height: (MediaQuery.of(context).size.height / 8) - 20,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 150, 150, 150),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'img/ImagenFest.jpg',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*.70,
                          height: (MediaQuery.of(context).size.height / 8) - 20,
                          decoration: BoxDecoration(
                              //  color: Color.fromARGB(255, 150, 150, 150),
                              shape: BoxShape.rectangle),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Este es un titulo para el evento numero $item",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 230, 230, 230),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Este es una descripcion del el evento numero $item",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 230, 230, 230),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PantallaDetalleEvento(
                          Nombre: 'Evento $item',
                          DetalleEvento:
                              "Este es una descripcion del el evento numero $item",
                          ImagenEvento: Image.asset(
                            'img/ImagenFest.jpg',
                            height: 160.0,
                            width: 160.0,
                            fit: BoxFit.cover,
                          ),
                        )),
              );
            },
          ),
        );
      },
    );
  }
}
