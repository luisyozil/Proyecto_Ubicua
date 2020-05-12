import 'package:flutter/material.dart';


class PantallaCondiciones extends StatelessWidget {
  PantallaCondiciones();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Términos y Condiciones',
          style: TextStyle(color: Color.fromARGB(255, 230, 230, 230),),
        ),
        backgroundColor: Color.fromARGB(255, 45, 45, 45),
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Nuestros Términos y Condiciones son ......', style: TextStyle(
                  color: Color.fromARGB(255, 230, 230, 230), fontSize: 18.0),),

            ]
        ),
      ),
    );
  }
}