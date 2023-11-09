import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBarShell extends StatelessWidget {
  const NavBarShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.dashboard_rounded),
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.people_alt_rounded),
            icon: Icon(Icons.people_alt_outlined),
            label: 'Tenants',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.room_rounded),
            icon: Icon(Icons.room_outlined),
            label: 'Rooms',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.payments),
            icon: Icon(Icons.payments_outlined),
            label: 'Payments',
          ),
          // TODO: show for superuser (me)
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.list),
            icon: Icon(Icons.list_outlined),
            label: 'More',
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
