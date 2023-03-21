import 'package:dio/dio.dart';

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=07e5c15ff8a747cca53940964a952045
class DioHelper {
  static String baseUrl = "https://newsapi.org/";
  static Dio? dio;

  static init() {
    return dio = Dio(
      BaseOptions(
        connectTimeout: 50000,
        receiveTimeout: 30000,
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    String? category,
  }) async {
    {
      return await dio!.get(
        "v2/top-headlines",
        queryParameters:
        {
          "country": "us",
          "category": category ?? "",
          "sortBy": "publishedAt",
          "apiKey": "07e5c15ff8a747cca53940964a952045",
        },
      );
    }
  }

  static postData(String path, json) async {
    await dio!.post(path, data: json).then((value) {
      if (value.statusCode! > 200 && value.statusCode! < 300) {
        print("POST ok ${value.statusCode}");
      }
    }).catchError((error) {
      print("error while posting data $error");
    });
  }

  static updateData(String path) async {
    await dio!.put(path).then((value) {
      if (value.statusCode! > 200 && value.statusCode! < 300) {
        print("PUT ok ${value.statusCode}");
      }
    }).catchError((error) {
      print("error while updating data $error");
    });
  }

  static deleteData(String path) async {
    await dio!.delete(path).then((value) {
      if (value.statusCode! > 200 && value.statusCode! < 300) {
        print("DELETE ok ${value.statusCode}");
      }
    }).catchError((error) {
      print("error while deleting data $error");
    });
  }
}
