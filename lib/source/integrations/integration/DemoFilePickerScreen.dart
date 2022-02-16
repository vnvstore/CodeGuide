import 'dart:io';
import 'package:file_picker/file_picker.dart';  //https://pub.dev/packages/file_picker
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoFilePickerScreen extends StatefulWidget {
  static String tag = '/DemoFilePickerScreen';

  @override
  DemoFilePickerScreenState createState() => DemoFilePickerScreenState();
}

class DemoFilePickerScreenState extends State<DemoFilePickerScreen> {
  Color appColorPrimary = Color(0xFF1157FA);
  File? file;
  String fileName = '', filePath = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  Future getFiles() async {
    FilePickerResult? _result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (_result != null) {
      file = File(_result.files.single.path!);
      fileName = file!.path.split('/').last;
      filePath = file!.path;
      setState(() { });
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("File Name:", style: boldTextStyle(size: 18)), 8.width, if (file != null) Text("$fileName", style: primaryTextStyle()).expand()],
          ).paddingAll(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("File Path:", style: boldTextStyle(size: 18)), 8.width, if (file != null) Text("$filePath", style: primaryTextStyle()).expand()],
          ).paddingAll(16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: appColorPrimary,
            ),
            onPressed: () async {
              await getFiles();
              setState(() {});
            },
            child: Text("Pick File", style: boldTextStyle(color: Colors.white, size: 18)),
          ).paddingOnly(left: 16).center(),
        ],
      ),
    );
  }
}
