
import 'package:delivery_app/src/models/response_api.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/provider/users_provider.dart';
import 'package:delivery_app/src/utils/my_snackbar.dart';
import 'package:delivery_app/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class LoginController {
  late BuildContext context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
  final SharedPref _sharedPref = SharedPref();

  Future? init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);
    dynamic localeUser = await _sharedPref.read('user');
    if (localeUser != null) {
      User user = User.fromJson(localeUser);
      if (user.sessionToken != null) {
        if (user.roles!.length == 1 ) {
          Navigator.pushNamedAndRemoveUntil(context, user.roles![0].route, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
        }
      }
    }
    return null;
  }
  Future<Object?> goToRegisterPage() {
    return Navigator.pushNamed(context, 'register');
  }
  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, password);
    if (responseApi.success) {
      User user = User.fromJson(responseApi.data);
      _sharedPref.save('user', user.toJson());
      if (user.roles!.length > 1) {
        Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
      } else {
      Navigator.pushNamedAndRemoveUntil(context, user.roles![0].route, (route) => false);
      }
    }
    MySnackbar.show(context, responseApi.message);
  }
}