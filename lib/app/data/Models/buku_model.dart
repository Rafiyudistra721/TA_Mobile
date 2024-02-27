// ignore_for_file: non_constant_identifier_names


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/database.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';

class BukuModel {
  String? id;
  String? judul;
  String? penulis;
  String? coverBuku;
  String? penerbit;
  int? jumlah;
  int? tahunTerbit;
  String? sinopsis;
  String? kategoriId;

  BukuModel(
      {this.id,
      this.judul,
      this.penulis,
      this.coverBuku,
      this.penerbit,
      this.jumlah,
      this.tahunTerbit,
      this.sinopsis,
      this.kategoriId});

  BukuModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return BukuModel(
      id: doc.id,
      judul: json!['judul'] as String?,
      penulis: json['penulis'] as String?,
      coverBuku: json['coverBuku'] as String?,
      penerbit: json['penerbit'] as String?,
      jumlah: json['jumlah'] as int?,
      tahunTerbit: json['tahunTerbit'] as int?,
      sinopsis: json['sinopsis'] as String?,
      kategoriId: json["kategoriId"] as String?,
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'judul': judul,
        "penulis": penulis,
        "coverBuku": coverBuku,
        "penerbit": penerbit,
        "jumlah": jumlah,
        "tahunTerbit": tahunTerbit,
        "sinopsis": sinopsis,
        "kategoriId": kategoriId
      };

  Database db = Database(
      collectionReference: firebaseFirestore.collection(bukuCollection),
      storageReference: firebaseStorage.ref(bukuCollection));

  Future<BukuModel> save() async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    return this;
    }

  Future delete() async {
    (id == null) ? toast("Error Invalid ID") : await db.delete(id!, url: coverBuku);
  }

  Stream<List<BukuModel>> streamList() async* {
  var Query = db.collectionReference;
  yield* Query.snapshots().map((query) {
    List<BukuModel> list = [];
    for (var doc in query.docs) {
      list.add(
        BukuModel().fromJson(
          doc,
        ),
      );
    }
    return list;
  });
}
}
