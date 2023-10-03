import 'package:delivery_app/src/models/response_api.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/provider/users_provider.dart';
import 'package:delivery_app/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class RegisterController {
  late BuildContext context;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  Future? init(BuildContext context) {
    this.context = context;
    usersProvider.init(context);
    return null;
  }
  
  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String password= passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || name.isEmpty || lastName.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      MySnackbar.show(context, 'Todos los campos son obligatorios');
      return;
    }

    if (confirmPassword != password) {
      MySnackbar.show(context, 'Las contraseñas deben ser iguales');
      return;
    }

    if (password.length < 6) {
      MySnackbar.show(context, 'La contraseña debe tener al menos 6 caracteres');
      return;
    }

    User user = User(
      name: name,
      lastname: lastName,
      email: email,
      phone: phone,
      password: password);

    ResponseApi responseApi = await usersProvider.create(user);
    MySnackbar.show(context, responseApi.message);
    if (responseApi.success) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, 'login');
      });
    }
  }
  void back() {
    Navigator.pop(context);
  }
}