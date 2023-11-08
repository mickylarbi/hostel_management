import 'package:flutter/material.dart';

class UserNameField extends StatefulWidget {
  const UserNameField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  State<UserNameField> createState() => _UserNameFieldState();
}

class _UserNameFieldState extends State<UserNameField> {
  final ValueNotifier<bool> obscureTextNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obscureTextNotifier,
      builder: (context, value, child) {
        return TextFormField(
          controller: widget.textEditingController,
          obscureText: value,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Username',
            hintStyle: TextStyle(color: Colors.grey[500]),
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            prefixIcon:
                Icon(Icons.person_outline_rounded, color: Colors.grey[500]),
            suffixIcon: GestureDetector(
              onTap: () {
                obscureTextNotifier.value = !value;
              },
              child: Icon(value
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
            ),
          ),
        );
      },
    );
  }

  void dispose() {
    obscureTextNotifier.dispose();

    super.dispose();
  }
}
