import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/guardian.dart';
import 'package:hostel_management/screens/home/tenants/phone_section.dart';
import 'package:hostel_management/utils/dialogs.dart';
import 'package:hostel_management/utils/string_helpers.dart';

// ignore: must_be_immutable
class EditGuardianScreen extends StatefulWidget {
  EditGuardianScreen({super.key});

  @override
  State<EditGuardianScreen> createState() => _EditGuardianScreenState();
}

class _EditGuardianScreenState extends State<EditGuardianScreen> {
  String name = '';

  Relationship? relationship;

  List<String> phones = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final guardian = GoRouterState.of(context).extra as Guardian?;
    if (guardian != null) {
      name = guardian.name;
      relationship = guardian.relationship;
      phones = guardian.phones;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${guardian == null ? 'Add' : 'Edit'} guardian'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              initialValue: name,
              onChanged: (val) {
                name = val;
              },
              validator: (val) {
                if (val == null || val.isEmpty) return 'Enter guardian name';
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Guardian name',
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              value: relationship,
              onChanged: (val) {
                relationship = val;
              },
              validator: (value) {
                if (value == null) {
                  return 'Choose a relationship';
                }
                return null;
              },
              borderRadius: BorderRadius.circular(20),
              dropdownColor: Colors.grey[200],
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Relationship',
                prefixIcon: Icon(Icons.link_outlined),
              ),
              items: Relationship.values
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.capitalize()),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            PhoneSection(phones: phones),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (phones.isEmpty) {
                    showAlertDialog(context,
                        message: 'Please add a phone number');
                  } else {
                    context.pop(Guardian(
                      name: name,
                      relationship: relationship!,
                      phones: phones,
                    ));
                  }
                }
              },
              child: const Text('Save'),
            ),
            // FutureBuilder(
            //   future: getAllCountries(),
            //   builder: (context, snapshot) {
            //     List<Country> countries = snapshot.data ?? [];
            //     return GestureDetector(
            //       onTap: countries.isEmpty ? null : (){},
            //       child: Container(...));
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
