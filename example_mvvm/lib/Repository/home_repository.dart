import 'package:example_mvvm/Data/Network/network_api_services.dart';
import '../Data/Network/base_api_services.dart';
import '../Model/movies_model.dart';
import '../res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
