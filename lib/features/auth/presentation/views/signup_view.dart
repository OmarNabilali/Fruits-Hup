import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/app_assets.dart';
import 'package:fruits/core/utils/functions/show_snack_bar_widget.dart';
import 'package:fruits/core/utils/servic_locator.dart';
import 'package:fruits/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits/features/auth/presentation/cubits/signup_cubit/signup_state.dart';
import 'package:fruits/features/auth/presentation/views/custom_signup_view_body.dart';
import 'package:fruits/features/auth/presentation/views/signin_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String signup = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          text: 'حساب جديد',
          leadingWidget: Image.asset(AppAssets.arrow),
        ),

        body: Builder(
          builder: (context) => BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccessState) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  SigninView.signinRoute,
                  (route) => false,
                );
              } else if (state is SignupFailureState) {
                return showSnackBarWidget(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is SignupLoadingState,
                child: const CustomSignupViewBody(),
              );
            },
          ),
        ),
      ),
    );
  }
}
