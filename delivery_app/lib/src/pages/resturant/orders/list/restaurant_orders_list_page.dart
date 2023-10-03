import 'package:flutter/material.dart';

class ResturantOrdersListPage extends StatefulWidget {
  const ResturantOrdersListPage({super.key});

  @override
  State<ResturantOrdersListPage> createState() => _ResturantOrdersListPageState();
}

class _ResturantOrdersListPageState extends State<ResturantOrdersListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Resturant Orders List'),
      ),
    );
  }
}