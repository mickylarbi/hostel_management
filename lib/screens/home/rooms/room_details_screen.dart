import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/room.dart';
import 'package:hostel_management/models/tenant.dart';
import 'package:hostel_management/screens/home/tenants/tenant_tile.dart';
import 'package:hostel_management/utils/colors.dart';
import 'package:hostel_management/utils/string_helpers.dart';
import 'package:hostel_management/utils/textThemes.dart';

class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Room room = GoRouterState.of(context).extra! as Room;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              context.pushNamed('edit_room', extra: room);
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
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: roomColor(room).withOpacity(.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Details',
                        style: titleMedium(context)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Text(
                    room.number,
                    style: headlineLarge(context).copyWith(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Expanded(
                        child: Text('Size:'),
                      ),
                      Expanded(
                        child: Text(
                          room.size.name.capitalize(),
                          textAlign: TextAlign.right,
                          style: titleSmall(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListView(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [],
          ),
          const Divider(height: 60),
          Text(
            'Tenants',
            style: titleMedium(context).copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) => TenantTile(
              tenant: Tenant(
                id: index.toString(),
                name: 'Kwame Ansah',
                gender: Gender.male,
                programme: 'B.Sc Biochemistry',
                year: 2,
                phones: const ['0999999999'],
                guardian: const [],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
