// ignore_for_file: non_constant_identifier_names

import 'dart:io';

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
  int? tahunTerbit;
  String? sinopsis;
  String? kategoriId;

  BukuModel(
      {this.id,
      this.judul,
      this.penulis,
      this.coverBuku,
      this.penerbit,
      this.tahunTerbit,
      this.sinopsis,
      this.kategoriId});

  BukuModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return BukuModel(
      id: doc.id,
      judul: json!['Judul'] as String?,
      penulis: json['Penulis'] as String?,
      coverBuku: json['CoverBuku'] as String?,
      penerbit: json['Penerbit'] as String?,
      tahunTerbit: json['Tahun Terbit'] as int?,
      sinopsis: json['Sinopsis'] as String?,
      kategoriId: json["Kategori"] as String?,
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'Judul': judul,
        "Penulis": penulis,
        "CoverBuku": coverBuku,
        "Penerbit": penerbit,
        "Tahun Terbit": tahunTerbit,
        "Sinopsis": sinopsis,
        "Kategori": kategoriId
      };

  Database db = Database(
      collectionReference: firebaseFirestore.collection(bukuCollection),
      storageReference: firebaseStorage.ref(bukuCollection));

  Future<BukuModel> save({File? file}) async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (file != null && id != null) {
      coverBuku = await db.upload(id: id!, file: file);
      db.edit(toJson);
    }
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
