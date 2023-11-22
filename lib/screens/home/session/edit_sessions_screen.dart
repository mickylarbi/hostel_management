import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/models/session.dart';
import 'package:hostel_management/utils/constants.dart';
import 'package:hostel_management/utils/dialogs.dart';
import 'package:hostel_management/utils/string_helpers.dart';
import 'package:hostel_management/utils/textThemes.dart';
import 'package:intl/intl.dart';

class EditSessionScreen extends StatefulWidget {
  const EditSessionScreen({super.key});

  @override
  State<EditSessionScreen> createState() => _EditSessionScreenState();
}

class _EditSessionScreenState extends State<EditSessionScreen> {
  String? title;
  DateTime? startDate;
  DateTime? endDate;
  List<RoomPrice> roomPrices = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final session = GoRouterState.of(context).extra as Session?;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${session == null ? 'Add' : 'Edit'} session'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              TextFormField(
                initialValue: title,
                onChanged: (val) {
                  title = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter session title';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Session title',
                  prefixIcon: Icon(Icons.short_text_rounded),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Start date:',
                style: labelMedium(context),
              ),
              StatefulBuilder(builder: (context, setState) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        startDate == null
                            ? '-'
                            : DateFormat.yMMMMd().format(startDate!),
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextButton.icon(
                      onPressed: () async {
                        startDate = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 366)),
                              lastDate: DateTime.now()
                                  .add(const Duration(days: 366 * 2)),
                            )) ??
                            startDate;
                        setState(() {});
                      },
                      icon: const Icon(Icons.calendar_month_outlined),
                      label: Text(
                          '${startDate == null ? 'Choose' : 'Change'} date'),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 28),
              Text(
                'End date:',
                style: labelMedium(context),
              ),
              StatefulBuilder(builder: (context, setState) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        startDate == null
                            ? '-'
                            : DateFormat.yMMMMd().format(startDate!),
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextButton.icon(
                      onPressed: () async {
                        startDate = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 366)),
                              lastDate: DateTime.now()
                                  .add(const Duration(days: 366 * 2)),
                            )) ??
                            startDate;
                        setState(() {});
                      },
                      icon: const Icon(Icons.calendar_month_outlined),
                      label: Text(
                          '${startDate == null ? 'Choose' : 'Change'} date'),
                    ),
                  ],
                );
              }),
              const Divider(height: 28),
              StatefulBuilder(builder: (context, setState) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Room Prices',
                            style: titleMedium(context)
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () async {
                            RoomPrice? result =
                                await context.pushNamed('edit_room_price');

                            if (result != null) {
                              if (roomPrices
                                  .where((element) =>
                                      element.capacity == result.capacity &&
                                      element.roomSize == result.roomSize)
                                  .isNotEmpty) {
                                showAlertDialog(context,
                                    message: 'Room type already has a price');
                              } else {
                                roomPrices.add(result);
                                setState(() {});
                              }
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
                      itemCount: roomPrices.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () async {
                          RoomPrice? result = await context.pushNamed(
                            'edit_room_price',
                            extra: roomPrices[index],
                          );

                          if (result != null) {
                            if (roomPrices
                                .where((element) =>
                                    element.capacity == result.capacity &&
                                    element.roomSize == result.roomSize)
                                .isNotEmpty) {
                              showAlertDialog(context,
                                  message: 'Room type already has a price');
                            } else {
                              roomPrices
                                  .replaceRange(index, index + 1, [result]);
                              setState(() {});
                            }
                          }
                        },
                        title: Text(
                            '${roomPrices[index].capacity} in 1 (${roomPrices[index].roomSize.name.capitalize()})'),
                        subtitle: Text(
                            '$ghanaCedi ${roomPrices[index].price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          onPressed: () {
                            roomPrices.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(Icons.clear, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
