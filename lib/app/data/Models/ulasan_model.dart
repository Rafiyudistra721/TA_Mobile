// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/database.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';

class UlasanModel {
  String? id;
  String? userId;
  String? bukuId;
  String? ulasan;
  num? rating;

  UlasanModel({
    this.id,
    this.userId,
    this.bukuId,
    this.ulasan,
    this.rating,
    
  });

  UlasanModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return UlasanModel(
      id: doc.id,
      userId: json?['userId'] as String,
      bukuId: json?['bukuId'] as String,
      ulasan: json?['ulasan'] as String,
      rating: json?['rating'] as double,
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'userId': userId,
        'bukuId': bukuId,
        'ulasan': ulasan,
        'rating': rating,
      };

  Database get db => Database(
      collectionReference: firebaseFirestore
      .collection(bukuCollection)
      .doc(bukuId)
      .collection(ulasanCollection),
      storageReference: firebaseStorage.ref(bukuCollection).child(ulasanCollection));

  Future<UlasanModel> save() async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    return this;
  }

  Future delete() async {
    (id == null) ? toast("Error Invalid ID") : await db.delete(id!);
  }

  Stream<List<UlasanModel>> streamList() async* {
    var Query = db.collectionReference;
    yield* Query.snapshots().map((query) {
      List<UlasanModel> list = [];
      for (var doc in query.docs) {
        list.add(
          UlasanModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
