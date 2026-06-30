import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_cubit.dart';

import 'package:fruits/features/home/presentation/views/cart_view.dart';

import 'package:fruits/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_main_view_body.dart';

import 'package:fruits/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruits/features/home/presentation/views/prdoucts_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const homeview = 'homeView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  List<Widget> pages = [
    CustomHomeViewBody(),
    PrdouctsView(),
    CartView(),
    Center(child: Text("ddddd")),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CartItemCubit(),
        child: CustomMainViewBody(selectedIndex: selectedIndex, pages: pages),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
