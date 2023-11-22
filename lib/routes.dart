import 'package:go_router/go_router.dart';
import 'package:hostel_management/screens/auth/login_screen.dart';
import 'package:hostel_management/screens/home/dashboard/dashboard_screen.dart';
import 'package:hostel_management/screens/home/more/more_screen.dart';
import 'package:hostel_management/screens/home/nav_bar_shell.dart';
import 'package:hostel_management/screens/home/payments/payments_screen.dart';
import 'package:hostel_management/screens/home/rooms/edit_room_screen.dart';
import 'package:hostel_management/screens/home/rooms/room_details_screen.dart';
import 'package:hostel_management/screens/home/rooms/rooms_screen.dart';
import 'package:hostel_management/screens/home/session/edit_room_price_screen.dart';
import 'package:hostel_management/screens/home/session/edit_sessions_screen.dart';
import 'package:hostel_management/screens/home/session/session_details_screen.dart';
import 'package:hostel_management/screens/home/session/sessions_screen.dart';
import 'package:hostel_management/screens/home/tenants/edit_guardian_screen.dart';
import 'package:hostel_management/screens/home/tenants/edit_phone_screen.dart';
import 'package:hostel_management/screens/home/tenants/edit_tenant_screen.dart';
import 'package:hostel_management/screens/home/tenants/tenant_details_screen.dart';
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
              routes: [
                GoRoute(
                  path: 'edit',
                  name: 'edit_tenant',
                  builder: (context, state) => EditTenantScreen(),
                  routes: [
                    GoRoute(
                      path: 'edit_phone',
                      name: 'edit_phone',
                      builder: (context, state) => const EditPhoneScreen(),
                    ),
                    GoRoute(
                      path: 'edit_guardian',
                      name: 'edit_guardian',
                      builder: (context, state) => EditGuardianScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'tenant',
                  name: 'tenant',
                  builder: (context, state) => const TenantDetailsScreen(),
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
              routes: [
                GoRoute(
                  path: 'rooms',
                  name: 'rooms',
                  builder: (context, state) => const RoomsScreen(),
                  routes: [
                    GoRoute(
                      path: 'edit',
                      name: 'edit_room',
                      builder: (context, state) => const EditRoomScreen(),
                    ),
                    GoRoute(
                      path: 'room',
                      name: 'room_details',
                      builder: (context, state) => const RoomDetailsScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'sessions',
                  name: 'sessions',
                  builder: (context, state) => const SessionsScreen(),
                  routes: [
                    GoRoute(
                      path: 'edit',
                      name: 'edit_session',
                      builder: (context, state) => const EditSessionScreen(),
                      routes: [
                        GoRoute(
                          path: 'room_price',
                          name: 'edit_room_price',
                          builder: (context, state) =>
                              const EditRoomPriceScreen(),
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'session',
                      name: 'session_details',
                      builder: (context, state) => const SessionDetailsScreen(),
                    ),
                  ],
                ),
              ],
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
