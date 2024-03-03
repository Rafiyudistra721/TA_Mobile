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
      userId: json!['userId'] as String?,
      bukuId: json['bukuId'] as String?,
      tanggalPinjam: (json['tanggalPinjam'] as Timestamp).toDate(),
      tanggalKembali: (json['tanggalKembali'] as Timestamp).toDate(),
      statusPinjam: json['statusPinjam'] as String?,
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'userId': userId,
        "bukuId": bukuId,
        "tanggalPinjam": tanggalPinjam,
        "tanggalKembali": tanggalKembali,
        "statusPinjam": statusPinjam,
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

  Stream<List<PinjamModel>> bukuDipinjamStreamList() async* {
    var Query = db.collectionReference;
    yield* Query
    .where("statusPinjam", isEqualTo: "Dipinjam")
    .snapshots()
    .map((query) {
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
  Stream<List<PinjamModel>> bukuTerlambatStreamList() async* {
    var Query = db.collectionReference;
    yield* Query
    .where("statusPinjam", isEqualTo: "Terlambat")
    .snapshots()
    .map((query) {
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
