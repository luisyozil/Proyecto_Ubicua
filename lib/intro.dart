import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'clipper.dart';
import 'login2.dart';
import 'FadeAnimation.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _pageController = PageController();
  var width, height;
  var currentPage = 0;
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
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                color: Colors.black,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login2(),
                      ),
                    );
                  },
                  child:  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Ingresa a tu cuenta",style: TextStyle(color: Colors.white,fontSize: 22,),),
                    ),
                  ),
                )
            ),
            Hero(
              tag: 'clipper',
              child: ClipPath(
                clipper: MainClipper(),
                child: Material(
                  child: PageView(
                    controller: _pageController,
                    children: <Widget>[
                      Pantalla(
                        titulo: "We care about you, friends and family",
                        descripcion: "We connect with your favorite artist in every concert wherever you are",
                        imagen: "img/musicos4.png",
                      ),
                      Pantalla(
                        titulo: "La mejor organización sin preocuparte por nada",
                        descripcion: "Sea cual sea el concierto, pasarás grandes momentos",
                        imagen: "img/musicos2.png",
                      ),
                      Pantalla(
                        titulo: "Conciertos",
                        descripcion: "We connect with your favorite artist in every concert wherever you are",
                        imagen: "img/musicos3.png",
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
                child: SliderIndicator(length: 3,activeIndex: currentPage,indicator: Container(
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
      body:
          Container(
              padding: EdgeInsets.only(top: 60),
              height: MediaQuery.of(context).size.height,
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
