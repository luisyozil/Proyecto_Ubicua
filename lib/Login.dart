import 'package:flutter/material.dart';
import 'FadeAnimation.dart';
import 'PantallaInicio.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('img/Yellow2.jpg'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 230,
                        width: 250,
                        height: 250,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('img/microfono.png')
                            ),

                          ),
                        )),
                      ),
                      Positioned(
                        right: 280,
                        width: 100,
                        height: 100,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('img/microfonobco.png')
                            ),

                          ),
                        )),
                      ),
                      Positioned(
                        left: 180,
                        width: 150,
                        height: 150,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('img/microfonobco.png')
                            ),

                          ),
                        )),
                      ),
                      Positioned(
                        right: 160,
                        width: 170,
                        height: 170,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('img/microfono.png')
                            ),
                          ),
                        )),
                      ),

                    ],
                  ),
                ),
                Center(
                  child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Correo Electrónico",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Contraseña",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(2, InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Inicio(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 45, 45, 45),
                                    Color.fromARGB(255, 255, 204, 0),
                                  ]
                              )
                          ),
                          child: Center(
                            child: Text("Ingresar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      )
                      ),
                      SizedBox(height: 70,),
                      FadeAnimation(1.5, Text("¿Olvidaste tu contraseña?", style: TextStyle(color: Color.fromARGB(255, 255, 204, 0)),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}