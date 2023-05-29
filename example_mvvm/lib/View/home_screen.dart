import 'package:example_mvvm/Utils/Route/routes_name.dart';
import 'package:example_mvvm/View%20Model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        body: InkWell(
      onTap: () {
        userPreference.remove().then((value) {
          Navigator.pushNamed(context, RouteName.login);
        }).onError((error, stackTrace) {});
      },
      child: Center(
        child: Text('Home Screen'),
      ),
    ));
  }
}
