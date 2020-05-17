import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'PantallaDetalleVenta.dart';

class PantallaEventos extends StatelessWidget {
  final List<int> items;

  PantallaEventos({this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text('10 resultados de eventos cercanos.',style: TextStyle(color: Color.fromARGB(255, 230, 230, 230),)),
          Expanded(
            child:ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          PantallaDetalleEvento(
                            Nombre: 'Evento $item',
                            DetalleEvento: "Este es una descripcion del el evento numero $item",
                            ImagenEvento: Image.asset('img/ImagenFest.jpg',
                              fit: BoxFit.cover,),)),);
                  },
                  child: EventoBuilder(context, index,item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget EventoBuilder(BuildContext context, int idx,int item)
{
  return Container(
    padding: EdgeInsets.all(12),
    height:250.0,
    child:Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height:250.0,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20),),
                image: DecorationImage(
                  image: ExactAssetImage('img/ImagenFest.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow:[ BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 230, 230, 230),
                ),]
            ),
            child: Stack(
              fit:StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black87,
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height:200.0,
            padding: EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.circular(20),),

                boxShadow:[ BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 230, 230, 230),
                ),]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Titulo Evento $item',style: TextStyle(
                  color: Color.fromARGB(255, 230, 230, 230),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                )),
                SizedBox(height: 10.0,),
                Row(children: <Widget>[
                  RatingBar(
                    onRatingUpdate: (v){},
                    initialRating: 5,
                    itemSize: 13.0,
                    itemBuilder: (context,index) => Icon(Icons.star,
                      color: Colors.amberAccent,),
                  ),
                  Text(' + 1234',
                      style: TextStyle(
                        color: Color.fromARGB(255, 230, 230, 230),
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                      )),
                ],),
                Row(
                  children: <Widget>[
                    Container(
                      width:25.0,
                      height:25.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('img/profile_1.jpg'),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    Container(
                      width:25.0,
                      height:25.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('img/profile_2.jpg'),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    Container(
                      width:25.0,
                      height:25.0,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child:Center(
                        child: Text('+25'),
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: <Widget>[
                    Container( padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(255, 255, 204, 0),
                      ),
                      child: Text('Fecha',
                        style: TextStyle(
                          color: Color.fromARGB(255, 50, 50, 50),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,),),
                    ),
                    Container( padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(255, 255, 204, 0),
                      ),
                      child: Text('Categoria 1',
                        style: TextStyle(
                          color: Color.fromARGB(255, 50, 50, 50),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,),),
                    ),
                    Container( padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(255, 255, 204, 0),
                      ),
                      child: Text('Categoria 2',
                        style: TextStyle(
                          color: Color.fromARGB(255, 50, 50, 50),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,),),
                    ),
                    Container( padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(255, 255, 204, 0),
                      ),
                      child: Text('Categoria 3',
                        style: TextStyle(
                          color: Color.fromARGB(255, 50, 50, 50),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

