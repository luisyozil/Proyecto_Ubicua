import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ubicua/modelos/Paquete.dart';
import 'modelos/Evento.dart';
import 'modelos/Usuario.dart';


//esta funcion trae todos los documentos de la base de datos usuarios **REVISAR EL MODELO USUARIO**
Stream<List<Usuario>> dameUsuarios() {
  return Firestore.instance.collection('usuarios').orderBy('usuario').snapshots().map(CambiaListaUsuarios);
}

Stream<Usuario> BuscaUsuario(String id){
  return Firestore.instance.collection("usuarios").document(id).snapshots().map(CambiaUsuario);
}

Future<void> GuardaUsuario(Usuario usuario){
  return Firestore.instance.collection('usuarios').document(usuario.id).setData(usuario.Conversion());
}


/************************************************************************************************************************ PARA LOS EVENTOS*/
Stream<List<Evento>> dameEventos() {
  return Firestore.instance.collection('eventos').snapshots().map(CambiaListaEventos);
}

class SearchService {
  searchByName() {
    return Firestore.instance
        .collection('eventos').getDocuments();
  }
}

/************************************************************************************************************************ PARA LOS PAQUETES*/

Stream<List<Paquete>> damePaquetes(Evento evento) {
  return Firestore.instance.collection('paquetes').where("idEvento",isEqualTo: evento.id).snapshots().map(CambiaListaPaquetes);
}