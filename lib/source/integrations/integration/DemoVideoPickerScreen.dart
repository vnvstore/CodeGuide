import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';  //https://pub.dev/packages/image_picker
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'package:video_player/video_player.dart';  //https://pub.dev/packages/video_player

class DemoVideoPickerScreen extends StatefulWidget {
  static String tag = '/DemoVideoPickerScreen';

  @override
  DemoVideoPickerScreenState createState() => DemoVideoPickerScreenState();
}

class DemoVideoPickerScreenState extends State<DemoVideoPickerScreen> {
  Color appColorPrimary = Color(0xFF1157FA);

  PickedFile? pickVideo;
  String videoName = '', videoPath = '';
  VideoPlayerController? _controller;
  bool isVideoPlay = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future getVideo() async {
    pickVideo = await ImagePicker().getVideo(source: ImageSource.gallery);

    if (pickVideo != null) {
      videoName = pickVideo!.path.split('/').last;
      videoPath = pickVideo!.path;
      _controller = VideoPlayerController.file(File(pickVideo!.path));
      _controller!.initialize().then(
        (value) {
          setState(() {
            _controller!.pause();
          });
        },
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Video Name:", style: boldTextStyle(size: 18)),
                  8.width,
                  if (pickVideo != null) Text("$videoName", style: TextStyle(fontSize: 18, color: Colors.black)).expand(),
                ],
              ).paddingAll(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Video Path:", style: boldTextStyle(size: 18)),
                  8.width,
                  if (pickVideo != null) Text("$videoPath", style: TextStyle(fontSize: 18, color: Colors.black)).expand(),
                ],
              ).paddingAll(16),
              if (pickVideo != null)
                Container(
                  height: context.height(),
                  child: AspectRatio(
                    child: VideoPlayer(_controller!),
                    aspectRatio: _controller!.value.aspectRatio,
                  ),
                ).center(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: appColorPrimary,
                ),
                onPressed: () async {
                  await getVideo();
                  setState(() {});
                },
                child: Text("Pick Video", style: boldTextStyle(size: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
        floatingActionButton: pickVideo != null
            ? FloatingActionButton(
                backgroundColor: appColorPrimary,
                onPressed: () {
                  isVideoPlay ? _controller!.pause() : _controller!.play();
                  isVideoPlay = !isVideoPlay;
                  setState(() {});
                },
                child: isVideoPlay ? Icon(Icons.pause, color: Colors.white) : Icon(Icons.play_arrow_sharp, color: Colors.white),
              )
            : null,
      ),
    );
  }
}
