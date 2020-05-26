import 'package:cloud_firestore/cloud_firestore.dart';

class Elemento {
  String id;
  String IdUsuario;
  String IdPaquete;

  Elemento({this.IdPaquete, this.IdUsuario});

  Map<String, dynamic> Conversion() => {
    'IdUsuario': IdUsuario,
    'IdPaquete': IdPaquete,
  };

  Elemento.GuardaElemento(DocumentSnapshot doc)
      : id = doc.documentID,
        IdUsuario = doc.data['IdUsuario'],
        IdPaquete = doc.data['IdPaquete'];
}

/*esta funcion se debe declarar para cada modelo para que procese sus datos*/
List<Elemento> CambiaListaElementos(QuerySnapshot query) {
  return query.documents.map((doc) => Elemento.GuardaElemento(doc)).toList();
}

Elemento CambiaElemento(DocumentSnapshot snapshot){
  return Elemento.GuardaElemento(snapshot);
}
