import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';  //https://pub.dev/packages/image_picker
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoImagePickerScreen extends StatefulWidget {
  static String tag = '/DemoImagePickerScreen';

  @override
  DemoImagePickerScreenState createState() => DemoImagePickerScreenState();
}

class DemoImagePickerScreenState extends State<DemoImagePickerScreen> {
  Color appColorPrimary = Color(0xFF1157FA);
  PickedFile? pickImage;
  String fileName = '', filePath = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future getImage() async {
    pickImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickImage != null) {
      fileName = pickImage!.path.split('/').last;
      filePath = pickImage!.path;
      setState(() {});
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("File Name:", style: boldTextStyle(size: 18)), 8.width, if (pickImage != null) Text("$fileName", style: TextStyle(fontSize: 18, color: Colors.black)).expand()],
              ).paddingAll(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("File Path:", style: boldTextStyle(size: 18)), 8.width, if (pickImage != null) Text("$filePath", style: TextStyle(fontSize: 18, color: Colors.black)).expand()],
              ).paddingAll(16),
              if (pickImage != null)
                Container(
                  width: context.width() * 0.9,
                  height: 500,
                  child: kIsWeb ? Image.network(pickImage!.path,fit: BoxFit.cover,): Image.file(File(pickImage!.path), fit: BoxFit.cover),
                ).center(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: appColorPrimary,
                ),
                onPressed: () async {
                  await getImage();
                },
                child: Text("Pick Image", style: boldTextStyle(size: 18, color: Colors.white)),
              ).center().paddingAll(16),
            ],
          ),
        ),
      ),
    );
  }
}
