import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'clipper.dart';
import 'login2.dart';
import 'FadeAnimation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PantallaCondiciones extends StatefulWidget {
  @override
  _PantallaCondiciones createState() => _PantallaCondiciones();
}

class _PantallaCondiciones extends State<PantallaCondiciones> {
  var width, height;
  int idx_Title = 2;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return  Scaffold(
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

      body: Stack(
        children: <Widget>[
          Container(
            child:  Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Términos y Condiciones",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)),
              ),
            ),
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.yellow[500],
                  Colors.yellow[600],
                  Colors.yellow[700],
                ],
              ),
            ),
          ),
          Hero(
            tag: 'clipper',
            child: ClipPath(
              clipper: MainClipper(),
              child: Container(
                height: height,
                child: PageView(
                  children: <Widget>[
                    ParteGris(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParteGris extends StatelessWidget{
  var width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.grey[900],
                    Colors.grey[800],
                    Colors.grey[700],
                  ],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                  )
              ),
              child: Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: ListView(
                  children: <Widget>[
                    Image.asset("img/Terminos.png", width: width,),
                    Text(
                        "Compraventa.\n\nLa aceptación de estos términos y condiciones constituye un Contrato de Compraventa entre Dream Paradise y la persona que está comprando boletos."),
                    Text(
                        "\n\nAutorización.\n\nTu compra está sujeta a la autorización de tarjeta de crédito y verificación de tu banco."),
                    Text(
                        "Cambios, Reembolsos y Cancelaciones. No existen cambios, reembolsos ni cancelaciones."),
                    Text(
                        "Para el caso de eventos cancelados por causas ajenas a Dream Paradise el reembolso se hará únicamente por el precio del boleto."),
                    Text(
                        "En caso de cancelación del evento, la devolución del costo del boleto será entregada en el lugar, días y horas que Dream Paradise señale para tal efecto."),
                    Text(
                        "\n\nLímite de Boletos.\n\nEl límite de boletos es por persona. En caso de superarlo, se cancelarán los boletos excedentes sin previo aviso."),
                    Text(
                        "\n\nLugares Disponibles.\n\nDream Paradise Online te proporciona el mejor lugar disponible al momento de realizar la compra, de acuerdo con el precio solicitado."),
                    Text(
                        "\n\nPrecauciones.\n\nAntes de hacer tu compra por favor revisa cuidadosamente el evento, sección, fecha y número de boletos solicitados, ya que una vez realizada ésta no hay cambios, reembolsos ni devoluciones."),
                    Text("\n\nEntrega de Boletos.\n\n"),
                    Text(
                        "Adicional al mail de confirmación recibirás un correo de nuestra parte donde incluiremos todos tus boletos"),
                    Text("\n\nEs IMPORTANTE que al llegar evento:\n\n"),
                    Text(
                        "1. Te dirijas al acceso destinado para BOLETO ELECTRONICO."),
                    Text(
                        "2. Debes mostrar tus boletos desde tu móvil Android para que podamos escanearlos y validemos tu ingreso al espectáculo."),
                    Text(
                        "En caso de que más de un boleto sea presentado, el lector electrónico negará el acceso al portador sin importar que te acredites como el comprador."),
                    Text(
                        "Por tal motivo te sugerimos cuidar los archivos enviados, y no distribuirlos para evitar que sean utilizados por cualquier otra persona."),
                    Text(
                        "Si tienes los boletos de más personas,es importante que todos entren al inmueble al mismo tiempo para que podamos escanear los boletos desde tu dispositivo."),
                    Text(
                        "Esta opción requiere la validación de tus datos bancarios."),
                    Text(
                        "\n\nAtención a Clientes.\n\nSi presentas algún problema al realizar tu compra, por favor comunícate al departamento de servicio a clientes al (448)-1-45-76-78"),
                    Text(
                        "\n\nJurisdicción y Competencia.\n\nCualquier controversia derivada de estos Términos y Condiciones de Compraventa, las partes se someterán expresamente a la jurisdicción y competencia de los tribunales de la ciudad de San Luis Potosí, S.L.P, haciendo renuncia expresa de cualquier otra jurisdicción que pudiera corresponderles debido a sus domicilios presentes o futuros."),
                    Text(
                        "\n\nResponsabilidad de Dream Paradise.\n\nDream Paradise es una empresa independiente, contratada únicamente para la venta de Boletos, por lo que no se hace responsable de la calidad o contenido del evento, ni de los actos o consecuencias que dicho evento pueda tener."),
                    SizedBox(height: 200,),

                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
