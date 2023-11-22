import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/session.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Session session = GoRouterState.of(context).extra! as Session;

    return Scaffold(
      appBar: AppBar(
        actions: [
           TextButton.icon(
            onPressed: () {
              context.pushNamed('edit_session', extra: session);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Edit'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          
        ],
      ),
    );
  }
}
