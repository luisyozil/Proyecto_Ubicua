import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'PantallaDetalleVenta.dart';
import 'db.dart' as db;
import 'modelos/Evento.dart';

class PantallaNotificaciones_State extends StatefulWidget {
  final List<int> items;
  final FirebaseUser usuario;
  PantallaNotificaciones_State({this.items, this.usuario});

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
    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder(
            stream: db.dameEventos(),
            builder: (context, AsyncSnapshot<List<Evento>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              List<Evento> eventos = snapshot.data;
              eventos.removeWhere(
                      (it) =>
                  it.fecha
                      .difference(DateTime.now())
                      .inDays != 3);
              return eventos.length > 0
                  ? ListView.builder(
                itemCount: eventos.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 6,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        height:
                        (MediaQuery
                            .of(context)
                            .size
                            .height / 6) -
                            10,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.yellow[200],
                              Colors.yellow[400],
                              Colors.yellow[600],
                              Colors.yellow[800],
                            ],
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                width: (MediaQuery
                                    .of(context)
                                    .size
                                    .height /
                                    6) -
                                    20,
                                height: (MediaQuery
                                    .of(context)
                                    .size
                                    .height /
                                    6) -
                                    20,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(
                                      255, 150, 150, 150),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      eventos[index].imagen,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width *
                                    .70,
                                height: (MediaQuery
                                    .of(context)
                                    .size
                                    .height /
                                    6) -
                                    20,
                                decoration: BoxDecoration(
                                  //  color: Color.fromARGB(255, 150, 150, 150),
                                    shape: BoxShape.rectangle),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Shimmer.fromColors(
                                      child: Text(
                                        eventos[index].nombre,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 230, 230, 230),
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                      ),
                                      baseColor: Colors.black,
                                      highlightColor: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Shimmer.fromColors(
                                      child: Text(
                                        "¡No olvides reservar tus boletos para asistir! ",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 230, 230, 230),
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                      ),
                                      baseColor: Colors.black,
                                      highlightColor: Colors.grey,
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
                  );
                },
              )
                  : Align(
                alignment: Alignment.center,
                child: Text(
                  'No hay notificaciones por el momento',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
