import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/room.dart';
import 'package:hostel_management/screens/home/rooms/rooms_screen.dart';
import 'package:hostel_management/utils/textThemes.dart';

class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String roomId = GoRouterState.of(context).pathParameters['id']!;
    final Room room = rooms.singleWhere((element) => element.id == roomId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Room ${room.number}'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            shadowColor: Colors.black26,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 20,
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                onTap: () {
                  // context.goNamed('edit', extra: room);
                },
                child: const Row(
                  children: [
                    Icon(Icons.delete_outline_rounded, color: Colors.red),
                    SizedBox(width: 10),
                    Text('Delete room', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
            child: const Icon(Icons.more_horiz),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Row(
            children: [
              Text(
                'Details',
                style:
                    titleMedium(context).copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {
                  context.go('/rooms/$roomId/edit', extra: room);
                },
                // style: TextButton.styleFrom(
                //   backgroundColor: Colors.blueAccent.withOpacity(.15),
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(12)),
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                // ),
                icon: const Icon(Icons.edit_outlined),
                label: const Text('Edit'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: Text('Size:'),
              ),
              Expanded(
                child: Text(
                  room.size.name,
                  textAlign: TextAlign.right,
                  style: titleSmall(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: Text('Tenants:'),
              ),
              Expanded(
                child: Text(
                  '0/${room.capacity}',
                  textAlign: TextAlign.right,
                  style: titleSmall(context),
                ),
              ),
            ],
          ),
          const Divider(height: 60),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.indigo.withOpacity(.1),
              padding: const EdgeInsets.all(24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kwame Ansah'),
                      const SizedBox(height: 8),
                      Text('B.Sc Biochemistry (2nd year)'),
                      const SizedBox(height: 12),
                      Text(
                        'GHC 200.00',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.indigo.withOpacity(.1),
              padding: const EdgeInsets.all(24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kojo Kumi'),
                      const SizedBox(height: 8),
                      Text('B.Ed Arts (4th year)'),
                      const SizedBox(height: 12),
                      Text(
                        'GHC 0.00',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
