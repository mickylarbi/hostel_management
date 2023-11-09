import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/room.dart';
import 'package:hostel_management/screens/home/rooms/room_card.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.medium(
            title: const Text(
              'Rooms',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    context.goNamed('add_room');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent.withOpacity(.15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text('Add room'),
                ),
              ),
              const SizedBox(width: 16)
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 48),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: rooms.length,
              itemBuilder: (context, index) => RoomCard(room: rooms[index]),
            ),
          ),
        ],
      ),
    );
  }
}

List<Room> rooms = List.generate(
  20,
  (index) => Room(
    id: index.toString(),
    number: (index + 1).toString(),
    capacity: (index % 2) + 1,
    size: (index / 2) % 2 == 0 ? RoomSize.small : RoomSize.large,
  ),
);
