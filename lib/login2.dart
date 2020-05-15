import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/intro.dart';
import 'clipper.dart';
import 'Login.dart';
import 'FadeAnimation.dart';
import 'PantallaInicio.dart';

class Login2 extends StatefulWidget{

  @override
  _Login2PageState createState() => _Login2PageState();
}

class _Login2PageState extends State<Login2>{
  var width, height;
  //static final GlobalKey<FormState> user = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IntroPage()),
        );
      },child: Icon(Icons.close),),
      body: SingleChildScrollView(
        child:
          Stack(
            children: <Widget>[
              _form(height),
              Hero(
                tag: 'clipper',
                child: ClipPath(
                  clipper: MainClipper(),
                  child: Container(
                    height: height * .55,
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
                    child: Image.asset("img/musicos.png",width: width*.9,),
                  ),
                ),
              ),
            ],
          ),
      )
    );
  }

  Widget _form(height){
    final myControllerUser = TextEditingController();
    final myControllerPass = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the Widget is disposed
      myControllerUser.dispose();
      super.dispose();
    }
    @override
    void dispose2() {
      // Clean up the controller when the Widget is disposed
      myControllerPass.dispose();
      super.dispose();
    }
    return Material(
      //key:user,
        color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Padding(
          padding: EdgeInsets.only(top: height*.55-60),
          child: Column(
            children: <Widget>[
              Center(
                child: Text("Ingresa a tu cuenta",style: TextStyle(color: Colors.white,fontSize: 22,),),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20.0,
                                offset: Offset(0, 10)
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                child: TextField(
                                  controller: myControllerUser,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.person),
                                    hintText: 'Usuario',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                child: TextField(
                                  obscureText: true,
                                  controller: myControllerPass,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.lock),
                                    hintText: '***********',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.grey,
                                  Colors.grey
                                ]
                            ),
                          color: Colors.black54
                        ),
                        child: Builder(
                          builder:(context)=> RaisedButton(
                            onPressed: () {
                              var x="";
                              if(myControllerUser.text=='ADMIN' && myControllerPass.text=='ROOT'){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Inicio(),
                                    ));
                              }else{
                                x="usuario y/o contraseña invalida";
                              }
                              final snackBar = SnackBar(
                                content: Text('$x '),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change!
                                  },
                                ),
                              );

                              // Find the Scaffold in the Widget tree and use it to show a SnackBar!
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                            textColor: Colors.white,
                            color: Colors.black26,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Ingresar'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 30,),
                    Text("¿Olvidaste tu contraseña?", style: TextStyle(color: Color.fromARGB(255, 255, 204, 0)),),
                    SizedBox(height: 30,),
                  ],
                ),
              )
            ],
          ),
        )
      ),
      );
  }
}
