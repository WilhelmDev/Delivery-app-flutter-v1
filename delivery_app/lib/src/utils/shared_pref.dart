import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  void save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }
  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString(key) == null) {
      return null;
    }
    return json.decode(prefs.getString(key) as String);
  }
  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
  void logout(BuildContext context) async {
    await remove('user');
    Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
  }
}