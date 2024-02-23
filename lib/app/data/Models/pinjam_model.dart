// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/database.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';

class PinjamModel {
  String? id;
  String? userId;
  String? bukuId;
  DateTime? tanggalPinjam;
  DateTime? tanggalKembali;
  String? statusPinjam;

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
      userId: json!['User'] as String?,
      bukuId: json['Buku'] as String?,
      tanggalPinjam: (json['Tanggal Pinjam'] as Timestamp).toDate(),
      tanggalKembali: (json['Tanggal Kembali'] as Timestamp).toDate(),
      statusPinjam: json['Status'] as String?,
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'User': userId,
        "Buku": bukuId,
        "TanggalPinjam": tanggalPinjam,
        "TanggalKembali": tanggalKembali,
        "Status": statusPinjam,
      };

  Database db = Database(
      collectionReference: firebaseFirestore.collection(pinjamCollection),
      storageReference: firebaseStorage.ref(pinjamCollection));

  Future<PinjamModel> save({File? file}) async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    return this;
  }

  Future delete() async {
    (id == null)
        ? toast("Error Invalid ID"): await db.delete(id!);
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
