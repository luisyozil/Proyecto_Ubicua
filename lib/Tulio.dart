import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(

          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text("Perfil"),

        ),

      ),
      body: ListView(

        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 20,),
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
                            image: new AssetImage('Images/fotoPerfilVacia.png')
                        )
                    ),

                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Marco Nuñez")
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("México")
                ],
              ),
              SizedBox(height: 300,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 411.0,
                    height: 50.0,

                    child: FlatButton(

                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {

                      },
                      child: Text(
                        "Cerrar Sesion",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ) ,
                  ),


                ],
              ),


            ],
          ),

        ],

      ),

    );

  }

}

class ayuda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(

          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text("Ayuda"),

        ),

      ),
      body: ListView(

        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 20,),
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
                            image: new AssetImage('Images/simboloAyuda.png')
                        )
                    ),

                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("AYUDA", style: TextStyle(fontSize: 30.0))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 411.0,
                    height: 50.0,

                    child: FlatButton(

                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {

                      },
                      child: Text(
                        "PREGUNTAS FRECUENTES",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ) ,
                  ),


                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 411.0,
                    height: 50.0,

                    child: FlatButton(

                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {

                      },
                      child: Text(
                        "CONTACTO",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ) ,
                  ),


                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 411.0,
                    height: 50.0,

                    child: FlatButton(

                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {

                      },
                      child: Text(
                        "QUIENES SOMOS",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ) ,
                  ),


                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 411.0,
                    height: 50.0,

                    child: FlatButton(

                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {

                      },
                      child: Text(
                        "TERMINOS Y CONDICIONES",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ) ,
                  ),


                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 411.0,
                    height: 50.0,

                    child: FlatButton(

                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {

                      },
                      child: Text(
                        "PRIVACIDAD Y SEGURIDAD",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ) ,
                  ),


                ],
              ),


            ],
          ),

        ],

      ),

    );

  }

}

class contacto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(

          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text("Contacto"),

        ),

      ),
      body: ListView(

        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 20,),
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
                            image: new AssetImage('Images/contacto.png')
                        )
                    ),

                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("CONTACTO", style: TextStyle(fontSize: 30.0))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  new Flexible(

                    child: new TextField(
                      decoration: const InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Contraseña',

                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  new Flexible(

                    child: new TextField(
                      decoration: const InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Correo electronico',

                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  new Flexible(

                    child: new TextField(
                      decoration: const InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Asunto',

                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 120,
                    child: new TextField(
                      maxLines: 5,
                      decoration: const InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Comentario',

                      ),
                    ),
                  ),




            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 411.0,
                height: 50.0,

                child: FlatButton(

                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {

                  },
                  child: Text(
                    "ENVIAR",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ) ,
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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(

          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text("Carrito"),

        ),

      ),
      body: ListView(

        children: <Widget>[
          Container(
            color: Color.fromARGB(255, 213, 232, 235),
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Text("     Pago", style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
          Column(
            children: <Widget>[

              Row(
                children: <Widget>[
                  Text("Pagar con", style: TextStyle(fontSize: 15, color: Colors.grey),),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => facturacion()),
                      );
                    },

                    child: Column(
                      children: <Widget>[

                        Text("Master card que termina en 9999 >", style: TextStyle(fontSize: 15, color: Colors.blue),),
                      ],
                    ),

                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                color: Color.fromARGB(255, 213, 232, 235),
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Text("     Articulos en el carrito", style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset("Images/PalNort.png",fit: BoxFit.cover,
                        height: 150,
                        width: 150,),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("  1x Boleto PalNorte", style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),),
                          SizedBox(width: 40,),
                          Text("MXN302", style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
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

      ),

    );

  }

}

class facturacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(

          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text("Facturacion"),

        ),

      ),
      body: ListView(

        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                  minWidth: 80.0,
                  height: 40.0,
                  child: RaisedButton(

                    color: Colors.grey,
                    onPressed: () {

                    },
                    child: Image(
                        image: new ExactAssetImage("Images/Tarjetas.png"),
                        height:100.0,
                        width: 100.0,
                        alignment: FractionalOffset.center),
                  )
              ),


            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: <Widget>[
              Text("    Métodos de pago",
                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: <Widget>[
              SizedBox(width: 10,),
              Column(
                children: <Widget>[
                  Icon(Icons.check_circle_outline, color: Colors.blueAccent),
                ],
              ),
              SizedBox(width: 10,),
              Column(
                children: <Widget>[
                  Image(
                      image: new ExactAssetImage("Images/mastercard.jpg"),
                      height:50.0,
                      width: 50.0,
                      alignment: FractionalOffset.center),
                ],
              ),
              SizedBox(width: 10,),
              Column(
                children: <Widget>[
                  Text("···",
                    style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(width: 40,),
              Column(
                children: <Widget>[
                  Text("PRINCIPAL",
                    style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal, color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Spacer(),

            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nuevopago()),
                  );
                },

                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.add, color: Colors.blueAccent, size: 25,),
                        Text("Agregar nuevo pago", style: TextStyle(fontSize: 15, color: Colors.blue),),
                      ],
                    ),

                  ],
                ),

              ),
            ],
          ),
          SizedBox(height: 15,),
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
                    child: Text("Usar esta forma de pago", style: TextStyle(color: Colors.white),
                    ),
                  )
              ),
            ],
          ),
        ],

      ),

    );

  }

}
class nuevopago extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(

          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text("Agregar nuevo pago"),

        ),

      ),
      body: ListView(

        children: <Widget>[
          SizedBox(height: 15,),
          Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  decoration: const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    hintText: 'Numero de tarjeta de credito/debito',

                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  decoration: const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    hintText: 'Nombre del titular de la tarjeta',

                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Flexible(

                child: new TextField(
                  decoration: const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
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
                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    hintText: 'Codigo de seguridad (CVV)',

                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  decoration: const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    hintText: 'Email',

                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
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
                    child: Text("Agregar nuevo metodo de pago", style: TextStyle(color: Colors.white),
                    ),
                  )
              ),
            ],
          ),
        ],

      ),

    );

  }

}
