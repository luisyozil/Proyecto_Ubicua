import 'package:cloud_firestore/cloud_firestore.dart';

class Evento {
  String id;
  String nombre;
  String imagen;
  DateTime fecha;
  String idLocacion;
  String descripcion;
  String cupo;
  String Categoria;
  int no_resenas;
  int interesados;

  Evento(this.nombre);//:correo = "ejemplo@hotmail.com";

  Evento.GuardaEvento(DocumentSnapshot doc)
      : //id = doc.documentID,
        nombre = doc.data['nombre'],
        imagen = doc.data['imagen'],
        fecha = (doc.data['fecha'] as Timestamp).toDate(),
        idLocacion = doc.data['idLocacion'],
        descripcion = doc.data['descripcion'],
        cupo = doc.data['cupo'],
        Categoria = doc.data['categorias'],
        no_resenas = doc.data['no_reseñas'],
        interesados = doc.data['interesados'];
}

/*esta funcion se debe declarar para cada modelo para que procese sus datos*/
List<Evento> CambiaListaEventos(QuerySnapshot query) {
  return query.documents.map((doc) => Evento.GuardaEvento(doc)).toList();
}
