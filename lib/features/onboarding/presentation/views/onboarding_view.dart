import 'package:flutter/material.dart';
import 'package:fruits/core/helper_functions/shared_prefrences.dart';
import 'package:fruits/core/utils/app_assets.dart';
import 'package:fruits/core/utils/constant.dart';
import 'package:fruits/core/utils/widgets/custom_button.dart';
import 'package:fruits/features/auth/presentation/views/signin_view.dart';
import 'package:fruits/features/onboarding/presentation/views/widgets/custom_onboarding_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static const onBoardingRoute = 'onBoardingRoute';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int index = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: index == 0
                ? TextButton(
                    onPressed: () async {
                      Navigator.pushReplacementNamed(
                        context,
                        SigninView.signinRoute,
                      );
                      await Prefs.setBool(isOnBoardingViewSeen, true);
                    },
                    child: const Text('تخط'),
                  )
                : const SizedBox(),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (v) {
                setState(() {
                  index = v;
                });
                print(index);
              },
              controller: controller,

              children: [
                const CustomOnboardingViewBody(
                  img: AppAssets.pineapple,
                  title: 'ابحث وتسوق',

                  content:
                      "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
                ),

                const CustomOnboardingViewBody(
                  img: AppAssets.fruitsBasket,
                  title: 'Fruit',
                  subtitle: 'Hup',
                  message: 'مرحبًا بك في',
                  titleColor: Colors.green,
                  content:
                      "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
                  subtitleColor: Colors.orange,
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.ellipseGreen, height: 15),
              const SizedBox(width: 12),
              index == 0
                  ? Image.asset(AppAssets.ellipsWhite, height: 15)
                  : Image.asset(AppAssets.ellipseGreen, height: 15),
            ],
          ),
          const SizedBox(height: 15),
          Visibility(
            visible: index == 1 ? true : false,
            child: CustomButton(
              buttonName: 'أبدا ألان',
              onPressed: () async {
                Navigator.pushReplacementNamed(context, SigninView.signinRoute);
                await Prefs.setBool(isOnBoardingViewSeen, true);
              },
            ),
          ),
          index == 0 ? const SizedBox(height: 50) : const SizedBox(height: 20),
        ],
      ),
    );
  }
}
