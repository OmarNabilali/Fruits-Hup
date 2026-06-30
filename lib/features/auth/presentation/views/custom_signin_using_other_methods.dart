import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_assets.dart';
import 'package:fruits/core/utils/widgets/custom_other_login.dart';

class CustomSigninWithSocail extends StatelessWidget {
  const CustomSigninWithSocail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 150, height: 2, color: Colors.grey),
            SizedBox(width: 6),

            const Text('أو'),
            const SizedBox(width: 6),
            Container(width: 150, height: 2, color: Colors.grey),
          ],
        ),
        const SizedBox(height: 15),

        CustomOtherLogin(
          onTap: () async {},
          image: AppAssets.arrow,
          loginName: 'تسجيل بواسطه جوجل',
        ),
      ],
    );
  }
}
