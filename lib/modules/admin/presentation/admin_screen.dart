import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import 'views/views.dart';

class AdminScreen extends HookConsumerWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = useState(0);

    return Scaffold(
      appBar: AppBar(title: const Text('Admin')),
      body: const [
        ClientsView(),
        NutritionPlansView(),
      ].elementAt(tabIndex.value),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex.value,
        onTap: (value) => tabIndex.value = value,
        items: const [
          BottomNavigationBarItem(icon: Icon(UniconsLine.users_alt), label: 'Clientes'),
          BottomNavigationBarItem(icon: Icon(UniconsLine.book_reader), label: 'Planes'),
        ],
      ),
    );
  }
}
