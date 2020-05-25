import 'package:cloud_firestore/cloud_firestore.dart';

class Paquete {
  String id;
  String idEvento;
  String dias;
  String extra;
  bool hospedaje, transporte;
  int precio;
  String titulo;

  Paquete(this.id,this.idEvento);

  Paquete.GuardaPaquete(DocumentSnapshot doc)
      : id = doc.documentID,
        idEvento = doc.data['idEvento'],
        dias = doc.data['dias'],
        extra = doc.data['extra'],
        hospedaje = doc.data['hospedaje'],
        transporte = doc.data['transporte'],
        precio = doc.data['precio'],
        titulo = doc.data['titulo'];
}

/*esta funcion se debe declarar para cada modelo para que procese sus datos*/
List<Paquete> CambiaListaPaquetes(QuerySnapshot query) {
  return query.documents.map((doc) => Paquete.GuardaPaquete(doc)).toList();
}

Paquete CambiaPaquete(DocumentSnapshot snapshot){
  return Paquete.GuardaPaquete(snapshot);
}
