import 'package:flutter/material.dart';

class CustomActiveIcon extends StatelessWidget {
  const CustomActiveIcon({super.key, required this.img, required this.text});
  final String img;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 85,

      decoration: ShapeDecoration(
        color: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 30,
            width: 30,

            padding: EdgeInsets.all(5),
            decoration: ShapeDecoration(
              color: Color(0xff1B5E37),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            child: Center(child: Image.asset(img)),
          ),
          SizedBox(width: 5),
          Text(text, style: TextStyle(fontSize: 12, color: Color(0xff1B5E32))),
        ],
      ),
    );
  }
}
