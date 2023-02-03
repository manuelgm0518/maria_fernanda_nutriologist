import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'views/clients_view.dart';
import 'views/nutrition_plans_view.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int index = 0;
  void setIndex(int value) {
    setState(() => index = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin')),
      body: const [
        ClientsView(),
        NutritionPlansView(),
      ].elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => setIndex(value),
        items: const [
          BottomNavigationBarItem(icon: Icon(UniconsLine.users_alt), label: 'Clientes'),
          BottomNavigationBarItem(icon: Icon(UniconsLine.book_reader), label: 'Planes'),
        ],
      ),
    );
  }
}
