import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Ubuntu"
      ),
      title: "Redesigned Instagram",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  final List tags = ["travel", "urban", "fashion", "lifestyle", "sport"];
  final List categories = ["G.O.T", "Featured", "Awards", "Gym", "Shopping", "My Fashion"];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff09031D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff09031D),
        title: Text("Portfolio", style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          // Profile info
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 7.0),
                child: CircleAvatar(
                  radius: 44,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Emilia Clarke', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.white),),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.location_on, color: Colors.white, size: 17),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text("London, UK", style: TextStyle(color: Colors.white, letterSpacing: 3,),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

          SizedBox(height: 8.0),

          // Follow..
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("2M", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23.0),),
                    Text("followers", style: TextStyle(color: Colors.white70, fontSize: 12.0),),
                  ],
                ),
                Container(
                  color: Colors.white,
                  width: 0.2,
                  height: 22.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("463", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23.0),),
                    Text("following", style: TextStyle(color: Colors.white70, fontSize: 12.0),),
                  ],
                ),
                Container(
                  color: Colors.white,
                  width: 0.2,
                  height: 22.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(33)),
                      gradient: LinearGradient(
                        colors: [Color(0xff6D0EB5), Color(0xff4059F1)],
                        begin: Alignment.bottomRight,
                        end: Alignment.centerLeft,
                      )
                  ),
                  child: Text("Follow", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 16.5),),
                ),
              ],
            ),
          ),

          SizedBox(height: 8.0),

          // Tags
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white12)
                  ),
                  margin: const EdgeInsets.only(right: 10),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(23, 9, 23, 4),
                    child: Text(tags[index], style: TextStyle(color: Colors.white),),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 8.0),

          // Gallery
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15.0),
              decoration: BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.vertical(top: Radius.circular(34),),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                  //   child: Text("Portfolio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                  // ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    height: 65.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index){
                        return
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child: index == 1
                                ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(categories[index], style: TextStyle(color: Color(0xff434AE8).withOpacity(0.9), fontSize: 17.0),),
                                CircleAvatar(radius: 2, backgroundColor: Color(0xff434AE8)),
                              ],
                            )
                                : Text(categories[index], style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 17.0),),
                          );
                      },
                    ),
                  ),


                  // Photos
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            height: 200.0,
                            child: StaggeredGridView.countBuilder(
                              crossAxisCount: 4,
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index){
                                return Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    child: Image.asset("assets/${index + 1}.jpg", fit: BoxFit.cover,),
                                  ),
                                );
                              },
                              staggeredTileBuilder: (int count){
                                return StaggeredTile.count(2, count.isEven ? 3 : 1);
                              },
                              mainAxisSpacing: 9,
                              crossAxisSpacing: 8,
                            ),
                          ),
                        ),

                        // Bottom Navigation Bar
                        Container(
                          height: 55.0,
                          width: double.infinity,
                          padding: const EdgeInsets.only(right: 12, left: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(33)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(Icons.home, size: 30, color: Colors.blueGrey[900]),
                                Icon(Icons.notifications_active, size: 28, color: Colors.blueGrey[900]),
                                SizedBox(width: 0),
                                Icon(Icons.favorite, size: 28, color: Colors.blueGrey[900]),
                                Icon(Icons.person, size: 30, color: Color(0xff434be6))
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 23,
                          child: Container(
                            height: 58.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(55)),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xff6615C1),
                                      Color(0xff484FDE)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight
                                )
                            ),
                            child: Icon(Icons.add, size: 27.0, color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}