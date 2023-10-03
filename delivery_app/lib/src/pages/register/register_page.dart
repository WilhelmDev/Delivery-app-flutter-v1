import 'package:flutter/material.dart';
import 'package:delivery_app/src/pages/register/register_controller.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/scheduler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final RegisterController _con = RegisterController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -100,
              child: _circle(),
            ),
            Positioned(
              top:60,
              left:28,
              child: _textRegister()
            ),
            Positioned(
              top:46,
              left:-5,
              child: _iconBack()
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 150),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _iconUser(),
                    const SizedBox(height: 30),
                    _fieldEmail(),
                    _fieldName(),
                    _fieldLastName(),
                    _fieldPhone(),
                    _fieldPassword(),
                    _fieldConfirmPassword(),
                    _btnRegister(),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
  Widget _textRegister() {
    return  
        const Text(
          'REGISTRO',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NimbusSans',
            fontWeight: FontWeight.bold,
            fontSize: 22
          )
        );
  }
  Widget _iconBack() {
    return IconButton(
      onPressed: _con.back, 
      icon: const Icon(Icons.arrow_back_ios, color: Colors.white,));
  }
  Widget _iconUser() {
    return CircleAvatar(
      backgroundImage: const AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[200],
    ) ;
  }
  Widget _fieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo Electronico',
          hintStyle: TextStyle(
            color: MyColors.primaryColorDark
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(Icons.email, color: MyColors.primaryColor)
        ),
      )
    );
  }
  Widget _fieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.nameController,
        decoration: InputDecoration(
          hintText: 'Nombre',
          hintStyle: TextStyle(
            color: MyColors.primaryColorDark
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(Icons.person, color: MyColors.primaryColor)
        ),
      )
    );
  }
  Widget _fieldLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.lastNameController,
      decoration: InputDecoration(
        hintText: 'Apellido',
        hintStyle: TextStyle(
          color: MyColors.primaryColorDark
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(15),
        prefixIcon: Icon(Icons.person_outline, color: MyColors.primaryColor)
      ),
    )
    );
  }
  Widget _fieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Telefono',
          hintStyle: TextStyle(
            color: MyColors.primaryColorDark
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(Icons.phone, color: MyColors.primaryColor)
        ),
      )
    );
  }
  Widget _fieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          hintStyle: TextStyle(
            color: MyColors.primaryColorDark
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(Icons.lock, color: MyColors.primaryColor)
        ),
      )
    );
  }
  Widget _fieldConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.confirmPasswordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Confirmar Contraseña',
          hintStyle: TextStyle(
            color: MyColors.primaryColorDark
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(Icons.lock_outline, color: MyColors.primaryColor)
        ),
      )
    );
  }
  Widget _btnRegister() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      child:ElevatedButton(
      onPressed: _con.register,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        padding: const EdgeInsets.symmetric(vertical: 15)
      ),
      child: const Text('REGISTRARSE'),
      )
    );
  }
  Widget _circle() {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor
      ),
    );
  }
}