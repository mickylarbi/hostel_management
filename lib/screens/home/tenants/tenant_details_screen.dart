import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/tenant.dart';
import 'package:hostel_management/screens/home/rooms/rooms_screen.dart';
import 'package:hostel_management/screens/home/tenants/tenant_tile.dart';
import 'package:hostel_management/utils/colors.dart';
import 'package:hostel_management/utils/string_helpers.dart';
import 'package:hostel_management/utils/textThemes.dart';

class TenantDetailsScreen extends StatelessWidget {
  const TenantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tenant = GoRouterState.of(context).extra! as Tenant;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              context.pushNamed('edit_tenant', extra: tenant);
            },
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16)),
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Edit'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                getInitials(tenant.name),
                style: headlineLarge(context)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            tenant.name,
            textAlign: TextAlign.center,
            style: titleLarge(context),
          ),
          const SizedBox(height: 10),
          Text(
            tenant.programme,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '${tenant.year}${ordinal(tenant.year)} year',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: roomColor(rooms[3]).withOpacity(.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Room 2',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const Divider(height: 40),
          Text(
            'Phone number${tenant.phones.length == 1 ? '' : '(s)'}',
            style: titleMedium(context).copyWith(fontWeight: FontWeight.w600),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tenant.phones.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(tenant.phones[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      color: Colors.indigo,
                      icon: const Icon(Icons.phone_rounded),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Colors.indigo,
                      icon: const Icon(Icons.sms_rounded),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(height: 40),
          //TODO: guardians section... to be extracted for later tins

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Guardians',
                style:
                    titleMedium(context).copyWith(fontWeight: FontWeight.w600),
              ),
              ListView.separated(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Guardians name'),
                    subtitle: Text('relationship'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          color: Colors.indigo,
                          icon: const Icon(Icons.phone_rounded),
                        ),
                        IconButton(
                          onPressed: () {},
                          color: Colors.indigo,
                          icon: const Icon(Icons.sms_rounded),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
              )
            ],
          ),
          const Divider(height: 40),
          Text(
            'Roommate',
            style: titleMedium(context).copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          TenantTile(
            tenant: Tenant(
              id: '0',
              name: 'Kwame Ansah',
              gender: Gender.male,
              programme: 'B.Sc Biochemistry',
              year: 2,
              phones: const ['0999999999'],
              guardian: const [],
            ),
          ),
        ],
      ),
    );
  }
}
