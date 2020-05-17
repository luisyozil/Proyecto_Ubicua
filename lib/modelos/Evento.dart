import 'package:cloud_firestore/cloud_firestore.dart';

class Evento {
  String id;
  String nombre;
  String imagen;
  DateTime fecha;
  String idLocacion;
  String descripcion;
  String cupo;

  Evento(this.nombre);//:correo = "ejemplo@hotmail.com";

  Evento.GuardaEvento(DocumentSnapshot doc)
      : //id = doc.documentID,
        nombre = doc.data['usuario'],
        imagen = doc.data['imagen'],
        fecha = (doc.data['fecha'] as Timestamp).toDate(),
        idLocacion = doc.data['idLocacion'],
        descripcion = doc.data['descripcion'],
        cupo = doc.data['cupo'];
}

/*esta funcion se debe declarar para cada modelo para que procese sus datos*/
List<Evento> CambiaListaEventos(QuerySnapshot query) {
  return query.documents.map((doc) => Evento.GuardaEvento(doc)).toList();
}
