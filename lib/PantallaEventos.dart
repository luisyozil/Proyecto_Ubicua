import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'PantallaDetalleVenta.dart';
import 'db.dart' as db;
import 'modelos/Evento.dart';

class PantallaEventos extends StatelessWidget {
  final FirebaseUser usuario;
  double StarRating = 0.0;
  PantallaEventos(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text('10 resultados de eventos cercanos.',
              style: TextStyle(
                color: Color.fromARGB(255, 230, 230, 230),
              )),
          Expanded(
            child: StreamBuilder(
              stream: db.dameEventos(),
              builder: (context, AsyncSnapshot<List<Evento>> snapshot) {
                if (!snapshot.hasData) {
                  return Text("No hay datos");
                }

                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }

                List<Evento> eventos = snapshot.data;

                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: eventos.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PantallaDetalleEvento(evento: eventos[index], usuario: usuario,),
                          ),
                        );
                      },
                      child: EventoBuilder(context, eventos[index],StarRating),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget EventoBuilder(BuildContext context, Evento item,double StarRating) {
  return Container(
    padding: EdgeInsets.all(12),
    height: 250.0,
    child: Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 250.0,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(item.imagen),
                  fit: BoxFit.cover,
                ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black87,
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 200.0,
            padding: EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
                color: Colors.black87.withOpacity(0.9),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.nombre,
                    style: TextStyle(
                      color: Color.fromARGB(255, 230, 230, 230),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    RatingBar(
                      onRatingUpdate: (v) {StarRating = v;},
                      initialRating: StarRating,
                      itemSize: 13.0,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                      ),
                    ),
                    Text(' + ${item.no_resenas}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 230, 230),
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('img/profile_1.jpg'),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('img/profile_2.jpg'),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(255, 75, 75, 75),
                      ),
                      child: Text(
                        '+${item.interesados}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 230, 230),
                          fontSize: 12.0,
                        ),
                      ),
                    ),

                  ],
                ),
                Wrap(
                children: item.Categoria.split(',')                       // split the text into an array
                    .map((String categoria) =>
                    Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color.fromARGB(255, 255, 204, 0),
                  ),
                  child: Text(
                    categoria,
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 50, 50),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),) // put the text inside a widget
                    .toList(),                        // convert the iterable to a list
              ),

              ],
            ),
          ),
        ),
      ],
    ),
  );
}
