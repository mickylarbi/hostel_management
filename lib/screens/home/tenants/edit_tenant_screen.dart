import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/guardian.dart';
import 'package:hostel_management/models/tenant.dart';
import 'package:hostel_management/screens/home/tenants/phone_section.dart';
import 'package:hostel_management/utils/dialogs.dart';
import 'package:hostel_management/utils/string_helpers.dart';
import 'package:hostel_management/utils/textThemes.dart';

class EditTenantScreen extends StatefulWidget {
  @override
  State<EditTenantScreen> createState() => _EditTenantScreenState();
}

class _EditTenantScreenState extends State<EditTenantScreen> {
  String name = '';
  String programme = '';
  String year = '';
  List<String> phones = [];
  List<Guardian> guardians = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tenant = GoRouterState.of(context).extra as Tenant?;
    if (tenant != null) {
      name = tenant.name;
      programme = tenant.programme;
      year = tenant.year.toString();
      phones = tenant.phones;
      // guardians = tenant.guardians;
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${tenant == null ? 'Add' : 'Edit'} tenant'),
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
                  if (val == null || val.isEmpty) return 'Enter tenant name';
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: programme,
                onChanged: (val) {
                  programme = val;
                },
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Enter tenant programme';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Programme',
                  prefixIcon: Icon(Icons.school_outlined),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: year,
                onChanged: (val) {
                  year = val;
                },
                validator: (val) {
                  if (programme.trim().toLowerCase() == 'n/a') return null;

                  if (val == null || val.isEmpty) {
                    return 'Enter tenant\'s programme year';
                  }
                  if (int.tryParse(year) == null ||
                      val.length != 1 ||
                      int.parse(val) == 0 ||
                      int.parse(val) > 6) {
                    return 'Enter a valid year';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Year',
                  prefixIcon: Icon(Icons.history_outlined),
                ),
              ),
              const Divider(height: 40),
              PhoneSection(phones: phones),
              const Divider(height: 40),
              StatefulBuilder(builder: (context, setState) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Guardian(s)',
                            style: titleMedium(context),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () async {
                            Guardian? result =
                                await context.pushNamed('edit_guardian');

                            if (result != null) {
                              guardians.add(result);
                              setState(() {});
                            }
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: guardians.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () async {
                          Guardian? result = await context.pushNamed(
                            'edit_guardian',
                            extra: guardians[index],
                          );

                          if (result != null) {
                            guardians.replaceRange(index, index + 1, [result]);
                            setState(() {});
                          }
                        },
                        title: Text(guardians[index].name),
                        subtitle: Text(
                            guardians[index].relationship.name.capitalize()),
                        trailing: IconButton(
                          onPressed: () {
                            guardians.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(Icons.clear, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (phones.isEmpty) {
                      showAlertDialog(context,
                          message: 'Please add a phone number');
                    } else if (guardians.isEmpty) {
                      showAlertDialog(context,
                          message: 'Please add a guardian');
                    } else {
                      context.pop();
                    }
                  }
                },
                child: const Text('Save'),
              ),
              if (tenant != null) const SizedBox(height: 20),
              if (tenant != null)
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.red.withOpacity(.2),
                    foregroundColor: Colors.red,
                  ),
                  child: const Text('Delete tenant'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
