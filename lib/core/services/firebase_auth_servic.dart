import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/errors/exceptions.dart';

class FirebaseAuthServic {
  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(
          message: 'The account already exists for that email',
        );
      } else {
        throw CustomExceptions(message: 'oops,please try again');
      }
    } catch (e) {
      throw CustomExceptions(message: e.toString());
    }
  }

  Future<User> signinUserWithEmailAnPassword({
    required String email,
    required String Password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: Password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomExceptions(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions(
          message: 'Wrong password provided for that user.',
        );
      } else {
        throw CustomExceptions(message: e.code);
      }
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
