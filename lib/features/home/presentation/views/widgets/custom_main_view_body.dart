import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/cart_cubit/cart_item_cubit.dart';

class CustomMainViewBody extends StatelessWidget {
  const CustomMainViewBody({
    super.key,
    required this.selectedIndex,
    required this.pages,
  });

  final int selectedIndex;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: selectedIndex, children: pages);
  }
}
