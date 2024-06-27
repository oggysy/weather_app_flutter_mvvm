import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingTransitionAlertDialog extends StatelessWidget {
  const SettingTransitionAlertDialog({
    super.key,
    required this.title,
    required this.message,
  });
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await openAppSettings();
          },
          child: const Text('設定に移動'),
        ),
      ],
    );
  }
}
