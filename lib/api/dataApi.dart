import 'package:FlutterDemo/model/Records.dart';
import 'package:dio/dio.dart';

class DataApi {
  static String mainUrl = "https://test.chatongo.in/testdata.json";

  final Dio _dio = Dio();

  Future<Records> getTestData() async {
    try {
      Response response = await _dio.get(
        mainUrl,
      );
      return Records.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
