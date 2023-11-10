import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/utils/textThemes.dart';

class PhoneSection extends StatefulWidget {
  const PhoneSection({
    super.key,
    required this.phones,
  });

  final List<String> phones;

  @override
  State<PhoneSection> createState() => _PhoneSectionState();
}

class _PhoneSectionState extends State<PhoneSection> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Phone number(s)',
                    style: titleMedium(context),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    String? result = await context.pushNamed('edit_phone');

                    if (result != null) {
                      widget.phones.add(result);
                      print(widget.phones);
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
              itemCount: widget.phones.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(widget.phones[index]),
                trailing: IconButton(
                  onPressed: () {
                    widget.phones.removeAt(index);
                    setState(() {});
                  },
                  iconSize: 20,
                  color: Colors.red,
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
