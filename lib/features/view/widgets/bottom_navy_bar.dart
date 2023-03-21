import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/home_layout_cubit/home_layout_cubit.dart';

class KBottomNavBar extends StatelessWidget {
  final HomeLayoutCubit object;

  const KBottomNavBar({Key? key, required this.object}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      showElevation: false,
      containerHeight: 50.h,
      items: [
        BottomNavyBarItem(
          inactiveColor: Colors.grey,
          icon: const Icon(Icons.home),
          title: const Text("Home"),
        ),
        BottomNavyBarItem(
          inactiveColor: Colors.grey,
          icon: const Icon(Icons.settings),
          title: const Text("Settings"),
        ),
      ],
      onItemSelected: (value) {
        object.onChangeBottomNav(value);
      },
      itemCornerRadius: 30.0.r,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      animationDuration: const Duration(
        milliseconds: 200,
      ),
      selectedIndex: object.selectedIndex,
    );
  }
}
