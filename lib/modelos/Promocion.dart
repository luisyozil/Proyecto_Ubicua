import 'package:cloud_firestore/cloud_firestore.dart';

class Promocion {
  String id;
  String idPaquete;
  int NuevoPrecio;
  DateTime vencimiento;

  Promocion.GuardaPromocion(DocumentSnapshot doc)
      : id = doc.documentID,
        idPaquete = doc.data['idPaquete'],
        NuevoPrecio = doc.data['NuevoPrecio'],
        vencimiento = (doc.data['vencimiento'] as Timestamp).toDate();

  String get Fecha => '${vencimiento.day} / ${vencimiento.month} / ${vencimiento.year}';

}

/*esta funcion se debe declarar para cada modelo para que procese sus datos*/
List<Promocion> CambiaListaPromociones(QuerySnapshot query) {
  return query.documents.map((doc) => Promocion.GuardaPromocion(doc)).toList();
}

Promocion CambiaPromocion(DocumentSnapshot snapshot){
  return Promocion.GuardaPromocion(snapshot);
}
