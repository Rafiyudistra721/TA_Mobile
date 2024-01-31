import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/database.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';

class DendaModel {
  String? id;
  String? pinjamId;
  String? userId;
  int? jumlahDenda;

  DendaModel({
    this.id,
    this.pinjamId,
    this.userId,
    this.jumlahDenda,
  });

  DendaModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return DendaModel(
      id: doc.id,
      pinjamId: json!['ID Pinjam'] as String?,
      userId: json['ID User'] as String?,
      jumlahDenda: json['Total Denda'] as int?,
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'ID Pinjam': pinjamId,
        'peminjam':userId,
        'Total Denda':jumlahDenda,
      };

  Database get db => Database(
      collectionReference: firebaseFirestore.collection(kategoriCollection),
      storageReference: firebaseStorage.ref(kategoriCollection));

  Future<DendaModel> save() async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    return this;
  }

  Future delete() async {
    (id == null) ? toast("Error Invalid ID") : await db.delete(id!);
  }

  Stream<List<DendaModel>> streamList() async* {
    var Query = db.collectionReference;
    yield* Query.snapshots().map((query) {
      List<DendaModel> list = [];
      for (var doc in query.docs) {
        list.add(
          DendaModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
