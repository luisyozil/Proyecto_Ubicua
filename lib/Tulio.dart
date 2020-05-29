import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_ubicua/MisViajes.dart';
import 'package:proyecto_ubicua/PantallaAyuda.dart';
import 'db.dart' as db;
import 'intro.dart';
import 'lista_deseos.dart';
import 'modelos/Usuario.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'services/payment-service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MyProfile.dart';

class perfil extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage('Images/fotoPerfilVacia.png'))),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Nombre de usuario',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 255, 204, 0),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'México',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 255, 204, 0),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 10.0),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 255, 204, 0),
                          spreadRadius: 2),
                    ],
                  ),
                  child: FlatButton(
                    splashColor: Color.fromARGB(125, 255, 204, 0),
                    onPressed: () {},
                    child: Text(
                      'Cerrar Sesion',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 255, 204, 0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class contacto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage('Images/contacto.png'))),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("CONTACTO", style: TextStyle(fontSize: 30.0))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 35,
                  right: 35,
                  top: 20,
                ),
                child: Material(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Asunto",
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Comentario",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: 50.0,
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "ENVIAR",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class pago extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Color.fromARGB(255, 213, 232, 235),
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "     Pago",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Pagar con",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => facturacion()),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Master card que termina en 9999 >",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Color.fromARGB(255, 213, 232, 235),
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "     Articulos en el carrito",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(
                      "Images/PalNort.png",
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "  1x Boleto PalNorte",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "MXN302",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            /*Center(child: SliderButton(
                action: () {
                  ///Do something here
                  Navigator.of(context).pop();
                },
                label: Text(
                  "Desliza para pagar",
                  style: TextStyle(
                      color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
                ),
                icon: Text(
                  ">",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 44,
                  ),
                ),
              )),*/
          ],
        ),
      ],
    );
  }
}

class facturacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
                minWidth: 80.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.grey,
                  onPressed: () {},
                  child: Image(
                      image: new ExactAssetImage("Images/Tarjetas.png"),
                      height: 100.0,
                      width: 100.0,
                      alignment: FractionalOffset.center),
                )),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            Text(
              "    Métodos de pago",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Column(
              children: <Widget>[
                Icon(Icons.check_circle_outline, color: Colors.blueAccent),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: <Widget>[
                Image(
                    image: new ExactAssetImage("Images/mastercard.jpg"),
                    height: 50.0,
                    width: 50.0,
                    alignment: FractionalOffset.center),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: <Widget>[
                Text(
                  "···",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Column(
              children: <Widget>[
                Text(
                  "PRINCIPAL",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.blueAccent),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Spacer(),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => nuevopago()),
                );
              },
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.blueAccent,
                        size: 25,
                      ),
                      Text(
                        "Agregar nuevo pago",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Usar esta forma de pago",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

class nuevopago extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: const InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  hintText: 'Numero de tarjeta de credito/debito',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: const InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  hintText: 'Nombre del titular de la tarjeta',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: const InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  hintText: 'Fecha de expiracion (MM/AA)',
                ),
              ),
            ),
            // Spacer(),
            SizedBox(width: 10),
            new Flexible(
              child: new TextField(
                decoration: const InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  hintText: 'Codigo de seguridad (CVV)',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: const InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  hintText: 'Email',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Agregar nuevo metodo de pago",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

class perfil2 extends StatelessWidget {
  final FirebaseUser usuario;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  perfil2(this.usuario);

  Future<void> DesLoggea() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db.BuscaUsuario(usuario.uid),
      builder: (context, AsyncSnapshot<Usuario> snapshot) {
        if (!snapshot.hasData) {
          print(usuario.uid);
          return CircularProgressIndicator();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        Usuario user = snapshot.data;
        return Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Image.network(
                user.imagen,
                fit: BoxFit.cover,
              ),
            ),
            DraggableScrollableSheet(
              minChildSize: 0.1,
              initialChildSize: 0.22,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height),
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //for user profile header
                        Container(
                          padding:
                              EdgeInsets.only(left: 32, right: 32, top: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: ClipOval(
                                    child: Image.network(
                                      user.imagen,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      user.nombre,
                                      style: TextStyle(
                                          color: Colors.yellow[600],
                                          fontFamily: "Raleway",
                                          fontSize: 36,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "México",
                                      style: TextStyle(
                                          color: Colors.yellow[600],
                                          fontFamily: "Raleway",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        //performace bar

                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: EdgeInsets.all(32),
                          color: Colors.yellow[600],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.check_box,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "23",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Raleway",
                                            fontSize: 24),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Viajes Realizados ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Raleway",
                                        fontSize: 15),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "14/05/20",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Raleway",
                                            fontSize: 24),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Miembro desde",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Raleway",
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        //container for about me

                        SizedBox(
                          height: 16,
                        ),
                        /*Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width * .93,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 255, 204, 0),
                                      spreadRadius: 2),
                                ],
                              ),
                              child: FlatButton(
                                splashColor: Color.fromARGB(125, 255, 204, 0),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ListaDeseos(
                                                usuario: usuario,
                                              )));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.cartOutline,
                                      color: Colors.yellow[600],
                                      size: 30.0,
                                    ),
                                    Text(
                                      'Lista de Deseos',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromARGB(255, 255, 204, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),*/
                        SizedBox(
                          height: 16,
                        ),
                        //Container for clients
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width * .93,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 255, 204, 0),
                                      spreadRadius: 2),
                                ],
                              ),
                              child: FlatButton(
                                splashColor: Color.fromARGB(125, 255, 204, 0),
                                onPressed: () {
                                  //todo: llamar vista de mis viajes
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MisViajes(usuario)
                                      )
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.airplane,
                                      color: Colors.yellow[600],
                                      size: 30.0,
                                    ),
                                    Text(
                                      'Mis Viajes',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromARGB(255, 255, 204, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width * .93,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 255, 204, 0),
                                      spreadRadius: 2),
                                ],
                              ),
                              child: FlatButton(
                                splashColor: Color.fromARGB(125, 255, 204, 0),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyProfile(usuario)));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.information,
                                      color: Colors.yellow[600],
                                      size: 30.0,
                                    ),
                                    Text(
                                      'Mi informacion',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromARGB(255, 255, 204, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width * .93,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 255, 204, 0),
                                      spreadRadius: 2),
                                ],
                              ),
                              child: FlatButton(
                                splashColor: Color.fromARGB(125, 255, 204, 0),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PantallaAyuda()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.help,
                                      color: Colors.yellow[600],
                                      size: 30.0,
                                    ),
                                    Text(
                                      'Ayuda',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromARGB(255, 255, 204, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width * .93,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 255, 204, 0),
                                      spreadRadius: 2),
                                ],
                              ),
                              child: FlatButton(
                                splashColor: Color.fromARGB(125, 255, 204, 0),
                                onPressed: () {
                                  try {
                                    DesLoggea();
                                    FirebaseAuth.instance.signOut();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => IntroPage()),
                                        ModalRoute.withName('/'));
                                  } catch (e) {
                                    print(e.toString());
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.accountArrowLeft,
                                      color: Colors.yellow[600],
                                      size: 30.0,
                                    ),
                                    Text(
                                      'Cerrar Sesion',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromARGB(255, 255, 204, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Container for reviews
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.pushNamed(context, 'lib/pages/existing-cards.dart');
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Por favor espera...');
    await dialog.show();
    var response =
        await StripeService.payWithNewCard(amount: '15000', currency: 'USD');
    await dialog.hide();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration:
          new Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch (index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: theme.primaryColor);
                  text = Text('Añadir una tarjeta nueva');
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: theme.primaryColor);
                  text = Text('Pagar con una tarjeta existente');
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: theme.primaryColor,
                ),
            itemCount: 2),
      ),
    );
    ;
  }
}
