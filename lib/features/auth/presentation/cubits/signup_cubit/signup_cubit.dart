import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/auth/presentation/cubits/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitState());

  AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoadingState());
    var result = await authRepo.createUserWithEmailAndPassowrd(
      email: email,
      password: password,
      name: name,
    );

    result.fold(
      (failure) => emit(SignupFailureState(errMessage: failure.errMessage)),
      (userEntities) => emit(SignupSuccessState(userEntitis: userEntities)),
    );
  }
}
