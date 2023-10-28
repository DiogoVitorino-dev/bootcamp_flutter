import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_cropper/image_cropper.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  String photoPath = "";

  Future<void> cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: photoPath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    if (croppedFile != null) {
      await GallerySaver.saveImage(croppedFile.path);
      setImage(croppedFile.path);
    }
  }

  Future<void> openCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      await GallerySaver.saveImage(photo.path);
      setImage(photo.path);
    }
  }

  Future<void> openGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setImage(image.path);
    }
  }

  void setImage(String path) {
    setState(() {
      photoPath = path;
    });
  }

  void close() => Navigator.pop(context);

  void showOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(children: [
          ListTile(
            title: const Text("Camera"),
            leading: const Icon(Icons.camera_alt),
            onTap: () async {
              await openCamera();
              cropImage();
              close();
            },
          ),
          ListTile(
            title: const Text("Gallery"),
            leading: const Icon(Icons.photo),
            onTap: () async {
              await openGallery();
              cropImage();
              close();
            },
          )
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Tire fotos"),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: showOptions, child: const Icon(Icons.camera)),
            body: Image.file(File(photoPath))));
  }
}
