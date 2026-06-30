import 'package:fruits/features/auth/domain/entitits/user_entitis.dart';

class SigninState {}

class SigninInitState extends SigninState {}

class SigninLoadingState extends SigninState {}

class SigninSuccessState extends SigninState {
  final UserEntitis userEntitis;

  SigninSuccessState({required this.userEntitis});
}

class SigninFailureState extends SigninState {
  final String errMessage;

  SigninFailureState({required this.errMessage});
}
