import 'package:example_mvvm/model/user_detail_model.dart';
import 'package:example_mvvm/respository/user_detail_repository.dart';
import 'package:flutter/material.dart';

import '../Data/Response/api_response.dart';

class UserDetailViewModel with ChangeNotifier {
  final _myRepo = UserDetailRep();

  ApiResponse<UserDetail> userList = ApiResponse.loading();

  setUserList(ApiResponse<UserDetail> response) {
    userList = response;
    notifyListeners();
  }

  Future<void> fetchUserDetailListApi() async {
    setUserList(ApiResponse.loading());

    _myRepo.fetchMoviesList().then((value) {
      setUserList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUserList(ApiResponse.error(error.toString()));
    });
  }
}
