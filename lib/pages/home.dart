import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/modelos/Evento.dart';
import 'package:proyecto_ubicua/modelos/Paquete.dart';
import 'package:proyecto_ubicua/modelos/Promocion.dart';
import 'package:proyecto_ubicua/pages/existing-cards.dart';
import 'package:proyecto_ubicua/services/payment-service.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:proyecto_ubicua/db.dart' as db;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_ubicua/PantallaAyuda.dart';
import 'package:progress_dialog/progress_dialog.dart';

class HomePage extends StatefulWidget {
  final Evento evento;
  final Paquete paquete;
  HomePage({this.paquete, this.evento});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  onItemPress(BuildContext context, int index, int cantidad) async {
    switch (index) {
      case 0:
        payViaNewCard(context, cantidad);
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExistingCardsPage(
              cantidad: cantidad,
            ),
          ),
        );
        break;
    }
  }

  payViaNewCard(BuildContext context, int cantidad) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Por favor espere...');
    await dialog.show();
    var response = await StripeService.payWithNewCard(
        amount: cantidad.toString(), currency: 'USD');
    await dialog.hide();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration:
          new Duration(milliseconds: response.success == true ? 12000 : 100000),
    ));
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pago'),
      ),
      body: ListView(
        children: <Widget>[
          StreamBuilder(
            stream: db.BuscaPromocion(widget.paquete.id),
            builder: (context, AsyncSnapshot<Promocion> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              //Si no hay promociones entonces manda el precio original del paquete
              if (!snapshot.hasData) {
                return Container(
                  height: 150,
                  padding: EdgeInsets.all(20),
                  child: ListView.separated(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      Icon icon;
                      Text text;

                      switch (index) {
                        case 0:
                          icon =
                              Icon(Icons.add_circle, color: theme.primaryColor);
                          text = Text('Pagar con una tarjeta nueva');
                          break;
                      }

                      return InkWell(
                        onTap: () {
                          onItemPress(context, index, widget.paquete.precio);
                        },
                        child: ListTile(
                          title: text,
                          leading: icon,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: theme.primaryColor,
                    ),
                  ),
                );
              } //si hay alguna promocion entonces la muestra
              else {
                return Container(
                  height: 150,
                  padding: EdgeInsets.all(20),
                  child: ListView.separated(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      Icon icon;
                      Text text;

                      switch (index) {
                        case 0:
                          icon =
                              Icon(Icons.add_circle, color: theme.primaryColor);
                          text = Text('Pagar con una tarjeta nueva');
                          break;

                      }

                      return InkWell(
                        onTap: () {
                          onItemPress(
                              context, index, snapshot.data.NuevoPrecio);
                        },
                        child: ListTile(
                          title: text,
                          leading: icon,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: theme.primaryColor,
                    ),
                  ),
                );
              }
            },
          ),
          Articulo(
            paquete: widget.paquete,
            evento: widget.evento,
          ),
        ],
      ),
    );
    ;
  }
}

class Articulo extends StatelessWidget {
  final Evento evento;
  final Paquete paquete;

  Articulo({this.paquete, this.evento});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db.BuscaPromocion(paquete.id),
      builder: (context, AsyncSnapshot<Promocion> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasData) {
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
                                child: Text(
                                  "\$" + paquete.precio.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
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
        else{
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
                                child: Text(
                                  "\$" + paquete.precio.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
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
      },
    );
  }
}
