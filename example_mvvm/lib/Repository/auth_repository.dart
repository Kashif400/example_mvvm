import 'package:example_mvvm/Data/Network/base_api_services.dart';
import 'package:example_mvvm/Data/Network/network_api_services.dart';
import 'package:example_mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.postApiResponse(AppUrl.loginUrlEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.postApiResponse(AppUrl.signUpUrlEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
