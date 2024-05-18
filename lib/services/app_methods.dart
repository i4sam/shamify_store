import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class AppMethods {
  static Future<dynamic> showMessageDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String errorMessage,
    IconData? icon,
    required bool isError,
    required Function fct,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(isError ? 'Error' : title),
          content: Text(isError ? errorMessage : message),
          actions: isError
              ? [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('CANCEL'),
                  ),
                ]
              : [
                  TextButton(
                    onPressed: () => fct(),
                    child: Text(
                      title.toUpperCase(),
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('CANCEL'),
                  )
                ],
          icon: Icon(isError ? Icons.error : icon),
        );
      },
    );
  }

  static Future<void> showImagePickerDialog({
    required BuildContext context,
    required Function cameraFunction,
    required Function galleryFunction,
    required Function removeFunction,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Center(
            child: TitleWidget(
              label: 'Choose an option',
              color: Theme.of(context).primaryColor,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  cameraFunction();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
                onTap: () {
                  galleryFunction();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Remove'),
                onTap: () {
                  removeFunction();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
