import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suitcore_flutter_getx_base_code/resources/resources.dart';

enum PickType {
  Camera,
  Galerry,
}

Future<File?> pickImage(PickType type) async {
  var image = await ImagePicker().pickImage(
    source:
        (type == PickType.Camera) ? ImageSource.camera : ImageSource.gallery,
  );
  if (image != null) {
    return File(image.path);
  }
  return null;
}

void dynamicPickImage({
  required BuildContext context,
  required void Function(File? image) image,
}) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Image Location",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 50,
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Resources.color.colorPrimary,
                          ),
                          onPressed: () async {
                            image(
                              await pickImage(PickType.Camera),
                            );
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 50,
                          icon: Icon(
                            Icons.image_outlined,
                            color: Resources.color.colorPrimary,
                          ),
                          onPressed: () async {
                            image(
                              await pickImage(PickType.Galerry),
                            );
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'Galerry',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
