import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class RolesController {
  late BuildContext context;
  User? user;
  late SharedPref sharedPref = SharedPref();

  Future init(BuildContext context) async {
    this.context = context;
    //Obtener el usuario del storage
    user = User.fromJson(await sharedPref.read("user"));
    return null;
  }
  // todo Delete function
  logout() {
    sharedPref.logout(context);
  }
}