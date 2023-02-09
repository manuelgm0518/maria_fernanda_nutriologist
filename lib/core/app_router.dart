import 'package:auto_route/auto_route.dart';

import '../global/data/entities/entities.dart';

import '../modules/admin/application/admin_screen.dart';
import '../modules/admin/application/views/views.dart';
import '../modules/admin/application/widgets/widgets.dart';

import '../modules/authentication/application/authentication_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(name: 'AdminScreenRouter', page: AdminScreen, initial: true, children: [
      AutoRoute(page: ClientsView),
      AutoRoute(page: NutritionPlansView),
      // Modals
      AutoRoute<ClientCreateParams>(page: ClientCreateForm),
      AutoRoute<ClientUpdateParams>(page: ClientUpdateForm),
    ]),
    AutoRoute(page: AuthenticationScreen),
  ],
)
class $AppRouter {}
