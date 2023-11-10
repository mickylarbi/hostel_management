import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/room.dart';
import 'package:hostel_management/utils/string_helpers.dart';

// ignore: must_be_immutable
class EditRoomScreen extends StatefulWidget {
  const EditRoomScreen({super.key});

  @override
  State<EditRoomScreen> createState() => _EditRoomScreenState();
}

class _EditRoomScreenState extends State<EditRoomScreen> {
  String number = '';
  int? capacity;
  RoomSize? size;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final room = GoRouterState.of(context).extra as Room?;
    if (room != null) {
      number = room.number;
      capacity = room.capacity;
      size = room.size;
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${room == null ? 'Add' : 'Edit'} room'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              TextFormField(
                initialValue: number,
                onChanged: (val) {
                  number = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter room number';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Room number',
                  prefixIcon: Icon(Icons.numbers_outlined),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                value: capacity,
                onChanged: (val) {
                  capacity = val;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Choose a value for room capacity';
                  }
                  return null;
                },
                borderRadius: BorderRadius.circular(20),
                dropdownColor: Colors.grey[200],
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'Capacity',
                  prefixIcon: Icon(Icons.people_outline_rounded),
                ),
                items: List.generate(
                  3,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text('${index + 1}'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                value: size,
                onChanged: (val) {
                  size = val;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Choose room size';
                  }
                  return null;
                },
                borderRadius: BorderRadius.circular(20),
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'Size',
                  prefixIcon: Icon(Icons.room_preferences_outlined),
                ),
                items: RoomSize.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name.capitalize()),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.pop();
                  }
                },
                child: const Text('Save'),
              ),
              if (room != null) const SizedBox(height: 20),
              if (room != null)
                FilledButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.red.withOpacity(.2),
                    foregroundColor: Colors.red,
                  ),
                  child: const Text('Delete room'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
