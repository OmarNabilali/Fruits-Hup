import 'package:fruits/features/auth/domain/entitits/user_entitis.dart';

class SignupState {}

class SignupInitState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {
  final UserEntitis userEntitis;

  SignupSuccessState({required this.userEntitis});
}

class SignupFailureState extends SignupState {
  final String errMessage;

  SignupFailureState({required this.errMessage});
}
