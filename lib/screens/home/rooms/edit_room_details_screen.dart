import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/room.dart';

class EditRoomDetailsScreen extends StatelessWidget {
  const EditRoomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final room = GoRouterState.of(context).extra as Room?;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${room == null ? 'Add' : 'Edit'} room'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Room number',
                prefixIcon: Icon(Icons.numbers_outlined),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              onChanged: (val) {},
              borderRadius: BorderRadius.circular(20),
              dropdownColor: Colors.grey[200],
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Capacity',
                prefixIcon: Icon(Icons.people_outline_rounded),
              ),
              items: List.generate(
                3,
                (index) => DropdownMenuItem(
                  value: index + 1,
                  child: Text('${index + 1}'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              onChanged: (val) {},
              borderRadius: BorderRadius.circular(20),
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Size',
                prefixIcon: Icon(Icons.room_preferences_outlined),
              ),
              items: RoomSize.values
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: () {},
              child: const Text('Save'),
            ),
            if (room != null) const SizedBox(height: 20),
            if (room != null)
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(.2),
                  foregroundColor: Colors.red,
                ),
                child: const Text('Delete room'),
              ),
          ],
        ),
      ),
    );
  }
}
