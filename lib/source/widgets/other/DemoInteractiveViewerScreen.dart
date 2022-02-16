import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoInteractiveViewerScreen extends StatefulWidget {
  static String tag = '/DemoInteractiveViewerScreen';

  @override
  DemoInteractiveViewerScreenState createState() => DemoInteractiveViewerScreenState();
}

class DemoInteractiveViewerScreenState extends State<DemoInteractiveViewerScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    String SampleImageUrl = 'https://assets.iqonic.design/old-themeforest-images/prokit/images/defaultTheme/slider/01.jpg';

    return Scaffold(
      body: InteractiveViewer(
        child: CachedNetworkImage(placeholder: (context, url) => placeholderWidget(), imageUrl: SampleImageUrl).center(),
        boundaryMargin: EdgeInsets.all(5.0),
        minScale: 0.1,
        maxScale: 5.0,
        onInteractionEnd: (s) {
          print(s);
        },
        panEnabled: true,
        scaleEnabled: true,
      ),
    );
  }
  Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);

}
