import 'package:flutter/material.dart';
import 'package:hostel_management/screens/home/more/more_list_tile.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MoreItem> moreList = [
      MoreItem('Rooms', Icons.room_preferences_outlined, 'rooms'),
      MoreItem('Debtors', Icons.attach_money, 'debtors'),
      MoreItem('Session', Icons.access_time, 'sessions'),
      MoreItem('Accommodation', Icons.login, 'accommodations'),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.medium(
            title: const Text(
              'More',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(),
              ),
              const SizedBox(width: 16)
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList.separated(
              itemCount: moreList.length,
              itemBuilder: (context, index) =>
                  MoreListTile(more: moreList[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
            ),
          ),
        ],
      ),
    );
  }
}
