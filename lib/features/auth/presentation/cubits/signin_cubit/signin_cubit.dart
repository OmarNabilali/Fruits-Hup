import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/auth/presentation/cubits/signin_cubit/signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitState());

  AuthRepo authRepo;

  Future<void> SigninUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoadingState());
    var result = await authRepo.signinUserWithEmailAnPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SigninFailureState(errMessage: failure.errMessage)),
      (userEntities) => emit(SigninSuccessState(userEntitis: userEntities)),
    );
  }
}
