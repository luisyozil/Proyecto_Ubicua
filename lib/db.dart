import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ubicua/modelos/Elemento.dart';
import 'package:proyecto_ubicua/modelos/Paquete.dart';
import 'package:proyecto_ubicua/modelos/Promocion.dart';
import 'modelos/Evento.dart';
import 'modelos/Usuario.dart';
import 'modelos/viajes.dart';


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

Future<void> ActualizaUsuario(String id,Usuario usuario){
  return Firestore.instance.collection('usuarios').document(id).updateData(usuario.Conversion()).catchError((e) {
    print(e);
  });
}

/************************************************************************************************************************ PARA LOS EVENTOS*/
Stream<List<Evento>> dameEventos() {
  return Firestore.instance.collection('eventos').snapshots().map(CambiaListaEventos);
}

Stream<Evento> BuscaEvento(String id){
  return Firestore.instance.collection("eventos").document(id).snapshots().map(CambiaEvento);
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

Stream<Paquete> BuscaPaquete(String id){
  return Firestore.instance.collection("paquetes").document(id).snapshots().map(CambiaPaquete);
}

/************************************************************************************************************************ PARA LOS PROMOCIONES*/
Stream<List<Promocion>> damePromociones() {
  return Firestore.instance.collection('promociones').snapshots().map(CambiaListaPromociones);
}

Stream<Promocion> BuscaPromocion(String id){
  return Firestore.instance.collection("promociones").where("idPaquete", isEqualTo: id).snapshots().map(EncuentraPromocion);
}

Future<void> EliminaPromocion(String id){
  return Firestore.instance.collection('promociones').document(id).delete();
}

/************************************************************************************************************************ PARA LA LISTA DE DESEOS*/
Stream<List<Elemento>> dameElementos(String id) {
  return Firestore.instance.collection('elementos').where("IdUsuario", isEqualTo: id).snapshots().map(CambiaListaElementos);
}

Future<void> GuardaElemento(Elemento elemento){
  return Firestore.instance.collection('elementos').document().setData(elemento.Conversion());
}

Future<void> EliminaElemento(String id){
  return Firestore.instance.collection('elementos').document(id).delete();
}

/************************************************************************************************************************ PARA Mis Viajes*/
Stream<List<Viaje>> dameViajes(String id) {
  return Firestore.instance.collection('misviajes').where("IdUsuario", isEqualTo: id).snapshots().map(CambiaListaViajes);
}

Future<void> GuardaViaje(Viaje viaje){
  return Firestore.instance.collection('elementos').document().setData(viaje.Conversion());
}