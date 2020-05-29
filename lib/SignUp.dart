import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/intro.dart';
import 'clipper.dart';
import 'Login.dart';
import 'FadeAnimation.dart';
import 'db.dart' as db;
import 'PantallaInicio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'modelos/Usuario.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
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
                        height: height * .35,
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
              FormSignUp(height),
            ],
          ),
        ));
  }
}

class FormSignUp extends StatefulWidget {
  final height;
  FormSignUp(this.height);

  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  File imagen;

  Future<void> pickImage() async {
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagen = selected;
    });
  }

  TextEditingController _name;
  TextEditingController _lastname;
  TextEditingController _email;
  TextEditingController _pass;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _lastname.dispose();
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _email = TextEditingController();
    _pass = TextEditingController();
    _name = TextEditingController();
    _lastname = TextEditingController();
    super.initState();
  }

  Future<void> Verifica() async {
    final SharedPreferences prefs = await _prefs;
    final formstate = _formkey.currentState;
    if (formstate.validate()) {
      formstate.save();
      try {
        AuthResult usuario = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _email.text.trim(),
            password: _pass.text
        );

        String Uid = usuario.user.uid;
        String urlImagen = "https://api.adorable.io/avatars/600/"+_name.text+_lastname.text+"@adorable.io.png";
        Usuario user = Usuario(Uid,_name.text,_lastname.text,urlImagen,_email.text.trim());
        db.GuardaUsuario(user);
        prefs.setString('email', _email.text.trim());
        prefs.setString('pass', _pass.text);
        prefs.setBool('signed', true);
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
            "Registrate",
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
                    if (input.isEmpty) return "No puede estar vacio";
                  },
                  onSaved: (input) => _name.text = input,
                  controller: _name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person),
                    hintText: "Nombre",
                  ),
                ),
              ),
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
                    if (input.isEmpty) return "No puede estar vacio";
                  },
                  onSaved: (input) => _lastname.text = input,
                  controller: _lastname,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.perm_identity),
                    hintText: "Apellido",
                  ),
                ),
              ),
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
                    if (input.isEmpty) return "No puede estar vacio";
                  },
                  onSaved: (input) => _email.text = input,
                  controller: _email,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.email),
                    hintText: "Correo",
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35, right: 35, top: 20),
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
              child: const Text('Registrarse', style: TextStyle(fontSize: 21)),
            ),
          ),
        ],
      ),
    );
  }
}
