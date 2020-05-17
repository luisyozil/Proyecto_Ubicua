import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Busqueda extends StatefulWidget {
  @override
  _BusquedaPageState createState() => _BusquedaPageState();
}

class _BusquedaPageState extends State<Busqueda> {
  var busqueda = [
    "uno",
    "dos",
    "tres",
    "cuatro",
    "diez",
    "yozil",
    "ropero",
    "agua",
    "aper",
    "asn",
    "arc",
    "arcs",
    "arcd",
    "arfs"
  ];
  var queryResultSet = [];
  var tempSearchStore = [];

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
      busqueda.forEach((element) {
        if(element.startsWith(value.toString().substring(0,1)))
          queryResultSet.add(element);
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element.startsWith(value)) {
          print(value);
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
          bottomNavigationBar:
          BottomNavigationBar(
            selectedItemColor: Theme.of(context).accentColor,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.help_outline),
                title: Text('Ayuda'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                title: Text('Notificaciones'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                title: Text('Eventos'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Búsqueda'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                title: Text('Cuenta'),
              ),
            ],
          ),
          /*appBar: AppBar(

          title: Text('uno'),
        ),*/
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
                        height: MediaQuery.of(context).size.height-350,
                        child: ListView(
                            children: tempSearchStore.map((element) {
                              return buildResultCard(element,context);
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



Widget buildResultCard(datos,context) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 2.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 120,
            child: Text(datos),
          ),
          Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Fecha',style: TextStyle(color: Theme.of(context).accentColor),),
                Text('Precio')
              ],
            ),
          )
        ],
      )
  );
}