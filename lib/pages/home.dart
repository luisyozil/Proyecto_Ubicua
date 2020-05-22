import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/pages/existing-cards.dart';
import 'package:proyecto_ubicua/services/payment-service.dart';
import 'package:progress_dialog/progress_dialog.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override

  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  onItemPress(BuildContext context, int index) async {
    switch(index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExistingCardsPage(),
          ),
        );
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(
      message: 'Por favor espere...'
    );
    await dialog.show();
    var response = await StripeService.payWithNewCard(
      amount: '15000',
      currency: 'USD'
    );
    await dialog.hide();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(response.message),
        duration: new Duration(milliseconds: response.success == true ? 1200 : 3000),
      )
    );
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) {
            Icon icon;
            Text text;

            switch(index) {
              case 0:
                icon = Icon(Icons.add_circle, color: theme.primaryColor);
                text = Text('Pagar con una tarjeta nueva');
                break;
              case 1:
                icon = Icon(Icons.credit_card, color: theme.primaryColor);
                text = Text('Pagar con una tarjeta existente');
                break;
            }

            return InkWell(
              onTap: () {
                onItemPress(context, index);
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
          itemCount: 2
        ),
      ),
    );;
  }
}