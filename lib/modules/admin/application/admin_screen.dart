import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../core/app_router.gr.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        ClientsViewRoute(),
        NutritionPlansViewRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          appBar: AppBar(title: Text(tabsRouter.currentPath)),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(UniconsLine.users_alt), label: 'Clientes'),
              BottomNavigationBarItem(icon: Icon(UniconsLine.book_reader), label: 'Planes'),
            ],
          ),
        );
      },
    );
  }
}
