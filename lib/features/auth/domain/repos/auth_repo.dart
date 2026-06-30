import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failure.dart';
import 'package:fruits/features/auth/domain/entitits/user_entitis.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntitis>> createUserWithEmailAndPassowrd({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, UserEntitis>> signinUserWithEmailAnPassword({
    required String email,
    required String password,
  });
  Future addUserData({required UserEntitis user});
  Future saveUserData({required UserEntitis user});
  Future<UserEntitis> getUserData({required String uid});
}
