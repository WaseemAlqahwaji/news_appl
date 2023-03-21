import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/view/screens/home_screen/home_screen.dart';
import 'package:news_app/features/data/dio_helper.dart';
import 'package:news_app/utils/theme.dart';
import 'core/bloc_observer.dart';
import 'features/bloc/dashboard_cubit/dashboard_cubit.dart';
import 'features/bloc/home_layout_cubit/home_layout_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeLayoutCubit()),
          BlocProvider(create: (context) => DashboardCubit()..getSports()..getBusiness()..getGeneral()..getHealth()..getTechnology()..getScience()..getAllData()),
        ],
        child: MaterialApp(
          home: const HomeLayout(),
          theme: KTheme.lightTheme,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
