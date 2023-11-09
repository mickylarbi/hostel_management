import 'package:go_router/go_router.dart';
import 'package:hostel_management/screens/auth/login_screen.dart';
import 'package:hostel_management/screens/home/dashboard/dashboard_screen.dart';
import 'package:hostel_management/screens/home/more/more_screen.dart';
import 'package:hostel_management/screens/home/nav_bar_shell.dart';
import 'package:hostel_management/screens/home/payments/payments_screen.dart';
import 'package:hostel_management/screens/home/rooms/edit_room_details_screen.dart';
import 'package:hostel_management/screens/home/rooms/room_details_screen.dart';
import 'package:hostel_management/screens/home/rooms/rooms_screen.dart';
import 'package:hostel_management/screens/home/tenants/tenants_screen.dart';

GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',
              name: 'dashboard',
              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tenants',
              name: 'tenants',
              builder: (context, state) => const TenantsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/rooms',
              name: 'rooms',
              builder: (context, state) => const RoomsScreen(),
              routes: [
                GoRoute(
                  path: 'add',
                  name: 'add_room',
                  builder: (context, state) => const EditRoomDetailsScreen(),
                ),
                GoRoute(
                  path: ':id',
                  name: 'room_details',
                  builder: (context, state) => const RoomDetailsScreen(),
                  routes: [
                    GoRoute(
                      path: 'edit',
                      name: 'edit_room',
                      builder: (context, state) =>
                          const EditRoomDetailsScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/payments',
              name: 'payments',
              builder: (context, state) => const PaymentsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/more',
              name: 'more',
              builder: (context, state) => const MoreScreen(),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) =>
          NavBarShell(navigationShell: navigationShell),
    ),
  ],
  initialLocation: '/login',
);
