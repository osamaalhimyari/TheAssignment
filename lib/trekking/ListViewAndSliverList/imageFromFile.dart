import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import 'CustomForm.dart';

class MyImageHandler extends StatelessWidget {
  final String imagePath;
  final String defaultImagePath;
  final double radius;
  final double height;
  final double width;
  const MyImageHandler({
    required this.imagePath,
    required this.defaultImagePath,
    required this.height,
    required this.width,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 5),
        borderRadius: BorderRadius.circular(radius),
      ),
      clipBehavior: Clip.hardEdge,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: FutureBuilder<bool>(
            future: checkImageExists(imagePath),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData && snapshot.data!) {
                return Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                );
              } else {
                return Image.asset(
                  defaultImagePath,
                  fit: BoxFit.cover,
                );
              }
            },
          )),
    );
  }

  Future<bool> checkImageExists(String imagePath) async {
    final file = File(imagePath);
    return await file.exists();
  }
}
