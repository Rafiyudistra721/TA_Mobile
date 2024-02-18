// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';
import 'package:ta_mobile/app/data/database.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';

class UlasanModel {
  String? id;
  UserModel? userId;
  BukuModel? bukuId;
  String? ulasan;
  int? rating;

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
      userId: json?['Nama User'] as UserModel,
      bukuId: json?['Judul Buku'] as BukuModel,
      ulasan: json?['Ulasan'] as String,
      rating: json?['Rating'] as int,
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'Nama User': userId,
        'Judul Buku': bukuId,
        'Ulasan': ulasan,
        'Rating': rating,
      };

  Database get db => Database(
      collectionReference: firebaseFirestore.collection(ulasanCollection),
      storageReference: firebaseStorage.ref(ulasanCollection));

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
