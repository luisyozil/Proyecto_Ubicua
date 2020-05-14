import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ubicua/modelos/Usuario.dart';


//esta funcion trae todos los documentos de la base de datos usuarios **REVISAR EL MODELO USUARIO**
Stream<List<Usuario>> dameUsuarios() {
  return Firestore.instance.collection('usuarios').orderBy('usuario').snapshots().map(CambiaListaUsuarios);
}

Future<void> GuardaUsuario(Usuario usuario){
  return Firestore.instance.collection('usuarios').add(usuario.Conversion());
}