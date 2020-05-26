import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/modelos/Evento.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:proyecto_ubicua/paquetes2.dart';
import 'package:shimmer/shimmer.dart';

class PantallaDetalleEvento extends StatelessWidget {
  final Evento evento;
  final FirebaseUser usuario;
  double StarValue;

  PantallaDetalleEvento({this.evento, this.usuario});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Detalles',
          style: TextStyle(
            color: Color.fromARGB(255, 230, 230, 230),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 45, 45, 45),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            child: Container(
              padding: EdgeInsets.all(4),
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 1,
                      color: Color.fromARGB(255, 230, 230, 230),
                    ),
                  ]),
              child: Image.network(
                evento.imagen,
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.45,
              minChildSize: 0.45,
              maxChildSize: 0.8,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: 25,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 45, 45, 45),
                                  Color.fromARGB(255, 30, 30, 30),
                                  Color.fromARGB(255, 15, 15, 15),
                                  Color.fromARGB(255, 0, 0, 0),
                                ]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                                child: Icon(MdiIcons.dragHorizontal,
                                    color: Colors.white)),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Text(
                                '${evento.nombre}',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 230, 230, 230),
                                    fontSize: 22.0),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Text(
                                evento.Fecha,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 230, 230, 230),
                                    fontSize: 18.0),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Text(
                                '${evento.descripcion}',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 230, 230, 230),
                                    fontSize: 18.0),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 35.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: ExactAssetImage(
                                            'img/profile_1.jpg'),
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                  ),
                                  Container(
                                    width: 35.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: ExactAssetImage(
                                            'img/profile_2.jpg'),
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Color.fromARGB(255, 75, 75, 75),
                                    ),
                                    child: Text(
                                      '+${evento.interesados}',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 230, 230, 230),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ' les interesa asistir',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 230, 230, 230),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Text(
                                'Categorias:',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 230, 230, 230),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Wrap(
                                children: evento.Categoria.split(
                                        ',') // split the text into an array
                                    .map(
                                      (String categoria) => Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color:
                                              Color.fromARGB(255, 255, 204, 0),
                                        ),
                                        child: Text(
                                          categoria,
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 50, 50, 50),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ) // put the text inside a widget
                                    .toList(), // convert the iterable to a list
                              ),
                            ),
                            SizedBox(height: 25.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          bottom: 12,
        ),
        child: SliderPaquetes(evento, usuario),
      ),
    );
  }
}

class SliderPaquetes extends StatefulWidget {
  final Evento evento;
  final FirebaseUser usuario;
  SliderPaquetes(this.evento, this.usuario);

  @override
  SliderPaquetesState createState() => SliderPaquetesState();
}

class SliderPaquetesState extends State<SliderPaquetes> {
  var _maxAncho = 0.0;
  var _width = 0.0;
  var _value = 0.0;
  var _select = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        _maxAncho = constraint.maxWidth;
        return Container(
          height: 60.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _select
                    ? <Color>[
                        Colors.black,
                        Colors.blueGrey,
                        Colors.grey,
                      ]
                    : <Color>[
                        Colors.yellow[500],
                        Colors.yellow[600],
                        Colors.yellow[700],
                      ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              border: Border.all(
                width: 3,
                color: _select ? Colors.blueGrey : Colors.yellow[600],
              )),
          child: Stack(
            children: <Widget>[
              Center(
                  child: Shimmer.fromColors(
                child: Text(_select ? 'Seleccionado' : 'Ver Paquetes',
                    style: TextStyle(fontSize: 22.0)),
                baseColor: Colors.black,
                highlightColor: Colors.grey,
              )),
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: _width <= 55 ? 55 : _width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onVerticalDragUpdate: _onDrag,
                      onVerticalDragEnd: _onEnd,
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.black,
                                Colors.black87,
                                Colors.black54,
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            )),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.yellow[600],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _onDrag(DragUpdateDetails details) {
    setState(() {
      _value = (details.globalPosition.dx) / _maxAncho;
      _width = _maxAncho * _value;
    });
  }

  void _onEnd(DragEndDetails details) {
    if (_value > 0.9) {
      _value = 1;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Paquetes2(evento: widget.evento, usuario: widget.usuario,)),
      );
      _value = 0;
    } else {
      _value = 0;
    }
    setState(() {
      _width = _maxAncho * _value;
      _select = _value > 0.9;
    });
  }
}
