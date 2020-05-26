import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/modelos/Evento.dart';
import 'clipper.dart';
import 'CardItemModel.dart';
import 'modelos/Paquete.dart';
import 'pages/home.dart';
import 'db.dart' as db;

class Paquetes2 extends StatefulWidget{
  final Evento evento;

  Paquetes2({this.evento});

  @override
  _Paquetes2 createState() => _Paquetes2();
}

class _Paquetes2 extends State<Paquetes2>with TickerProviderStateMixin{
  var width, height;
  var appColors = [Color.fromARGB(255, 45, 45, 45),Color.fromARGB(255, 45, 45, 45),Color.fromARGB(255, 45, 45, 45)];
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromARGB(255, 45, 45, 45);
  int idx_Title = 2;

  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }
  //static final GlobalKey<FormState> user = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    double c_width = MediaQuery.of(context).size.width*0.9;

    return Scaffold(
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
        body: SingleChildScrollView(
          child:
          Stack(
            children: <Widget>[
              StreamBuilder(
                stream: db.damePaquetes(widget.evento),
                builder: (context,AsyncSnapshot<List<Paquete>> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  return _PaquetesCard(height, snapshot.data);
                },
              ),
              Hero(
                tag: 'clipper',
                child: ClipPath(
                  clipper: MainClipper(),
                  child: Container(
                    height: height * .35,
                    alignment: Alignment.center,
                      decoration:
                      BoxDecoration(
                        color: Colors.grey[900],
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(0.4),
                              BlendMode.dstATop),
                          image: NetworkImage(widget.evento.imagen),
                        ),
                      ),
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(top:15.0,left: 30),
                                      width: c_width,
                                      child: new Wrap (
                                        children: <Widget>[
                                          Container(child: new Text (widget.evento.nombre, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0, color: Colors.white,))),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                              child: Text(widget.evento.Fecha, style: TextStyle(color: Colors.white, letterSpacing: 2,fontWeight: FontWeight.bold),),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text("Monterrey N.L", style: TextStyle(color: Colors.white, letterSpacing: 2,fontWeight: FontWeight.bold),),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget _PaquetesCard(height, List<Paquete> paquetes){

    return Material(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
        child: Padding(
          padding: EdgeInsets.only(top: height*.38-60),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 12,bottom: 10),
                    child: Text("Paquetes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                  ),
                  Container(
                    height: 350.0,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: paquetes.length,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Container(
                                width: 250.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            child: Text("${paquetes[position].titulo}", style: TextStyle(fontSize: 28.0)),
                                          ),
                                          /*Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            child: Text("${paquetes[position].personas}", style: TextStyle(fontSize: 15.0),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            child: Text("${paquetes[position].paquete}", style: TextStyle(fontSize: 15.0),),
                                          ),*/
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            child: Text("${paquetes[position].transporte == true ? "Transporte" : ""}", style: TextStyle(fontSize: 15.0),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            child: Text("${paquetes[position].hospedaje == true ? "Hospedaje" : ""}", style: TextStyle(fontSize: 15.0),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            child: Text("MXN "+ paquetes[position].precio.toString(), style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    //TODO: aqui iria el "carrito"
                                                      builder: (context) => HomePage(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 300,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.yellow[500],
                                                      Colors.yellow[600],
                                                      Colors.yellow[700],
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      offset: Offset(5, 5),
                                                      blurRadius: 10,
                                                    )
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Reservar',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => HomePage(evento: widget.evento, paquete: paquetes[position],),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 300,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.yellow[500],
                                                      Colors.yellow[600],
                                                      Colors.yellow[700],
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      offset: Offset(5, 5),
                                                      blurRadius: 10,
                                                    )
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Pagar',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          onHorizontalDragEnd: (details) {

                            animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
                            curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
                            animationController.addListener(() {
                              setState(() {
                                currentColor = colorTween.evaluate(curvedAnimation);
                              });
                            });

                            if(details.velocity.pixelsPerSecond.dx > 0) {
                              if(cardIndex>0) {
                                cardIndex--;
                                colorTween = ColorTween(begin:currentColor,end:appColors[cardIndex]);
                              }
                            }else {
                              if(cardIndex<2) {
                                cardIndex++;
                                colorTween = ColorTween(begin: currentColor,
                                    end: appColors[cardIndex]);
                              }
                            }
                            setState(() {
                              scrollController.animateTo((cardIndex)*256.0, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                            });
                            colorTween.animate(curvedAnimation);
                            animationController.forward( );
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
