import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/room.dart';
import 'package:hostel_management/models/session.dart';
import 'package:hostel_management/utils/constants.dart';
import 'package:hostel_management/utils/string_helpers.dart';

class EditRoomPriceScreen extends StatefulWidget {
  const EditRoomPriceScreen({super.key});

  @override
  State<EditRoomPriceScreen> createState() => _EditRoomPriceScreenState();
}

class _EditRoomPriceScreenState extends State<EditRoomPriceScreen> {
  RoomSize? roomSize;
  int? capacity;
  String? price;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final roomPrice = GoRouterState.of(context).extra as RoomPrice?;
    if (roomPrice != null) {
      roomSize = roomPrice.roomSize;
      capacity = roomPrice.capacity;
      price = roomPrice.price.toString();
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${roomPrice == null ? 'Add' : 'Edit'} room price'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              DropdownButtonFormField<RoomSize>(
                value: roomSize,
                onChanged: roomPrice == null
                    ? (val) {
                        roomSize = val;
                      }
                    : null,
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
              const SizedBox(height: 20),
              DropdownButtonFormField<int>(
                value: capacity,
                onChanged: roomPrice == null
                    ? (val) {
                        capacity = val;
                      }
                    : null,
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
              TextFormField(
                initialValue: price,
                onChanged: (val) {
                  price = val;
                },
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Enter room price';
                  if (double.tryParse(val) == null) {
                    return 'Enter a valid price';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Price',
                  prefix: Text('$ghanaCedi: '),
                ),
              ),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.pop(RoomPrice(
                      roomSize: roomSize!,
                      capacity: capacity!,
                      price: double.parse(price!),
                    ));
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
