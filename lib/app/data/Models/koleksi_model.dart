// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/database.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';

class KoleksiModel {
  String? id;
  String? bukuId;
  String? userId;

  KoleksiModel({
    this.id,
    this.bukuId,
    this.userId,
  });

  KoleksiModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return KoleksiModel(
      id: doc.id,
      bukuId: json!['Buku'] as String?,
      userId: json['User'] as String?,
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'Buku': bukuId,
        'User': userId,
      };

  Database get db => Database(
      collectionReference: firebaseFirestore.collection(bookmarkCollection),
      storageReference: firebaseStorage.ref());

  Future<KoleksiModel> save() async {
    id == null ? id = await db.add(toJson) : await db.delete(id!);

    return this;
  }

  Future delete() async {
    (id == null) ? toast("Error Invalid ID") : await db.delete(id!);
  }

  Stream<List<KoleksiModel>> streamlist() async* {
    var Query = db.collectionReference;
    yield* Query.snapshots().map((query) {
      List<KoleksiModel> list = [];
      for (var doc in query.docs) {
        list.add(
          KoleksiModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
