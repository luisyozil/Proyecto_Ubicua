import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'db.dart' as db;

class Busqueda extends StatefulWidget {
  @override
  _BusquedaPageState createState() => _BusquedaPageState();
}

class _BusquedaPageState extends State<Busqueda> {
  var queryResultSet = [];
  var tempSearchStore = [];
  double startRating = 0.0;

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      db.SearchService().searchByName().then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['nombre'].toString().toLowerCase().contains(value.toString().toLowerCase())) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          body: Container(
              padding: EdgeInsets.symmetric(vertical: 35,horizontal: 35),
              width: MediaQuery.of(context).size.width,
              //height: 50,
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: TextField(
                          onChanged: (val) {
                            initiateSearch(val);
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.search,),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Buscar artistas, conciertos ...',
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular((5.0)))
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView(
                            children: tempSearchStore.map((element) {
                              return EventoBuilder(context,element,startRating);
                            }).toList()
                        ),
                      ),
                    ],
                  ),
                ],
              )
          )
      );
  }
}



Widget buildResultCard(data,context) {
  DateTime date = data['fecha'].toDate();
  String fecha = date.day.toString()+'/'+date.month.toString()+'/'+date.year.toString();
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 2.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 120,
            child: Image.network(data['imagen'])
          ),
          Container(
            alignment: Alignment.center,
            width: 120,
            child: Text(data['nombre']),
          ),
          Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(fecha,style: TextStyle(color: Theme.of(context).accentColor),),
                //Text(data['descripcion'])
              ],
            ),
          )
        ],
      )
  );
}

Widget EventoBuilder(context,item,StarRating) {
  String cat = item['Categoria'];
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
                image: NetworkImage(item['imagen']),
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
                Text(item['nombre'],
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
                      initialRating: StarRating,
                      itemSize: 13.0,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                      ),
                    ),
                    Text(' + ${item['no_resenas']}',
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
                        '+${item['interesados']}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 230, 230),
                          fontSize: 12.0,
                        ),
                      ),
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
