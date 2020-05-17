import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'PantallaDetalleVenta.dart';

class PantallaEventos extends StatelessWidget {
  final List<int> items;

  PantallaEventos({this.items});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Column(
          children: <Widget>[
            SizedBox(height:8.0),
            Material(
              color: Colors.black,
              child: Ink(
                height: (MediaQuery.of(context).size.height / 4) - 10,
                decoration: BoxDecoration(
                  color: Colors.black,
                    border: Border.all(
                      color: Color.fromARGB(255, 255, 204, 0),
                      width :2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: InkWell(
                  splashColor: Color.fromARGB(100, 255, 204, 0),
                  onTap: () {
=======
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
>>>>>>> Stashed changes
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                        PantallaDetalleEvento(
                          Nombre: 'Evento $item',
                          DetalleEvento: "Este es una descripcion del el evento numero $item",
                          ImagenEvento: Image.asset('img/ImagenFest.jpg',
                            fit: BoxFit.cover,),)),);
                  },
<<<<<<< Updated upstream
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5.0,),
                      Container(
                        width: (MediaQuery.of(context).size.height / 4) - 30,
                        height: (MediaQuery.of(context).size.height / 4) - 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('img/ImagenFest.jpg',
                              ),
                            ),
                           color: Colors.black,
                            border: Border.all(
                              color: Color.fromARGB(255, 255, 204, 0),
                              width :2.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      Container(
                        width: MediaQuery.of(context).size.width - 154.0,
                        height: (MediaQuery.of(context).size.height / 4) - 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Este es un titulo para el evento numero $item",
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 230, 230, 230),),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(width: 5.0,),
                            Text(
                              "Este es una descripcion del el evento numero $item",
                              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 230, 230, 230),),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                          ],),
                      ),
                      SizedBox(width: 5.0,),
                    ],
                  ), // other widget
                ),
              ),
=======
                  child: EventoBuilder(context, index,item),
                );
              },
>>>>>>> Stashed changes
            ),
          ),
        ],
      ),
    );
  }
}

<<<<<<< Updated upstream

class PantallaEventos2 extends StatelessWidget {
  final List<int> items;

  PantallaEventos2({this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return
          Column(
            children: <Widget>[
              SizedBox(height:10.0),
              Material(
                child: Ink(
                  height: (MediaQuery.of(context).size.height / 5) - 10,
=======
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
>>>>>>> Stashed changes
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

