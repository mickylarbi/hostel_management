import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/tenant.dart';
import 'package:hostel_management/utils/string_helpers.dart';

class TenantTile extends StatelessWidget {
  const TenantTile({super.key, required this.tenant});
  final Tenant tenant;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.goNamed('tenant', extra: tenant);
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.indigo.withOpacity(.1),
        padding: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tenant.name),
                const SizedBox(height: 8),
                Text(tenant.programme),
                const SizedBox(height: 8),
                Text('${tenant.year}${ordinal(tenant.year)} year'),
              ],
            ),
          ),
          Hero(
            tag: tenant.id!,
            child: CircleAvatar(
              child: Text(
                getInitials(tenant.name),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
