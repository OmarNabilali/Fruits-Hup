import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper_functions/shared_prefrences.dart';
import 'package:fruits/core/utils/constant.dart';

import 'package:fruits/core/utils/widgets/custom_button.dart';
import 'package:fruits/core/utils/widgets/custom_text_field.dart';
import 'package:fruits/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits/features/auth/presentation/views/custom_signin_using_other_methods.dart';
import 'package:fruits/features/auth/presentation/views/signup_view.dart';
import 'package:fruits/features/home/presentation/views/main_view.dart';

class CustomSigninViewBody extends StatefulWidget {
  const CustomSigninViewBody({super.key});

  @override
  State<CustomSigninViewBody> createState() => _CustomSigninViewBodyState();
}

class _CustomSigninViewBodyState extends State<CustomSigninViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool obscureText = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(height: 10),
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              controller: email,
              hintText: 'ألبريد ألالكتروني ',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              obcureText: obscureText,
              textInputType: TextInputType.visiblePassword,
              controller: password,
              hintText: 'كلمه ألمرور',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: obscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 13),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'نسيت كلمه المرور ؟',
                style: TextStyle(
                  color: Color(0xff2D9F5D),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 35),

            CustomButton(
              buttonName: 'تسجيل ألدخول',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await BlocProvider.of<SigninCubit>(
                    context,
                  ).SigninUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  await Prefs.setBool(isUserSeenLoginView, true);
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'لا تمتلك حساب؟',
                  style: TextStyle(color: Color(0xff1B5E37), fontSize: 16),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignupView.signup);
                  },
                  child: const Text(
                    'قم بانشاء حساب',
                    style: TextStyle(color: Color(0xff1B5E37), fontSize: 16),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const CustomSigninWithSocail(),
          ],
        ),
      ),
    );
  }
}
