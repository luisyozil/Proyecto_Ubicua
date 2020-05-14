import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String id;
  String nombre;
  String correo;

  Usuario.GuardaUsuario(DocumentSnapshot doc)
      : id = doc.documentID,
        nombre = doc.data['usuario'],
        correo = doc.data['correo'];
}

/*esta funcion se debe declarar para cada modelo para que procese sus datos*/
List<Usuario> CambiaListaUsuarios(QuerySnapshot query) {
  return query.documents.map((doc) => Usuario.GuardaUsuario(doc)).toList();
}
