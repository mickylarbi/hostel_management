import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/screens/auth/user_name_field.dart';
import 'package:hostel_management/utils/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(24),
            children: [
              Center(
                child: CircleAvatar(
                  radius: screenWidth(context) / 6,
                  child: Image.asset(
                    'assets/images/logos/ic_round-apartment_light.png',
                    width: screenWidth(context) / 5,
                    fit: BoxFit.fitWidth,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Hostel Manager',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 40),
              UserNameField(textEditingController: textEditingController),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  context.goNamed('dashboard');
                },
                child: const Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }
}
