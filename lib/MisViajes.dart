import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/intro.dart';
import 'clipper.dart';
import 'CardItemModel.dart';
import 'Login.dart';
import 'FadeAnimation.dart';
import 'PantallaInicio.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class  MisViajes extends StatefulWidget{
  @override
  _MisViajes createState() => _MisViajes();
}

class _MisViajes extends State<MisViajes>with TickerProviderStateMixin{
  var width, height;
  int idx_Title = 2;
  //static final GlobalKey<FormState> user = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("",
          style: TextStyle(color: Color.fromARGB(255, 230, 230, 230),),
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
      body: SingleChildScrollView(
        child:
        Stack(
          children: <Widget>[
            _paquetes(height),
            Hero(
              tag: 'clipper',
              child: ClipPath(
                clipper: MainClipper(),
                child: Container(
                    height: height * .18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors:[
                          Colors.yellow[500],
                          Colors.yellow[600],
                          Colors.yellow[700],
                        ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                        )
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 50,bottom: 10,top: 20),
                                child: Text("Mis Viajes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        onTap: (int TabIndice) {
          setState(() {
            idx_Title = TabIndice;
          });
        },
        currentIndex: idx_Title,
        selectedItemColor: Color.fromARGB(255, 255, 204, 0),
        unselectedItemColor: Color.fromARGB(255, 230, 230, 230),
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            title: Text('Ayuda'),
            backgroundColor: Color.fromARGB(255, 45, 45, 45),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.bellOutline),
            title: Text('Notificaciones'),
            backgroundColor: Color.fromARGB(255, 45, 45, 45),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.calendarStar),
            title: Text('Eventos'),
            backgroundColor: Color.fromARGB(255, 45, 45, 45),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Búsqueda'),
            backgroundColor: Color.fromARGB(255, 45, 45, 45),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.account),
            title: Text('Cuenta'),
            backgroundColor: Color.fromARGB(255, 45, 45, 45),
          ),
        ],
      ),
    );
  }

  Widget _paquetes(height){
    return Material(
      //key:user,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
          child: Padding(
            padding: EdgeInsets.only(top: height*.18-60),
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ViajeRow(),
                    ViajeRow(),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}

class ViajeRow extends StatelessWidget {
  final Thumbnail = new Container(
    margin: new EdgeInsets.symmetric(
        vertical: 0.0
    ),
    alignment: FractionalOffset.centerLeft,
    child:  Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 7.0),
      child: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage("img/tecate.jpg"),
      ),
    ),
  );
  final Card = new Container(
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      gradient: LinearGradient(colors:[
        Colors.grey[900],
        Colors.grey[800],
        Colors.grey[700],
      ],
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
      ),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );
  final CardContent = new Container(
    margin: new EdgeInsets.fromLTRB(96.0, 16.0, 16.0, 16.0),
    constraints: new BoxConstraints.expand(),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(height: 4.0),
        new Text("Tecate Pal Norte", style: TextStyle(fontSize: 20),
        ),
        new Container(height: 10.0),
        new Text("Monterrey N.L",
        ),
        new Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 30.0,
            color: Colors.yellow
        ),
        new Row(
          children: <Widget>[
            new Container(width: 8.0),
            new Text("12-13/Septiembre 2020",
            ),
          ],
        ),
      ],
    ),
  );


  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            Card,
            Thumbnail,
            CardContent,
          ],
        )
    );
  }
}