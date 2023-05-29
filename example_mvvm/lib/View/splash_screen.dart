import 'package:example_mvvm/View/Services/splash_services.dart';
import 'package:flutter/material.dart';

import '../Model/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  UserModel user = UserModel();

  @override
  void initState() {
    splashServices.checkAuthentication(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Splash Screen'));
  }
}
