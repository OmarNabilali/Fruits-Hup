import 'package:flutter/material.dart';
import 'package:fruits/core/entitys/cart_entity.dart';
import 'package:fruits/features/auth/presentation/views/signin_view.dart';
import 'package:fruits/features/auth/presentation/views/signup_view.dart';
import 'package:fruits/features/check_out/presentation/views/check_out_view.dart';
import 'package:fruits/features/check_out/presentation/views/order_tracking_view.dart';
import 'package:fruits/features/home/presentation/views/main_view.dart';
import 'package:fruits/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruits/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.splashRoute:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.onBoardingRoute:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case SigninView.signinRoute:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignupView.signup:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case MainView.homeview:
      return MaterialPageRoute(builder: (context) => const MainView());
    case CheckOutView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            CheckOutView(cartEntity: setting.arguments as CartEntity),
      );
    case OrderTrackingView.routeName:
      return MaterialPageRoute(builder: (context) => OrderTrackingView());

    // case BestSeller.bestSellerRoute:
    //   return MaterialPageRoute(builder: (context) => const BestSeller());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
