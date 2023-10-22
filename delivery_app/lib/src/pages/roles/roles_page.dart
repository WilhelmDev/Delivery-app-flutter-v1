import 'package:delivery_app/src/models/rol.dart';
import 'package:delivery_app/src/pages/roles/roles_controller.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  final RolesController _controller = RolesController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await _controller.init(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seleccione un rol"),
        backgroundColor: MyColors.primaryColor,
      ),
    //   body: Center(
    //     child: ElevatedButton(
    //       onPressed: _controller.logout,
    //       child: const Text('Cerrar sesion'))
    //   )
    // );
      body: ListView(
        children: _controller.user == null 
        ? []
        : _controller.user!.roles!.map((e) => _rolCard(e)).toList(),
      )
    );
  }
  Widget _rolCard (Rol rol) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: FadeInImage(
            placeholder: const AssetImage("assets/img/no-image.png"),
            image: rol.image != null
              ? Image.network(rol.image as String) as ImageProvider<Object>
              : const AssetImage('assets/img/no-image.png'),
            fit: BoxFit.contain,
            fadeInDuration: const Duration(milliseconds: 50),
            ),
        ),
        Text(
          rol.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          )
      ]);
  }
}