// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';
import 'package:ta_mobile/app/data/database.dart';

class UserModel {
  String? id;
  String? username;
  String? email;
  String? alamat;
  DateTime? dibuatTanggal;
  String? level;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.alamat,
      this.dibuatTanggal,
      this.level});

  UserModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return UserModel(
        id: doc.id,
        username: json?['username'],
        email: json?['email'],
        alamat: json?['alamat'],
        dibuatTanggal: (json?['dibuatTanggal'] as Timestamp?)?.toDate(),
        level: json?['level']);
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'username': username,
        'email': email,
        'alamat': alamat,
        'dibuatTanggal': dibuatTanggal,
        'level': level
      };

  Database db = Database(
      collectionReference: firebaseFirestore.collection(
        usersCollection,
      ),
      storageReference: firebaseStorage.ref(usersCollection));

  Future<UserModel> save() async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    return this;
  }

  Stream<UserModel> streamList(String id) async* {
    yield* db.collectionReference.doc(id).snapshots().map((event) {
      print("event id = ${event.id}");
      return fromJson(event);
    });
  }

  Stream<List<UserModel>> petugasStreamList() async* {
    yield* db.collectionReference
    .where("level", isEqualTo: "Petugas")
    .snapshots()
    .map((query) {
      List<UserModel> list = [];
      for (var doc in query.docs) {
        list.add(
          UserModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
  Stream<List<UserModel>> peminjamStreamList() async* {
    yield* db.collectionReference
    .where("level", isEqualTo: "Peminjam")
    .snapshots()
    .map((query) {
      List<UserModel> list = [];
      for (var doc in query.docs) {
        list.add(
          UserModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
  Stream<List<UserModel>> allStreamList() async* {
    yield* db.collectionReference
    .snapshots()
    .map((query) {
      List<UserModel> list = [];
      for (var doc in query.docs) {
        list.add(
          UserModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
