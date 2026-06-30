import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/services/database_service.dart';

class FirestoreService extends DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var field = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(field, descending: descending);
        }

        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      log('result : ${result.docs.length}');
      return result.docs.map((e) {
        return {
          ...e.data() as Map<String, dynamic>,
          'id': e.id, // 👈 أهم سطر
        };
      }).toList();
    }
  }
}
