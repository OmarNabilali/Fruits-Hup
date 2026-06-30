import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_cubit.dart';
import 'package:fruits/core/helper_functions/on_generate_routs.dart';
import 'package:fruits/core/helper_functions/shared_prefrences.dart';
import 'package:fruits/core/utils/servic_locator.dart';
import 'package:fruits/core/utils/simple_bloc_observer.dart';
import 'package:fruits/features/auth/presentation/views/signin_view.dart';
import 'package:fruits/features/home/presentation/views/main_view.dart';
import 'package:fruits/features/splash/presentation/views/splash_view.dart';
import 'package:fruits/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setup();
  runApp(FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: MaterialApp(
        locale: const Locale('ar'), // اللغة العربية
        supportedLocales: const [Locale('ar'), Locale('en')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoutes,
        initialRoute: SplashView.splashRoute,
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // لسه بيشيك
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // لو مسجل دخول
        if (snapshot.hasData) {
          return const MainView();
        }

        // لو مش مسجل دخول
        return const SigninView();
      },
    );
  }
}
