import 'package:flutter/material.dart';
import 'package:fruits/features/home/domain/entitis/bottom_navigation_bar_entity.dart';

import 'navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });
  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarEntity> list =
        BottomNavigationBarEntity.bottomNavigationBarItems;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: list.asMap().entries.map((e) {
          var entity = e.value;
          var index = e.key;

          return GestureDetector(
            onTap: () {
              onItemTapped(index);
            },
            child: NavigationBarItem(
              isSelected: selectedIndex == index,
              bottomNavigationBarEntity: entity,
            ),
          );
        }).toList(),
      ),
    );
  }
}
