import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mintic_un_todo_core/data/entities/to_do.dart';
import 'package:mintic_un_todo_core/domain/models/to_do.dart';

class FirestoreDatabase {
  // ToDoEntity: Entidad del modelo ToDo - .fromRecord(): convierte un Map a un ToDo;
  CollectionReference<Map<String, dynamic>> get database =>
      FirebaseFirestore.instance.collection("historicochat");

  Stream<List<ToDo>> get toDoStream {
    return database.snapshots().map((event) {
      // TODO: Usando ToDoEntity y .map() convierte los documents en event a ToDos
      return event.docs
          .map((record) => ToDoEntity.fromRecord(record.data()))
          .toList();
    });
  }

  Future<void> delete({required String uuid}) async {
    // TODO: Usando database crea una referencia a uuid y eliminala.
    await database.doc(uuid).delete();
  }

  Future<void> save({required ToDo data}) async {
    // TODO: Usando database crea una referencia a data.uuid y guardala.
    await database.doc(data.uuid).set(data.record);
  }

  Future<ToDo> read({required String uuid}) async {
    // TODO: 1. Usando database crea una referencia a uuid y leela.
    // TODO: 2. Convierte los datos en el snapshot a un ToDo;
    final snapshot = await database.doc(uuid).get();
    return ToDoEntity.fromRecord(snapshot.data()!);
  }

  Future<List<ToDo>> readAll() async {
    final snapshot = await database.get();
    return snapshot.docs
        .map((record) => ToDoEntity.fromRecord(record.data()))
        .toList();
    // TODO: Usando ToDoEntity y .map() convierte los documents en snapshot a ToDos
  }

  Future<void> clear({required List<ToDo> toDos}) async {
    // TODO: Usando la lista de toDos, database y for_in , crea una referencia a cada documento y eliminala.
    for (var toDo in toDos) {
      await database.doc(toDo.uuid).delete();
    }
  }

  Future<void> update({required ToDo data}) async {
    // TODO: Usando database crea una referencia a data.uuid y actualizala.
    await database.doc(data.uuid).update(data.record);
  }
}
