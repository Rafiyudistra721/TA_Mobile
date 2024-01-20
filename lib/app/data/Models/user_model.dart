// ignore_for_file: avoid_print

import "dart:io";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';
import 'package:ta_mobile/app/data/database.dart';

class UserModel {
  String? id;
  String? username;
  String? email;
  String? image;
  String? adress;
  DateTime? createdAt;
  String? level;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.image,
      this.adress,
      this.createdAt,
      this.level});

  UserModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return UserModel(
        id: doc.id,
        username: json?['username'],
        email: json?['email'],
        image: json?['image'] ?? "",
        adress: json?['address'],
        createdAt: (json?['createdAt'] as Timestamp?)?.toDate(),
        level: json?['level']);
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'username': username,
        'email': email,
        'image': image,
        'address': adress,
        'createdAt': createdAt,
        'level': level
      };

  Database db = Database(
      collectionReference: firebaseFirestore.collection(
        usersCollection,
      ),
      storageReference: firebaseStorage.ref(usersCollection));

  Future<UserModel> save({File? file}) async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (file != null && id != null) {
      image = await db.upload(id: id!, file: file);
      db.edit(toJson);
    }
    return this;
  }

  Stream<UserModel> streamList(String id) async* {
    yield* db.collectionReference.doc(id).snapshots().map((event) {
      print("event id = ${event.id}");
      return fromJson(event);
    });
  }

  Stream<List<UserModel>> allstreamList() async* {
    yield* db.collectionReference.snapshots().map((query) {
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
