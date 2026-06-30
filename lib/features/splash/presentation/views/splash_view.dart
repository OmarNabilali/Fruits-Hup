import 'package:flutter/material.dart';
import 'package:fruits/core/helper_functions/shared_prefrences.dart';
import 'package:fruits/core/services/firebase_auth_servic.dart';
import 'package:fruits/core/utils/app_assets.dart';
import 'package:fruits/core/utils/constant.dart';
import 'package:fruits/features/auth/presentation/views/signin_view.dart';
import 'package:fruits/features/home/presentation/views/main_view.dart';
import 'package:fruits/features/onboarding/presentation/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String splashRoute = 'splashRoute';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigation();
  }

  void navigation() {
    Future.delayed(const Duration(seconds: 4), () {
      final isOnboardingSeen = Prefs.getBool(isOnBoardingViewSeen) ?? false;

      final logged = FirebaseAuthServic().isLoggedIn();

      if (!isOnboardingSeen) {
        Navigator.pushReplacementNamed(context, OnBoardingView.onBoardingRoute);
      } else if (logged) {
        Navigator.pushReplacementNamed(context, MainView.homeview);
      } else {
        Navigator.pushReplacementNamed(context, SigninView.signinRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Image.asset(AppAssets.plant),

            const SizedBox(height: 100),

            Center(child: Image.asset(AppAssets.fruitsHup)),
          ],
        ),
      ),
    );
  }
}
