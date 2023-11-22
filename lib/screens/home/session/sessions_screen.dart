import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/utils/textThemes.dart';
import 'package:intl/intl.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.medium(
            title: const Text(
              'Sessions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    context.goNamed('edit_session');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent.withOpacity(.15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text('Add session'),
                ),
              ),
              const SizedBox(width: 16)
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12),
                  child: Text(
                    'Current session',
                    style: titleMedium(context)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    children: [
                      Text(
                        '2022 / 2023',
                        style: titleLarge(context),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Started on:',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(DateFormat.yMMMMd().format(DateTime.now()
                                    .subtract(const Duration(days: 30)))),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ends on:',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(DateFormat.yMMMMd().format(DateTime.now()
                                    .add(const Duration(days: 30))))
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      FilledButton(
                        onPressed: () {
                          // context.goNamed('session_details');
                        },
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 24),
                        ),
                        child: const Text('View details'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 36, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Past sessions',
                    style: titleMedium(context)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 0)
                ],
              ),
            ),
          ),
          SliverList.separated(
            itemCount: 5,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                // context.goNamed('session_details');
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              title: const Text('2021 / 2022'),
              subtitle: Text(
                  '${DateFormat.yMMMd().format(DateTime.now().subtract(const Duration(days: 30)))} - ${DateFormat.yMMMd().format(DateTime.now().add(const Duration(days: 30)))}'),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            ),
            separatorBuilder: (context, index) => const Divider(
              height: 0,
              indent: 24,
              endIndent: 24,
            ),
          )
        ],
      ),
    );
  }
}
