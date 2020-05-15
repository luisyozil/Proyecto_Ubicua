import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'clipper.dart';
import 'login2.dart';
import 'FadeAnimation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class QuienesSomos extends StatefulWidget {
  @override
  _QuienesSomos createState() => _QuienesSomos();
}

class _QuienesSomos extends State<QuienesSomos> {
  PageController _pageController = PageController();
  var width, height;
  var currentPage = 0;
  int idx_Title = 2;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    _pageController.addListener((){
      setState(() {
        currentPage = _pageController.page.round();
      });
    });
    return  Scaffold(
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

      body: Stack(
        children: <Widget>[
          Container(
                child:  Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text("¿Quienes Somos?",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)),
                  ),
                ),
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
          ),
          Hero(
            tag: 'clipper',
            child: ClipPath(
              clipper: MainClipper(),
              child: Container(
                height: height,
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    Pantalla(
                      titulo: "UASLP Facultad de Ingeniería",
                      descripcion: "Área de Ciencias de la Computación",
                      imagen: "img/Nosotros1.png",
                    ),
                    Pantalla(
                      titulo: "Computacion Ubicua",
                      descripcion: "Sea cual sea el concierto, pasarás grandes momentos",
                      imagen: "img/Nosotros.png",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 75),
              child: SliderIndicator(length:2,activeIndex: currentPage,indicator: Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.white
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),activeIndicator: Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.white
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white
                ),
              ),
              ),
            ),
          )
        ],
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



}

class Pantalla extends StatelessWidget{
  var width, height;
  final String titulo;
  final String descripcion;
  final String imagen;

  Pantalla({this.titulo,this.descripcion,this.imagen});
  @override
  Widget build(BuildContext context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors:[
                Colors.grey[900],
                Colors.grey[800],
                Colors.grey[700],
              ],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              )
          ),
          child: Container(
            padding: EdgeInsets.only(right: 10,left: 10),
            child: Column(
              children: <Widget>[
                SizedBox(height: 70,),
                Image.asset(imagen,width: width*.9,),
                SizedBox(height: 32,),
                FadeAnimation(.5, Text(titulo, style: TextStyle(fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                SizedBox(height: 32,),
                Text(descripcion,textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),),
              ],
            ),
          )
      ),

    );
  }
}
