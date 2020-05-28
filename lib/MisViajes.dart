import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/modelos/Usuario.dart';
import 'clipper.dart';
import 'db.dart' as db;
import 'modelos/Evento.dart';
import 'modelos/viajes.dart';


class MisViajes extends StatelessWidget {

  Usuario usuario;

  MisViajes(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: db.dameViajes(usuario.id),
        builder: (context, AsyncSnapshot<List<Viaje>> snapshot ){
          if(snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();

          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return StreamBuilder(
                  stream: db.BuscaEvento(snapshot.data[index].IdEvento),
                  builder: (context, AsyncSnapshot<Evento> snapshotevento ){
                    if(snapshotevento.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }

                    if(snapshotevento.hasData){
                      return ViajeRow(snapshotevento.data);
                    }

                  },
                );
              },
            );
          }else{
            return Container(
              child: Text("no hay eventos"),
            );
          }
        },
      ),
    );
  }
}


/*class MisViajes extends StatefulWidget {
  Usuario usuario;

  MisViajes(this.usuario);

  @override
  _MisViajes createState() => _MisViajes();
}

class _MisViajes extends State<MisViajes> with TickerProviderStateMixin {
  var width, height;
  int idx_Title = 2;
  //static final GlobalKey<FormState> user = new GlobalKey<FormState>();
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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            StreamBuilder(
              stream: db.dameViajes(widget.usuario.id),
              builder: (context, AsyncSnapshot<List<Viaje>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();

                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ViajeRow();
                    },
                  );
                } else {
                  return Container(
                    child: Text("no hay eventos"),
                  );
                }
              },
            ),
            Hero(
              tag: 'clipper',
              child: ClipPath(
                clipper: MainClipper(),
                child: Container(
                    height: height * .18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.yellow[500],
                        Colors.yellow[600],
                        Colors.yellow[700],
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    )),
                    child: Container(
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 50, bottom: 10, top: 20),
                                child: Text("Mis Viajes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paquetes(height) {
    return Material(
        //key:user,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Padding(
            padding: EdgeInsets.only(top: height * .18 - 60),
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ViajeRow(),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}*/

class ViajeRow extends StatelessWidget {
  Evento evento;

  ViajeRow(this.evento);

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
            Container(
              height: 124.0,
              margin: new EdgeInsets.only(left: 46.0),
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  colors: [
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
            ),
            Container(
              margin: new EdgeInsets.symmetric(vertical: 0.0),
              alignment: FractionalOffset.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0, top: 7.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(evento.imagen),
                ),
              ),
            ),
            Container(
              margin: new EdgeInsets.fromLTRB(96.0, 16.0, 16.0, 16.0),
              constraints: new BoxConstraints.expand(),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(height: 4.0),
                  new Text(
                    evento.nombre,
                    style: TextStyle(fontSize: 20),
                  ),
                  new Container(height: 10.0),
                  /*new Text(
                    "Monterrey N.L",
                  ),*/
                  new Container(
                      margin: new EdgeInsets.symmetric(vertical: 8.0),
                      height: 2.0,
                      width: 30.0,
                      color: Colors.yellow),
                  new Row(
                    children: <Widget>[
                      new Container(width: 8.0),
                      new Text(
                        evento.Fecha,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
