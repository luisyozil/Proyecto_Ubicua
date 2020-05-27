import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_ubicua/PantallaDetalleVenta.dart';
import 'package:proyecto_ubicua/pages/home.dart';
import 'db.dart' as db;
import 'modelos/Evento.dart';
import 'modelos/Paquete.dart';
import 'modelos/Promocion.dart';

class Promociones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db.damePromociones(),
      builder: (context, AsyncSnapshot<List<Promocion>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (!snapshot.hasData) return Text("No hay datos");

        return ListView.builder(
          padding: EdgeInsets.only(left: 30),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return ElementoPromocion(
              promocion: snapshot.data[index],
            );
          },
        );
      },
    );
  }
}

class ElementoPromocion extends StatelessWidget {
  final Promocion promocion;

  ElementoPromocion({this.promocion});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor.withOpacity(.4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: StreamBuilder(
        stream: db.BuscaPaquete(promocion.idPaquete),
        builder: (context, AsyncSnapshot<Paquete> snapshotpaquete) {
          if (snapshotpaquete.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshotpaquete.hasData) {
            return Text("No hay datos en paquetes");
          }

          return StreamBuilder(
            stream: db.BuscaEvento(snapshotpaquete.data.idEvento),
            builder: (context, AsyncSnapshot<Evento> snapshotevento) {
              if (snapshotevento.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage(evento: snapshotevento.data, paquete: snapshotpaquete.data,)));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      child: Image.network(snapshotevento.data.imagen),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(MdiIcons.checkDecagram),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Container(
                                      child: Text(
                                        snapshotevento.data.nombre,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.only(bottom: 6),
                            ),
                            Container(
                              child: Text(snapshotpaquete.data.titulo),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "\$" + promocion.NuevoPrecio.toString(),
                                    style: TextStyle(
                                        color: Colors.yellow[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  child: Text(
                                    snapshotpaquete.data.precio.toString(),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Text(
                                "Termina: " + promocion.Fecha,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
