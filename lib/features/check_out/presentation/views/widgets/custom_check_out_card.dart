import 'package:flutter/material.dart';

class CustomCheckOutCard extends StatelessWidget {
  const CustomCheckOutCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.onTap,
    required this.selectIndex,
    required this.index,
  });
  final String title;
  final String subtitle;
  final String price;
  final void Function()? onTap;

  final int selectIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == selectIndex;

    return Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffF9FAFA),
        border: isSelected
            ? Border.all(width: 1, color: Color(0xff1B5E37))
            : Border(),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,

                  child: isSelected
                      ? Image.asset('assets/images/select.png')
                      : Image.asset('assets/images/Ellipse7188.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 8),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text(title), Text(subtitle)],
                    ),
                  ),
                ),
              ],
            ),
            Text(price),
          ],
        ),
      ),
    );
  }
}
