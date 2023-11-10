import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditPhoneScreen extends StatefulWidget {
  const EditPhoneScreen({super.key});

  @override
  State<EditPhoneScreen> createState() => _EditPhoneScreenState();
}

class _EditPhoneScreenState extends State<EditPhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final phone = GoRouterState.of(context).extra as String?;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${phone == null ? 'Add' : 'Edit'} phone'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid phone number';
                  }
                  if (value.length != 10) {
                    return 'Phone number should be 10 digits';
                  }
                  if (value[0] != '0') {
                    return 'Phone number must begin with a zero';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Phone number',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: phoneController,
              builder: (context, child) {
                return FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.pop(phoneController.text.trim());
                    }
                  },
                  child: child,
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  bool validatePhone() {
    String phone = phoneController.text.trim();
    return phone.isNotEmpty && phone.length == 10 && phone[0] == '0';
  }

  @override
  void dispose() {
    phoneController.dispose();

    super.dispose();
  }
}
