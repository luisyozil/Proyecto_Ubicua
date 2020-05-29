import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'clipper.dart';
import 'login2.dart';
import 'FadeAnimation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AvisoPrivacidad extends StatefulWidget {
  @override
  _AvisoPrivacidadState createState() => _AvisoPrivacidadState();
}

class _AvisoPrivacidadState extends State<AvisoPrivacidad> {
  var width, height;
  int idx_Title = 2;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(
            color: Color.fromARGB(255, 230, 230, 230),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 45, 45, 45),
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.yellow[600],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Aviso de Privacidad",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.yellow[500],
                  Colors.yellow[600],
                  Colors.yellow[700],
                ],
              ),
            ),
          ),
          Hero(
            tag: 'clipper',
            child: ClipPath(
              clipper: MainClipper(),
              child: Container(
                height: height,
                child: PageView(
                  children: <Widget>[
                    ParteGris(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParteGris extends StatelessWidget {
  var width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children:  <Widget>[
        Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.grey[900],
                Colors.grey[800],
                Colors.grey[700],
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            )),
            child: Container(
              padding: EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "¿Qué Datos Personales Recaba Nuestra Aplicacion y Para Qué Fines es Utilizada?",
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "La información personal que recabamos de nuestros clientes nos ayuda a personalizar y mejorar continuamente su experiencia. Utilizamos esta información para procesar pedidos y servicios, procesar pagos, mantener y actualizar nuestros archivos y sus cuentas con nosotros, hacer disponible contenido tales como listas de deseos. Utilizamos esta información para poder brindar estos servicios y funciones en nuestro propio nombre o por parte de terceros, tales como terceros vendedores. También utilizamos esta información para mejorar nuestros servicios, características y plataforma.",),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "¿Comparten la Información que recibe?",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "La información que tenemos almacenada no es compartida con ningun tercero ageno a nuestra empresa, por lo que puede tener la certeza de su información es privada",),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "¿A qué información tengo acceso?",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Usted tiene acceso a una gran cantidad de información sobre su cuenta para el único propósito de que pueda ver y, en ciertos casos, actualizar, dicha información. Esta lista podrá variar a medida que nuestra página Web se vaya desarrollando.",),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        SizedBox(
          height: 50,
        ),
      ]
    )
    );
  }
}
