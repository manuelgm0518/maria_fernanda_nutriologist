import 'package:auto_route/auto_route.dart';

import '../modules/admin/application/admin_screen.dart';
import '../modules/admin/application/pages/pages.dart';

import '../modules/authentication/application/authentication_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(name: 'AdminScreenRouter', page: AdminScreen, initial: true, children: [
      AutoRoute(page: ClientsPage),
      AutoRoute(page: NutritionPlansPage),
      // Modals
      // AutoRoute<ClientCreateParams>(page: ClientCreateForm, fullscreenDialog: true),
      // AutoRoute<ClientUpdateParams>(page: ClientUpdateForm),
    ]),
    AutoRoute(page: AuthenticationScreen),
  ],
)
class $AppRouter {}
