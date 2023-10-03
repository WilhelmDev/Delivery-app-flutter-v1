import 'package:delivery_app/src/pages/client/products/list/client_products_list_page.dart';
import 'package:delivery_app/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:delivery_app/src/pages/resturant/orders/list/restaurant_orders_list_page.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/src/pages/login/login_page.dart';
import 'package:delivery_app/src/pages/register/register_page.dart';
import 'package:delivery_app/src/utils/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery app Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage(),
        'client/products/list': ((context) => const ClientProductsListPage()),
        'delivery/orders/list': ((context) => const DeliveryOrdersListPage()),
        'restaurant/orders/list': ((context) => const ResturantOrdersListPage())
      },
      theme: ThemeData(
        fontFamily: 'NimbusSans' ,
        primaryColor: MyColors.primaryColor
      ),
    );
  }
}