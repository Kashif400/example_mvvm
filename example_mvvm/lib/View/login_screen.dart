import 'package:example_mvvm/Utils/utils.dart';
import 'package:example_mvvm/View%20Model/auth_view_model.dart';
import 'package:example_mvvm/res/Component/round_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/Route/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    obscurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Email',
              hintText: 'Email',
              prefix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.email),
              ),
            ),
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(
                  context, _emailFocusNode, _passwordFocusNode);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ValueListenableBuilder(
              valueListenable: obscurePassword,
              builder: (context, child, value) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: obscurePassword.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'password',
                    hintText: 'password',
                    suffix: InkWell(
                        onTap: () {
                          obscurePassword.value = !obscurePassword.value;
                        },
                        child: obscurePassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility_rounded)),
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.lock_open_rounded),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, _emailFocusNode, _passwordFocusNode);
                  },
                );
              }),
          SizedBox(
            height: 20,
          ),
          RoundButton(
            loading: authViewModel.loading,
            pressed: () {
              if (_emailController.text.isEmpty) {
                Utils.flushBarErrorMessage('Please Enter Email', context);
              } else if (_passwordController.text.isEmpty) {
                Utils.flushBarErrorMessage('Please Enter Password', context);
              } else if (_passwordController.text.length < 6) {
                Utils.flushBarErrorMessage('Minimum 6 Digits', context);
              } else {
                Map data = {
                  'email': _emailController.text,
                  'password': _passwordController.text
                };

                authViewModel.loginApi(
                  context,
                  data,
                );
              }
            },
            title: 'login',
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.signup);
              },
              child: const Center(
                child: Text('Don\'t have an account ? SignUp'),
              )),
        ]),
      ),
    );
  }
}
