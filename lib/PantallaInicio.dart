import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'PantallaDetalleVenta.dart';
import 'PantallaNotificaciones.dart';
import 'PantallaEventos.dart';
import 'Login.dart';
import 'Tulio.dart';
import 'Paquetes.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Version 1.0',
      home: PantallaInicio_State(),
    );
  }
}

class PantallaInicio_State extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PantallaInicio();
}

class PantallaInicio extends State<PantallaInicio_State> {
  static final items = List<int>.generate(20, (i) => i + 1);
  static final itemsEventos = List<int>.generate(10, (i) => i + 1);

  List<CardFormatoGeneral> Titulos = items
      .map((it) => new CardFormatoGeneral(
          rutaImagen: 'La imagen es $it',
          Titulo: 'Titulo $it',
          Descripcion: 'Mi descripcion es $it'))
      .toList();

  // Aqui seria el refresh
  static final itemsPares = List<int>();
  int idx_Title = 2;
  final List<Widget> Pantalla = [
    ayuda(),
    PantallaNotificaciones_State(items: items),
    PantallaEventos(items: itemsEventos),
    Text('Pantalla Busqueda', style: TextStyle(color: Colors.white)),
    perfil(),
  ];

  @override
  Widget build(BuildContext context) {
    var MenuList = ['Ayuda', 'Notificaciones', 'Eventos', 'Búsqueda', 'Cuenta'];

    return new Scaffold(
      backgroundColor: Colors.black,
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
}
