import 'dart:convert';
import 'dart:io';

import 'package:example_mvvm/Data/Network/base_api_services.dart';
import 'package:example_mvvm/Data/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnRespons(response);
    } on SocketException {
      throw FetchDataException(message: "No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future postApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnRespons(response);
    } on SocketException {
      throw FetchDataException(message: "No Internet Connection");
    }

    return responseJson;
  }

  dynamic returnRespons(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsJson = jsonDecode(response.body);
        return responsJson;

      case 400:
        throw BadException(message: response.body.toString());
      case 404:
        throw UnauthorizedException(message: response.body.toString());

      default:
        FetchDataException(
            message: 'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
