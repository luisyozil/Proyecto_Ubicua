import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/Login.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'CardItemModel.dart';


void main() => runApp(new Paquetes());

class Paquetes extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  var appColors = [Color.fromARGB(255, 45, 45, 45),Color.fromARGB(255, 45, 45, 45),Color.fromARGB(255, 45, 45, 45)];
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromARGB(255, 45, 45, 45);

  var cardsList = [CardItemModel("GENERAL", "PERSONAL" ,"ENTRADA 1 DIA","","",1200),CardItemModel("PREMIUM PASS","PERSONAL","ENTRADA 2 DIAS + PREMIUM","Transporte","",2400),CardItemModel("ALL INCLUDED","PERSONAL","ENTRADA 2 DIAS VIP","Transporte","Hospedaje",5000 )];

  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {

    int idx_Title = 2;

    return new Scaffold(
      backgroundColor: currentColor,
        appBar: AppBar(
          title: Text("Paquetes",
            style: TextStyle(color: Color.fromARGB(255, 230, 230, 230),),
          ),
          backgroundColor: Color.fromARGB(255, 45, 45, 45),
          leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),


      body: ListView(
        children: <Widget>[
          new Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Card(
                      elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(0)),
                    clipBehavior: Clip.antiAlias,
                    child: FittedBox(
                      child: Image.asset('img/tecate.jpg'),
                      fit: BoxFit.fill,
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0,16.0,0.0,12.0),
                          child: Text("Tecate Pal Norte 2020", style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold,fontFamily: "Calibre-Semibold",
                            letterSpacing: 1.0,),),
                        ),
                        Text("Monterrey N.L, JUN 21, 2020 ", style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 350.0,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
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
                                              child: Text("${cardsList[position].cardTitle}", style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                              child: Text("${cardsList[position].personas}", style: TextStyle(fontSize: 15.0),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                              child: Text("${cardsList[position].paquete}", style: TextStyle(fontSize: 15.0),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                              child: Text("${cardsList[position].transporte}", style: TextStyle(fontSize: 15.0),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                              child: Text("${cardsList[position].hospedaje}", style: TextStyle(fontSize: 15.0),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                              child: Text("MXN "+"${cardsList[position].precio}", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Login()
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
                                                        fontWeight: FontWeight.w500,
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
                                                        builder: (context) => Login()
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
                                                        fontWeight: FontWeight.w500,
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
        ],
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        onTap: (int TabIndice) {
          setState(() {
            idx_Title = TabIndice;
          });
        },
        currentIndex: idx_Title,
        selectedItemColor: Color.fromARGB(255, 255, 204, 0),
        unselectedItemColor: Color.fromARGB(255, 230, 230, 230),
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            title: Text('Ayuda'),
            backgroundColor: Color.fromARGB(255, 45, 45, 45),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.bellOutline),
            title: Text('Notificaciones'),
            backgroundColor: Color.fromARGB(255, 45, 45, 45),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.calendarStar),
            title: Text('Eventos'),
            backgroundColor: Color.fromARGB(255, 45, 45, 45),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Búsqueda'),
            backgroundColor: Color.fromARGB(255, 45, 45, 45),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.account),
            title: Text('Cuenta'),
            backgroundColor: Color.fromARGB(255, 45, 45, 45),
          ),
        ],
      ),
    );
  }
}