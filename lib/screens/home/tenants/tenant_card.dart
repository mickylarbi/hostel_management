import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/tenant.dart';
import 'package:hostel_management/screens/home/rooms/rooms_screen.dart';
import 'package:hostel_management/utils/colors.dart';
import 'package:hostel_management/utils/string_helpers.dart';
import 'package:hostel_management/utils/textThemes.dart';

class TenantCard extends StatelessWidget {
  const TenantCard({super.key, required this.tenant});
  final Tenant tenant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed('tenant', extra: tenant);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: roomColor(rooms[3]).withOpacity(.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Room 2'),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    getInitials(tenant.name),
                    style: titleMedium(context)
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              tenant.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
                '${tenant.programme} (${tenant.year}${ordinal(tenant.year)} year)'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
