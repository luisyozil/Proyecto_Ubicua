import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/modelos/Evento.dart';
import 'package:proyecto_ubicua/modelos/Paquete.dart';
import 'package:proyecto_ubicua/modelos/Promocion.dart';
import 'package:proyecto_ubicua/pages/existing-cards.dart';
import 'package:proyecto_ubicua/services/payment-service.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:proyecto_ubicua/db.dart' as db;

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
        payViaNewCard(context,  cantidad);
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExistingCardsPage(cantidad: cantidad,),
          ),
        );
        break;
    }
  }

  payViaNewCard(BuildContext context, int cantidad) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Por favor espere...');
    await dialog.show();
    var response =
        await StripeService.payWithNewCard(amount: cantidad.toString(), currency: 'USD');
    await dialog.hide();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration:
          new Duration(milliseconds: response.success == true ? 1200 : 3000),
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
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2)),
                  padding: EdgeInsets.all(20),
                  child: ListView.separated(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      Icon icon;
                      Text text;

                      switch (index) {
                        case 0:
                          icon =
                              Icon(Icons.add_circle, color: theme.primaryColor);
                          text = Text('Pagar con una tarjeta nueva');
                          break;
                        case 1:
                          icon = Icon(Icons.credit_card,
                              color: theme.primaryColor);
                          text = Text('Pagar con una tarjeta existente');
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
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2)),
                  padding: EdgeInsets.all(20),
                  child: ListView.separated(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      Icon icon;
                      Text text;

                      switch (index) {
                        case 0:
                          icon =
                              Icon(Icons.add_circle, color: theme.primaryColor);
                          text = Text('Pagar con una tarjeta nueva');
                          break;
                        case 1:
                          icon = Icon(Icons.credit_card,
                              color: theme.primaryColor);
                          text = Text('Pagar con una tarjeta existente');
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
        ],
      ),
    );
    ;
  }
}
