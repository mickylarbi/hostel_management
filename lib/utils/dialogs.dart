import 'package:flutter/material.dart';

Future<T?> showAlertDialog<T>(BuildContext context,
        {String? message, Icon? icon}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: icon ??
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 60,
            ),
        content: Text(
          message ?? 'Something went wrong',
          textAlign: TextAlign.center,
        ),
      ),
    );
