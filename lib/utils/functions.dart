import 'package:flutter/material.dart';

Future<dynamic> showCustomBottomSheet(
    BuildContext context, List<Widget> children) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return BottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        onClosing: () {},
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          );
        },
      );
    },
  );
}
