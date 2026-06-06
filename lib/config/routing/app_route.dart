import 'package:go_router/go_router.dart';
import 'package:monex/config/routing/route_paths.dart';
import 'package:monex/core/widgets/bottom_navigation_scaffold_bar.dart';
import 'package:monex/features/contact/presentation/contact_detail/contact_detail_screen.dart';
import 'package:monex/features/contact/presentation/contact_list/contacts_screen.dart';
import 'package:monex/features/contact/presentation/contact_list/create_contact/create_contact.dart';
import 'package:monex/features/debts/create_transaction_screen.dart';
import 'package:monex/features/home/home_screen.dart';
import 'package:monex/features/home/utils/debt_type.dart';
import 'package:monex/features/settings/settings_screen.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            BottomNavigationScaffoldBar(navigationShell: navigationShell),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.home,
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.contacts,
                builder: (context, state) => ContactsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.settings,
                builder: (context, state) => SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.createTracnsactionPath,
        builder: (context, state) {
          final type = state.extra as DebtType;
          return CreateTransactionScreen(type: type);
        },
      ),
      GoRoute(
        path: RoutePaths.contactDetailPath,
        builder: (context, state) => ContactDetailScreen(),
      ),
      GoRoute(
        path: RoutePaths.createContact,
        builder: (context, state) => CreateContact(),
      ),
    ],
  );
}
