import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'clipper.dart';
import 'login2.dart';
import 'FadeAnimation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PantallaCondiciones extends StatefulWidget {
  @override
  _PantallaCondiciones createState() => _PantallaCondiciones();
}

class _PantallaCondiciones extends State<PantallaCondiciones> {
  var width, height;
  int idx_Title = 2;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
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
                child: Text("Términos y Condiciones",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)),
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
                  children: <Widget>[
                    ParteGris(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



}

class ParteGris extends StatelessWidget{
  var width, height;
  @override
  Widget build(BuildContext context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
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
                padding: EdgeInsets.only(right: 20,left: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 70,),
                    Image.asset("img/Terminos.png",width: width,),
                    Text("Aqui van los terminos y condiciones")
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
