import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String id;
  String nombre;
  String apellido;
  String imagen;
  String correo;
  Usuario(this.id,this.nombre,this.apellido,this.imagen, this.correo);//:correo = "ejemplo@hotmail.com";

  Map<String, dynamic> Conversion() => {
    'nombre': nombre,
    'apellido': apellido,
    'imagen': imagen,
    'correo': correo,
  };

  Usuario.GuardaUsuario(DocumentSnapshot doc)
      : nombre = doc.data['nombre'],
        apellido = doc.data['apellido'],
        imagen = doc.data['imagen'],
        correo = doc.data['correo'];
}

/*esta funcion se debe declarar para cada modelo para que procese sus datos*/
List<Usuario> CambiaListaUsuarios(QuerySnapshot query) {
  return query.documents.map((doc) => Usuario.GuardaUsuario(doc)).toList();
}

Usuario CambiaUsuario(DocumentSnapshot snapshot){
  print("todo ok");
  return Usuario.GuardaUsuario(snapshot);
}
