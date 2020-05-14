import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class perfil extends StatelessWidget {
  Widget build(BuildContext context) {
    return  ListView(
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
                            image: new AssetImage('Images/fotoPerfilVacia.png')
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('Nombre de usuario',style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 255, 204, 0),),)],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('México',style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 255, 204, 0),),)],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 300,),
              Row(
                children: <Widget>[
                  SizedBox(width:10.0),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(color: Color.fromARGB(255, 255, 204, 0), spreadRadius: 2),
                      ],
                    ),
                    child: FlatButton(
                      splashColor: Color.fromARGB(125, 255, 204, 0),
                      onPressed: (){

                      },
                      child: Text('Cerrar Sesion',style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 255, 204, 0),),),
                    ),

                  ),
                  SizedBox(width:10.0),
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

    return  ListView(

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
      );

  }
}

class nuevopago extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListView(

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

      );



  }
}


class perfil2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset("Images/Yozil.jpg", fit: BoxFit.cover,),
          ),

          DraggableScrollableSheet(
            minChildSize: 0.1,
            initialChildSize: 0.22,
            builder: (context, scrollController){
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //for user profile header
                      Container(
                        padding : EdgeInsets.only(left: 32, right: 32, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipOval(
                                  child: Image.asset('Images/Yozil.jpg', fit: BoxFit.cover,),
                                )
                            ),

                            SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("AJIJIJIJIJI", style: TextStyle(color:Colors.yellow[600], fontFamily: "Roboto",
                                      fontSize: 36, fontWeight: FontWeight.w700
                                  ),),
                                  Text("México", style: TextStyle(color: Colors.yellow[600], fontFamily: "Roboto",
                                      fontSize: 16, fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                      //performace bar

                      SizedBox(height: 16,),
                      Container(
                        padding: EdgeInsets.all(32),
                        color: Colors.yellow[600],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.check_box, color: Colors.black, size: 30,),
                                    SizedBox(width: 4,),
                                    Text("23", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto", fontSize: 24
                                    ),)
                                  ],
                                ),

                                Text("Viajes Realizados ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto", fontSize: 15
                                ),)
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.favorite, color: Colors.black, size: 30,),
                                    SizedBox(width: 4,),
                                    Text("14/05/20", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto", fontSize: 24
                                    ),)
                                  ],
                                ),

                                Text("Miembro desde", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto", fontSize: 15
                                ),)
                              ],
                            ),


                          ],
                        ),
                      ),

                      SizedBox(height: 16,),
                      //container for about me

                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32),
                        child: Column(
                          children: <Widget>[
                            Text("Acerca de mi", style: TextStyle(color: Colors.yellow[600], fontWeight: FontWeight.w700,
                                fontFamily: "Roboto", fontSize: 18
                            ),),

                            SizedBox(height: 8,),
                            Text("HOLA SE VE BIEN COOL ESTO AJIJIJIJIJI                      "
                                "EL YOZIL ES JOT0 ",
                              style: TextStyle(fontFamily: "Roboto", fontSize: 15),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 16,),
                      //Container for clients


                      //Container for reviews




                    ],
                  ),

                ),
              );
            },
          )
        ],
      );

  }
}


