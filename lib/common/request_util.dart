import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestManage {
  Dio _dio;
  SharedPreferences _prefs;

  static bool isOk (dynamic res) {
    return res.code == 2000;
  }

  RequestManage () {
    _dio = new Dio();
  }
  get(url) async {
    _prefs ??= await SharedPreferences.getInstance();
    String res = _prefs.getString(url);
    if (res == null) {
      Response response = await _dio.get(url);
      res = response.toString();
      _prefs.setString(url, res);
      return res;
    } 
    return res;
  }
}

