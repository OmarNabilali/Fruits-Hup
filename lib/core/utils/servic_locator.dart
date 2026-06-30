import 'package:fruits/core/services/firebase_auth_servic.dart';
import 'package:fruits/core/services/firestore_service.dart';
import 'package:fruits/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setup() {
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServic: FirebaseAuthServic(),
      databaseService: FirestoreService(),
    ),
  );
}
