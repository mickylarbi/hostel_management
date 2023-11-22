import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/room.dart';
import 'package:hostel_management/utils/colors.dart';
import 'package:hostel_management/utils/textThemes.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.room,
  });
  final Room room;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed('room_details', extra: room);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: roomColor(room).withOpacity(.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(room.number, style: headlineSmall(context)),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Text('Size:'),
                const Spacer(),
                Text(
                  room.size == RoomSize.large ? 'Large' : 'Small',
                  style: titleMedium(context),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Text('Tenants:'),
                const Spacer(),
                Text('0/${room.capacity}', style: titleMedium(context)),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
