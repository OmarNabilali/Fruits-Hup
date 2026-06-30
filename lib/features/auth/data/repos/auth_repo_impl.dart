import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/errors/exceptions.dart';
import 'package:fruits/core/errors/failure.dart';
import 'package:fruits/core/helper_functions/shared_prefrences.dart';
import 'package:fruits/core/services/database_service.dart';
import 'package:fruits/core/services/firebase_auth_servic.dart';
import 'package:fruits/core/utils/backend_endpoint.dart';
import 'package:fruits/core/utils/constant.dart';
import 'package:fruits/features/auth/data/models/user_model.dart';
import 'package:fruits/features/auth/domain/entitits/user_entitis.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuthServic firebaseAuthServic;
  DatabaseService databaseService;
  AuthRepoImpl({
    required this.firebaseAuthServic,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, UserEntitis>> createUserWithEmailAndPassowrd({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthServic.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntiy = UserEntitis(name: name, email: email, uid: user.uid);

      await addUserData(user: userEntiy);

      return right(userEntiy);
    } on CustomExceptions catch (e) {
      if (user == null) {
        databaseService.deleteUser();
      }
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      if (user == null) {
        databaseService.deleteUser();
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntitis>> signinUserWithEmailAnPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthServic.signinUserWithEmailAnPassword(
        email: email,
        Password: password,
      );

      var userData = await getUserData(uid: user.uid);
      await saveUserData(user: userData);
      return right(userData);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(errMessage: e.message));
    }
  }

  @override
  Future addUserData({required UserEntitis user}) async {
    await databaseService.addData(
      documentId: user.uid,
      path: BackendEndpoint.users,
      data: UserModel.fromEntity(user).toMap(),
    );
  }

  @override
  Future<UserEntitis> getUserData({required String uid}) async {
    var data = await databaseService.getData(
      path: BackendEndpoint.users,
      documentId: uid,
    );
    return UserModel.fromJson(data);
  }

  @override
  Future saveUserData({required UserEntitis user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(ksaveUserData, jsonData);
  }
}
