import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/intro.dart';
import 'clipper.dart';
import 'Login.dart';
import 'FadeAnimation.dart';
import 'PantallaInicio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SignUp.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2PageState createState() => _Login2PageState();
}

class _Login2PageState extends State<Login2> {
  var width, height;
  //static final GlobalKey<FormState> user = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            Navigator.pop(context);
          },
          child: Icon(Icons.close),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Hero(
                    tag: 'clipper',
                    child: ClipPath(
                      clipper: MainClipper(),
                      child: Container(
                        height: height * .55,
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
                        child: Image.asset(
                          "img/musicos.png",
                          width: width * .9,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FormLogin(height),
            ],
          ),
        ));
  }
}

class FormLogin extends StatefulWidget {
  final height;
  FormLogin(this.height);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  TextEditingController _email;
  TextEditingController _pass;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _email = TextEditingController();
    _pass = TextEditingController();
    super.initState();
  }

  Future<void> Verifica() async {
    final formstate = _formkey.currentState;
    if (formstate.validate()) {
      formstate.save();
      try {
        AuthResult usuario = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email.text.trim(), password: _pass.text);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Inicio(usuario.user)));
      } catch (error) {
        print(error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Text(
            "Ingresa a tu cuenta",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 35,
              right: 35,
              top: 20,
            ),
            child: Material(
              shape: StadiumBorder(),
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) return "Ingrese su Correo";
                  },
                  onSaved: (input) => _email.text = input,
                  controller: _email,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person),
                    hintText: "Correo Electronico",
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35, right: 35, top: 12),
            child: Material(
              shape: StadiumBorder(),
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) return 'Ingrese su Contraseña';
                  },
                  onSaved: (input) => _pass.text = input,
                  controller: _pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.lock),
                    hintText: "Contraseña",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: Verifica,
            textColor: Colors.white,
            color: Colors.black,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.yellow[500],
                    Colors.yellow[600],
                    Colors.yellow[700],
                  ],
                ),
              ),
              padding: const EdgeInsets.only(
                  left: 100.0, right: 100, top: 10, bottom: 10),
              child: const Text('Ingresar', style: TextStyle(fontSize: 21)),
            ),
          ),
          FlatButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
            child: Text(
              "¿Nuevo? Registrate aqui",
              style: TextStyle(color: Color.fromARGB(255, 255, 204, 0)),
            ),
          ),
        ],
      ),
    );
  }
}
