import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/view/screens/dashbaord_screen/dashboard_screen.dart';
import '../../view/screens/settings_screen/settings_screens.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  void onChangeBottomNav(int value)
  {
    selectedIndex = value;
    emit(HomeLayoutChangeBottomNav());
  }

  List<Widget> homeScreens =
  [
    const DashBoardScreen(),
    const SettingsScreen(),
  ];
}
