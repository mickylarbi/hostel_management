import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hostel_management/utils/textThemes.dart';

class MoreListTile extends StatelessWidget {
  const MoreListTile({super.key, required this.more});
  final MoreItem more;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(more.route);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              more.title,
              style: titleMedium(context).copyWith(fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Icon(more.iconData),
          ],
        ),
      ),
    );
  }
}

class MoreItem {
  String title;
  IconData iconData;
  String route;

  MoreItem(this.title, this.iconData, this.route);
}
