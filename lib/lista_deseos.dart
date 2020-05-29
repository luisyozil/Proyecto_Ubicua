import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_ubicua/pages/home.dart';
import 'db.dart' as db;
import 'modelos/Elemento.dart';
import 'modelos/Evento.dart';
import 'modelos/Paquete.dart';
import 'modelos/Promocion.dart';

class ListaDeseos extends StatelessWidget {
  final FirebaseUser usuario;

  ListaDeseos({this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: db.dameElementos(usuario.uid),
        builder: (context, AsyncSnapshot<List<Elemento>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData) {
            return Container(
            );
          } else {
            if (snapshot.data.length > 0) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return StreamBuilder(
                    stream: db.BuscaPaquete(snapshot.data[index].IdPaquete),
                    builder: (context, AsyncSnapshot<Paquete> paquete) {
                      if (paquete.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (paquete.hasData) {
                        return ElementoListaDeseos(
                          paquete: paquete.data,
                          elemento: snapshot.data[index],
                        );
                      } else {
                        return Container(
                        );
                      }
                    },
                  );
                },
              );
            } else {
              return Center(
                child: Container(
                  height: 100,
                  /*decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                  ),*/
                  child: Column(
                    children: <Widget>[
                      Icon(
                        MdiIcons.musicOff,
                        size: 30,
                      ),
                      Text(
                        "No tienes elementos",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "en tu lista",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

class ElementoListaDeseos extends StatelessWidget {
  final Paquete paquete;
  final Elemento elemento;

  ElementoListaDeseos({this.paquete, this.elemento});

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
        stream: db.BuscaEvento(paquete.idEvento),
        builder: (context, AsyncSnapshot<Evento> snapshotevento) {
          if (snapshotevento.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                child: Image.network(snapshotevento.data.imagen),
              ),
              Stack(
                overflow: Overflow.clip,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 140,
                    margin: EdgeInsets.only(top: 10, left: 15),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            snapshotevento.data.nombre,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          margin: EdgeInsets.only(bottom: 6),
                        ),
                        Container(
                          child: Text(paquete.titulo),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                "\$" + paquete.precio.toString(),
                                style: TextStyle(
                                  color: Colors.yellow[600],
                                ),
                              ),
                              StreamBuilder(
                                stream: db.BuscaPromocion(paquete.id),
                                builder: (context, AsyncSnapshot<Promocion> snapshot ){
                                  if(snapshot.connectionState == ConnectionState.waiting){
                                    return CircularProgressIndicator();
                                  }

                                  if(snapshot.hasData){
                                    return Container(
                                      child: Text(
                                        "\$" + snapshot.data.NuevoPrecio.toString(),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            decoration: TextDecoration.lineThrough),
                                      ),
                                    );
                                  }else{
                                    return Container();
                                  }

                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -15,
                    right: -15,
                    child: IconButton(
                      onPressed: (){
                        db.EliminaElemento(elemento.id);
                      },
                      icon: Icon(MdiIcons.close),
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    right: -15,
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage(paquete: paquete, evento: snapshotevento.data,)));
                      },
                      icon: Icon(MdiIcons.cashUsd),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
