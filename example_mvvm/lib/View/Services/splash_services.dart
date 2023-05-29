import 'package:example_mvvm/Utils/Route/routes_name.dart';
import 'package:flutter/material.dart';

import '../../Model/user_model.dart';
import '../../View Model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        print(value.token.toString());
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.home);
      }
    }).onError((error, stackTrace) {});
  }
}
