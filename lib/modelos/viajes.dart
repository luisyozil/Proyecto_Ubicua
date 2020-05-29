import 'package:cloud_firestore/cloud_firestore.dart';

class Viaje {
  String id;
  String IdUsuario;
  String IdEvento;

  Viaje({this.IdEvento, this.IdUsuario});

  Map<String, dynamic> Conversion() => {
    'IdUsuario': IdUsuario,
    'IdEvento': IdEvento,
  };

  Viaje.GuardaViaje(DocumentSnapshot doc)
      : id = doc.documentID,
        IdUsuario = doc.data['IdUsuario'],
        IdEvento = doc.data['IdEvento'];
}

/*esta funcion se debe declarar para cada modelo para que procese sus datos*/
List<Viaje> CambiaListaViajes(QuerySnapshot query) {
  return query.documents.map((doc) => Viaje.GuardaViaje(doc)).toList();
}

Viaje CambiaElemento(DocumentSnapshot snapshot){
  return Viaje.GuardaViaje(snapshot);
}
