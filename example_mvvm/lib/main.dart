import 'package:example_mvvm/View%20Model/auth_view_model.dart';
import 'package:example_mvvm/View%20Model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Utils/Route/routes.dart';
import 'Utils/Route/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => UserViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        initialRoute: RouteName.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
