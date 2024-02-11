// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';
import 'package:ta_mobile/app/data/database.dart';

class KategoriModel {
  String? id;
  String? namaKategori;
  

  KategoriModel({
    this.id,
    this.namaKategori,
    
  });

  KategoriModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return KategoriModel(
      id: doc.id,
      namaKategori: json!['namaKategori'] as String?,
      
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'namaKategori': namaKategori,
        
      };

  Database get db => Database(
      collectionReference: firebaseFirestore
          .collection(kategoriCollection),
      storageReference:
          firebaseStorage.ref(kategoriCollection));

  Future<KategoriModel> save() async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);

    return this;
  }

  Future delete() async {
    (id == null) ? toast("Error Invalid ID") : await db.delete(id!);
  }

  Stream<List<KategoriModel>> streamList() async* {
    var Query = db.collectionReference;
    yield* Query.snapshots().map((query) {
      List<KategoriModel> list = [];
      for (var doc in query.docs) {
        list.add(
          KategoriModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
