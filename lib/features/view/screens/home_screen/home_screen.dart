import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/home_layout_cubit/home_layout_cubit.dart';
import '../../widgets/bottom_navy_bar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeLayoutCubit object = HomeLayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
            shape: const Border(
              bottom: BorderSide(
                color: Colors.blue,
                width: 4,
              ),
            ),
          ),
          body: object.homeScreens[object.selectedIndex],
          bottomNavigationBar: KBottomNavBar(
            object: object,
          ),
        );
      },
    );
  }
}
