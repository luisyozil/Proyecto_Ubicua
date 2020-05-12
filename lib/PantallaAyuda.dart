import 'package:flutter/material.dart';
import 'PantallaCondiciones.dart';

class PantallaAyuda extends StatelessWidget {
  final List<int> items;

  PantallaAyuda({this.items});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 15.0),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaCondiciones()));
                },
                child: Text('Términos y Condiciones',style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 255, 204, 0),),),
              ),

            ),
            SizedBox(width:10.0),
          ],
        ),
      ],
    );
  }
}

