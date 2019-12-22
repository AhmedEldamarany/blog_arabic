import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Photographia {
  File imageFile;
  bool imageUploadStatus = false;
  int idIncremental = 0;

  void setImageUploadedStatus(bool status) {
    imageUploadStatus = status;
  }

  bool getImageUploadStatus() {
    return imageUploadStatus;
  }

  Future<File> getImageFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<File> getImageFromCam() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    return image;
  }
}
