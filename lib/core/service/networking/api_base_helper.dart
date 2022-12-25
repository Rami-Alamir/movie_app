import 'dart:convert';
import 'package:http/http.dart' as http;
import 'app_exception.dart';
import '../../constants/constants.dart';

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
    Uri uri = Uri.parse(Constants.baseUrl + url);
    dynamic responseJson;
    try {
      var response = await http.get(uri).timeout(const Duration(seconds: 60));
      responseJson = _returnResponse(response);
    } catch (_) {}
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
