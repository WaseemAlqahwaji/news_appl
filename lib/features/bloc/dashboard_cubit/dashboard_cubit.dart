import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/data/dio_helper.dart';
import 'package:url_launcher/url_launcher.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  static DashboardCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> allData = {};
  Map<String, dynamic> businessData = {};
  Map<String, dynamic> sportsData = {};
  Map<String, dynamic> generalData = {};
  Map<String, dynamic> technologyData = {};
  Map<String, dynamic> scienceData = {};
  Map<String, dynamic> healthData = {};

  List<String> category =
  [
    "business",
    "sports",
    "general",
    "science",
    "technology",
    "health",
  ];

  Future getAllData() async {
    try {
      Response response = await DioHelper.getData();
      emit(GetDataLoadingState());
      allData = response.data;
      emit(GetDataNewsDone());
      return response.data;
    } on DioError catch (error) {
      emit(GetDataNewsError());
      if (kDebugMode) {
        print(error);
      }
    }
  }
  Future getBusiness() async {
    try {
      Response response = await DioHelper.getData(category: "business");
      emit(GetDataLoadingState());
      businessData = response.data;
      emit(GetBusinessNewsDone());
      return response.data;
    } on DioError catch (error) {
      emit(GetBusinessNewsError());
      if (kDebugMode) {
        print(error);
      }
    }
  }
  Future getSports() async {
    try {
      Response response = await DioHelper.getData(category: "sports");
      emit(GetDataLoadingState());

      sportsData = response.data;
      emit(GetSportsNewsDone());
      return response.data;
    } on DioError catch (error) {
      emit(GetSportsNewsError());
      if (kDebugMode) {
        print(error);
      }
    }
  }
  Future getGeneral() async {
    try {
      Response response = await DioHelper.getData(category: "general");
      emit(GetDataLoadingState());

      generalData = response.data;
      emit(GetGeneralNewsDone());
      return response.data;
    } on DioError catch (error) {
      emit(GetGeneralNewsError());
      if (kDebugMode) {
        print(error);
      }
    }
  }
  Future getScience() async {
    try {
      Response response = await DioHelper.getData(category: "science");
      emit(GetDataLoadingState());
      scienceData = response.data;
      emit(GetScienceNewsDone());
      return response.data;
    } on DioError catch (error) {
      emit(GetScienceNewsDone());
      if (kDebugMode) {
        print(error);
      }
    }
  }
  Future getTechnology() async {
    try {
      Response response = await DioHelper.getData(category: "technology");
      emit(GetDataLoadingState());

      technologyData = response.data;
      emit(GetTechnologyNewsDone());
      return response.data;
    } on DioError catch (error) {
      emit(GetTechnologyNewsDone());
      if (kDebugMode) {
        print(error);
      }
    }
  }
  Future getHealth() async {
    try {
      Response response = await DioHelper.getData(category: "health");
      emit(GetDataLoadingState());

      healthData = response.data;
      emit(GetHealthNewsDone());
      return response.data;
    } on DioError catch (error) {
      emit(GetHealthNewsError());
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> kLaunchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  List<String> categoryTitle =
  [
    "Business",
    "Sports",
    "General",
  ];

  void search(String searchValue)
  {
    List list = allData["articles"];
    if(searchValue.isNotEmpty)
    {
      for (var element in list) {
        if(element["title"].toString().contains(searchValue))
        {
          list.removeWhere((element) => !element["title"].toString().contains(searchValue));
        }
      }
    }
    // filteredList.addAll(list);
  }
  List filteredList = [];
}
