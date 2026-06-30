import 'package:flutter/cupertino.dart';
import 'package:fruits/features/home/domain/entitis/bottom_navigation_bar_entity.dart';

import 'custom_active_item.dart';
import 'custom_inactive_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CustomActiveIcon(
            text: bottomNavigationBarEntity.text,
            img: bottomNavigationBarEntity.activeIcon,
          )
        : CustomInactiveIcon(img: bottomNavigationBarEntity.inActiveIcon);
  }
}
