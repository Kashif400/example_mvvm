import 'package:example_mvvm/Repository/auth_repository.dart';
import 'package:example_mvvm/Utils/utils.dart';
import 'package:flutter/material.dart';

import '../Utils/Route/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _myRep = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setSignUpLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(BuildContext context, dynamic data) async {
    setSignUpLoading(true);

    _myRep.loginApi(data).then((value) {
      Utils.flushBarErrorMessage('Successful Login', context);
      Navigator.pushNamed(context, RouteName.home);
      setSignUpLoading(false);
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> signUpApi(BuildContext context, dynamic data) async {
    setLoading(true);

    _myRep.signUpApi(data).then((value) {
      Utils.flushBarErrorMessage('Successful Login', context);
      Navigator.pushNamed(context, RouteName.home);
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
