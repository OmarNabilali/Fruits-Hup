// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fruits/core/utils/app_assets.dart';
// import 'package:fruits/core/utils/widgets/custom_app_bar.dart';
// import 'package:fruits/features/auth/presentation/views/signin_view.dart';
// import 'package:fruits/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
// import 'package:fruits/features/home/presentation/views/widgets/custom_card_product.dart';

// class BestSeller extends StatelessWidget {
//   const BestSeller({super.key});
//   static const bestSellerRoute = 'bestSeller';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CustomBottomNavigationBar(),
//       appBar: CustomAppBarWidget(
//         leading: AppAssets.arrow,
//         action: AppAssets.add,
//         title: 'الاكثر مبيعا ',
//       ),

//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(child: SizedBox(height: 35)),
//           SliverToBoxAdapter(
//             child: Text('الاكثر مبيعا ', style: TextStyle(fontSize: 35)),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.all(16),
//             sliver: SliverGrid(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) => const CustomCardProduct(productEntity: ,),
//                 childCount: 10,
//               ),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 childAspectRatio: 100 / 150,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomAppBarWidget extends StatelessWidget
//     implements PreferredSizeWidget {
//   const CustomAppBarWidget({
//     super.key,
//     required this.leading,
//     required this.action,
//     required this.title,
//   });
//   final String leading, action, title;
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       leading: Image.asset(leading),
//       actions: [
//         IconButton(
//           onPressed: () async {
//             await FirebaseAuth.instance.signOut();
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               SigninView.signinRoute,
//               (route) => false,
//             );
//           },
//           icon: Icon(Icons.output_outlined),
//         ),
//       ],
//       title: Text(title),
//     );
//   }

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size(20, 50);
// }
