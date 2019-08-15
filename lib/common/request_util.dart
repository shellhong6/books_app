import 'package:dio/dio.dart';

class RequestManage {
  Dio _dio;

  static bool isOk (dynamic res) {
    return res.code == 2000;
  }

  RequestManage () {
    _dio = new Dio();
  }
  get(url) async {
    Response response = await _dio.get(url);
    return response.toString();
  }
}

