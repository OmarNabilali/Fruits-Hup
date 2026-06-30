import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/app_assets.dart';
import 'package:fruits/core/utils/functions/show_snack_bar_widget.dart';
import 'package:fruits/core/utils/servic_locator.dart';
import 'package:fruits/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits/features/auth/presentation/cubits/signin_cubit/signin_state.dart';
import 'package:fruits/features/auth/presentation/views/custom_signin_view_body.dart';
import 'package:fruits/features/home/presentation/views/main_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String signinRoute = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          text: 'تسجيل الدخول ',
          leadingWidget: Image.asset(AppAssets.arrow),
        ),

        body: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainView.homeview,
                (route) => false,
              );
            } else if (state is SigninFailureState) {
              showSnackBarWidget(context, state.errMessage);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SigninLoadingState,
              child: const CustomSigninViewBody(),
            );
          },
        ),
      ),
    );
  }
}
