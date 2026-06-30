import 'package:fruits/core/utils/app_assets.dart';

class BottomNavigationBarEntity {
  final String activeIcon;
  final String inActiveIcon;
  final String text;

  BottomNavigationBarEntity({
    required this.activeIcon,
    required this.inActiveIcon,
    required this.text,
  });

  static List<BottomNavigationBarEntity> get bottomNavigationBarItems {
    return [
      BottomNavigationBarEntity(
        activeIcon: AppAssets.activeHome,
        inActiveIcon: AppAssets.inActiveHome,
        text: 'الرئيسيه ',
      ),
      BottomNavigationBarEntity(
        activeIcon: AppAssets.activeElement,
        inActiveIcon: AppAssets.inActiveElement,
        text: 'المنتجات ',
      ),
      BottomNavigationBarEntity(
        activeIcon: AppAssets.activeshopping,
        inActiveIcon: AppAssets.inactiveshopping,
        text: 'التسوق ',
      ),
      BottomNavigationBarEntity(
        activeIcon: AppAssets.activeuser,
        inActiveIcon: AppAssets.inactiveuser,
        text: 'حسابي ',
      ),
    ];
  }
}
