import 'package:flutter/material.dart';
import 'package:delivery_app/src/utils/shared_pref.dart';

class ClientProductsListController {
  late BuildContext context;
  final _sharedPref = SharedPref();
  Future? init(BuildContext context) async {
    this.context = context;
    return null;
  }
  logout() {
    _sharedPref.logout(context);
  }
}