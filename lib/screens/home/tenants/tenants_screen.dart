import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/tenant.dart';
import 'package:hostel_management/screens/home/tenants/tenant_card.dart';

class TenantsScreen extends StatelessWidget {
  const TenantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.medium(
            title: const Text(
              'Tenants',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    context.goNamed('edit_tenant');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent.withOpacity(.15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text('Add tenant'),
                ),
              ),
              const SizedBox(width: 16)
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: tenants.length,
              itemBuilder: (context, index) =>
                  TenantCard(tenant: tenants[index]),
            ),
          )
        ],
      ),
    );
  }
}

List<Tenant> tenants = List.generate(
  20,
  (index) => Tenant(
    id: index.toString(),
    name: 'Kwame Ansah',
    gender: Gender.male,
    programme: 'B.Sc Biochemistry',
    year: 2,
    phones: ['02345678910'],
    guardian: [],
  ),
);
