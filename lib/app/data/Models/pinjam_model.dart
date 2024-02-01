import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/database.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';

class PinjamModel {
  String? id;
  String? userId;
  String? bukuId;
  String? tanggalPinjam;
  String? tanggalKembali;
  int? statusPinjam;

  PinjamModel({
    this.id,
    this.userId,
    this.bukuId,
    this.tanggalPinjam,
    this.tanggalKembali,
    this.statusPinjam,
  });

  PinjamModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return PinjamModel(
      id: doc.id,
      userId: json!['Judul'] as String?,
      bukuId: json['Penulis'] as String?,
      tanggalPinjam: json['CoverBuku'] as String?,
      tanggalKembali: json['Penerbit'] as String?,
      statusPinjam: json['Tahun Terbit'] as int?,
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'Judul': userId,
        "Penulis": bukuId,
        "CoverBuku": tanggalPinjam,
        "Penerbit": tanggalKembali,
        "Tahun Terbit": statusPinjam,
      };

  Database db = Database(
      collectionReference: firebaseFirestore.collection(bukuCollection),
      storageReference: firebaseStorage.ref(bukuCollection));

  Future<PinjamModel> save({File? file}) async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (file != null && id != null) {
      tanggalPinjam = await db.upload(id: id!, file: file);
      db.edit(toJson);
    }
    return this;
  }

  Future delete() async {
    (id == null)
        ? toast("Error Invalid ID"): await db.delete(id!, url: tanggalPinjam);
  }

  Stream<List<PinjamModel>> streamList() async* {
    var Query = db.collectionReference;
    yield* Query.snapshots().map((query) {
      List<PinjamModel> list = [];
      for (var doc in query.docs) {
        list.add(
          PinjamModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
