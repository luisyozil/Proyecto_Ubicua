import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_ubicua/lista_deseos.dart';
import 'package:proyecto_ubicua/promociones.dart';
import 'PantallaNotificaciones.dart';
import 'PantallaEventos.dart';
import 'Tulio.dart';
import 'Busqueda.dart';

class Inicio extends StatelessWidget {
  final FirebaseUser usuario;

  Inicio(this.usuario);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
        onWillPop: () async { return false; },
        child:   MaterialApp(
          title: 'Version 1.0',
          home: PantallaInicio(usuario),
          themeMode: ThemeMode.dark,
          theme: ThemeData(fontFamily: 'Raleway',
              primaryColor: Colors.grey[900],
              accentColor: Colors.yellow[600],
              cursorColor: Colors.yellow[600],
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.black
          ),
        ),
    );
  }
}

class PantallaInicio extends StatefulWidget {
  PantallaInicio(this.usuario);
  final FirebaseUser usuario;
  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  static final itemsEventos = List<int>.generate(10, (i) => i + 1);
  static final items = List<int>.generate(20, (i) => i + 1);
  final List<CardFormatoGeneral> Titulos = items
      .map((it) => new CardFormatoGeneral(
          rutaImagen: 'La imagen es $it',
          Titulo: 'Titulo $it',
          Descripcion: 'Mi descripcion es $it'))
      .toList();

  int idx_Title = 2;

  @override
  Widget build(BuildContext context) {
    var MenuList = ['Promociones', 'Notificaciones', 'Eventos', 'Búsqueda', 'Cuenta'];
    List<Widget> Pantalla = [
      Promociones(),
      PantallaNotificaciones_State(items: items, usuario: widget.usuario,),
      PantallaEventos(widget.usuario),
      Busqueda(),
      //Prueba(widget.usuario),
      perfil2(widget.usuario),
    ];
    return new Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListaDeseos(usuario: widget.usuario,)));
        },
        child: Icon(MdiIcons.cartOutline),
      ),
      appBar: AppBar(
        title: Text(
          MenuList[idx_Title],
          style: TextStyle(
            color: Color.fromARGB(255, 230, 230, 230),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 45, 45, 45),
      ),
      body: Pantalla[idx_Title],
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(MdiIcons.sale),
            title: Text('Promociones'),
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
}
