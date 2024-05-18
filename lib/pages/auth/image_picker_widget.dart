import 'dart:io';

import 'package:e_store/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget(
      {super.key, required this.pickedImage, required this.function});
  final XFile? pickedImage;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: pickedImage == null
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
              )
            : Image.file(
                File(
                  pickedImage!.path,
                ),
                fit: BoxFit.fill,
              ),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: IconWidget(
          icon: IconlyLight.upload,
          function: function,
        ),
      )
    ]);
  }
}
