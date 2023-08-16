import 'package:example_mvvm/model/user_detail_model.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class UserDetailRep {
  BaseApiServices _apiServices = NetworkApiService();

  Future<UserDetail> fetchMoviesList() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.userUrl);
      return response = UserDetail.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
