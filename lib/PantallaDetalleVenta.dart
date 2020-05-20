import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/modelos/Evento.dart';
import 'package:proyecto_ubicua/paquetes2.dart';
import 'package:shimmer/shimmer.dart';

class PantallaDetalleEvento extends StatelessWidget {
  final Evento evento;

  PantallaDetalleEvento({this.evento});


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Detalles',
            style: TextStyle(color: Color.fromARGB(255, 230, 230, 230),),
          ),
          backgroundColor: Color.fromARGB(255, 45, 45, 45),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4),
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                  boxShadow:[ BoxShadow(
                    blurRadius: 7,
                    spreadRadius: 1,
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),]
              ),
              child: Image.network(evento.imagen, fit: BoxFit.cover,),
            ),
            SizedBox(height: 15.0,),
            Expanded(
              child:ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Center(
                    child: Container(
                      width:MediaQuery.of(context).size.width-20.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('${evento.fecha.day.toString()} / '
                                 '${evento.fecha.month.toString()} / '
                                 '${evento.fecha.year}', style: TextStyle(
                                color: Color.fromARGB(255, 230, 230, 230), fontSize: 22.0),),
                            Text('${evento.nombre}', style: TextStyle(
                                color: Color.fromARGB(255, 230, 230, 230), fontSize: 22.0),),
                            Text('Detalles: ${evento.nombre} : ${evento.descripcion}', style: TextStyle(
                                color: Color.fromARGB(255, 230, 230, 230), fontSize: 20.0),),

                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            bottom: 12,),
          child: SliderPaquetes(),
        ),

      );
  }
}

class SliderPaquetes extends StatefulWidget{
@override
  SliderPaquetesState createState() => SliderPaquetesState();
}

class SliderPaquetesState extends State<SliderPaquetes>{
  var _maxAncho = 0.0;
  var _width = 0.0;
  var _value = 0.0;
  var _select = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context,constraint){
        _maxAncho = constraint.maxWidth;
        return Container(
          height : 60.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:  _select ? <Color>[
                  Colors.black,
                  Colors.blueGrey,
                  Colors.grey,
                ] : <Color>[
                  Colors.yellow[500],
                  Colors.yellow[600],
                  Colors.yellow[700],
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(50),),
            border: Border.all(width: 3,
            color: _select ? Colors.blueGrey :Colors.yellow[600],
            )
          ),
          child: Stack(
            children: <Widget>[
              Center(child: Shimmer.fromColors(
                  child: Text(_select  ? 'Seleccionado' : 'Ver Paquetes',style: TextStyle(fontSize : 22.0)),
                baseColor: Colors.black,
                highlightColor: Colors.grey,
              )),
              AnimatedContainer(duration: Duration(milliseconds: 100),
                width:  _width <= 55 ? 55 : _width,
                child: Row(
                  children: <Widget>[
                  Expanded(child:
                    SizedBox(),),
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
                            borderRadius: BorderRadius.all(Radius.circular(50),)
                        ),
                        child: Icon(Icons.arrow_forward_ios,color: Colors.yellow[600],),
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
        MaterialPageRoute(
            builder: (context) => Paquetes2()
        ),
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


/*
Padding(
padding: EdgeInsets.only(
left: MediaQuery.of(context).size.width*0.1,
right: MediaQuery.of(context).size.width*0.1,
bottom: 12,),

child:  RaisedButton(
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => Paquetes2()
),
);
},
textColor: Colors.white,
color: Colors.black,
padding: const EdgeInsets.all(0.0),
child: Container(
height: 50,
decoration:BoxDecoration(
borderRadius: BorderRadius.circular(20),
gradient: LinearGradient(
colors: <Color>[
Colors.yellow[500],
Colors.yellow[600],
Colors.yellow[700],
],
),
),
padding: const EdgeInsets.only(left:100.0,right: 100, top: 10,bottom: 10 ),
child:
Shimmer.fromColors(
child: Text(
'Paquetes',
style: TextStyle(
fontSize: 21.0,
),
),
baseColor: Colors.black,
highlightColor: Colors.grey,
//loop: 3,
),
),
),
),*/