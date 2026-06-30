import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/constant.dart';
import 'package:fruits/core/utils/functions/show_snack_bar_widget.dart';
import 'package:fruits/core/utils/widgets/custom_button.dart';
import 'package:fruits/core/utils/widgets/custom_check_box.dart';
import 'package:fruits/core/utils/widgets/custom_text_field.dart';
import 'package:fruits/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits/features/auth/presentation/views/signin_view.dart';

class CustomSignupViewBody extends StatefulWidget {
  const CustomSignupViewBody({super.key});
  @override
  State<CustomSignupViewBody> createState() => _CustomSignupViewBodyState();
}

class _CustomSignupViewBodyState extends State<CustomSignupViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isChecked = false;
  GlobalKey<FormState> formState = GlobalKey();
  bool isVisibleText = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Form(
        key: formState,
        child: ListView(
          children: [
            const SizedBox(height: 15),
            CustomTextField(controller: name, hintText: 'الاسم كامل'),
            const SizedBox(height: 12),
            CustomTextField(controller: email, hintText: 'ألبريد ألالكتروني'),
            const SizedBox(height: 12),
            CustomTextField(
              obcureText: isVisibleText,
              controller: password,
              hintText: 'كلمه ألمرور',
              suffixIcon: IconButton(
                onPressed: () {
                  isVisibleText = !isVisibleText;
                  setState(() {});
                },
                icon: isVisibleText
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    isChecked = !isChecked;
                    print('ndd');
                    setState(() {});
                  },
                  child: CustomCheckBox(isChecked: isChecked),
                ),
                SizedBox(width: 10),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'من خلال إنشاء حساب ، فإنك توافق على الشروط والأحكام الخاصة بنا',
                      maxLines: 2,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                // SvgPicture.asset(AppAssets.checkBox),
              ],
            ),
            const SizedBox(height: 25),
            CustomButton(
              buttonName: 'إنشاء حساب جديد',
              onPressed: () async {
                if (formState.currentState!.validate()) {
                  if (isChecked) {
                    await BlocProvider.of<SignupCubit>(
                      context,
                    ).createUserWithEmailAndPassword(
                      name: name.text,
                      email: email.text,
                      password: password.text,
                    );
                  } else {
                    showSnackBarWidget(
                      context,
                      'يجب عليك الموافقه علي الشروط والاحكام الخاصه بنا ',
                    );
                  }
                }
              },
            ),

            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      SigninView.signinRoute,
                    );
                  },
                  child: const Text(
                    'تسجيل الدخول ',
                    style: TextStyle(color: kcolor),
                  ),
                ),

                const Text('تمتلك حساب بالفعل؟'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
