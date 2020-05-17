import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  //String id;
  String nombre;
  String apellido;
  String imagen;

  Usuario(this.nombre);//:correo = "ejemplo@hotmail.com";

  Map<String, dynamic> Conversion() => {
    'usuario': nombre,
    'apellido': apellido,
    'imagen': imagen,
  };

  Usuario.GuardaUsuario(DocumentSnapshot doc)
      : //id = doc.documentID,
        nombre = doc.data['usuario'],
        apellido = doc.data['apellido'],
        imagen = doc.data['imagen'];
        //correo = doc.data['correo'];
}

/*esta funcion se debe declarar para cada modelo para que procese sus datos*/
List<Usuario> CambiaListaUsuarios(QuerySnapshot query) {
  return query.documents.map((doc) => Usuario.GuardaUsuario(doc)).toList();
}
