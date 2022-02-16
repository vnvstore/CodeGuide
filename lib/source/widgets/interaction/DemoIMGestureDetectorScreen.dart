import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoIMGestureDetectorScreen extends StatefulWidget {
  static String tag = '/DemoIMGestureDetectorScreen';

  @override
  _DemoIMGestureDetectorScreenState createState() => _DemoIMGestureDetectorScreenState();
}

class _DemoIMGestureDetectorScreenState extends State<DemoIMGestureDetectorScreen> {
  Color appDividerColor = Color(0xFFDADADA);

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
    Widget mImg() {
      return FlutterLogo(
        size: 100,
      );
    }

    Widget mTitle(var value) {
      return Text(
        value,
        style: boldTextStyle(),
      ).paddingOnly(bottom: 16);
    }

    late DragStartDetails startVerticalDragDetails;
    late DragUpdateDetails updateVerticalDragDetails;
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mTitle(
                "Simple Tap",
              ),
              GestureDetector(
                onTap: () {
                  toasty(context, "Simple Tap");
                },
                child: mImg(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              mTitle(
                "Double Tap",
              ),
              GestureDetector(
                onDoubleTap: () {
                  toasty(context, "Double Tap");
                },
                child: mImg(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              mTitle(
                "Long press",
              ),
              GestureDetector(
                onLongPress: () {
                  toasty(context, "Long press");
                },
                child: mImg(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              mTitle(
                "Swipe",
              ),
              GestureDetector(
                onPanStart: (details) {
                  toasty(context, "onPan started");
                },
                onPanEnd: (details) {
                  toasty(context, "onPan ended");
                },
                child: mImg(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              mTitle(
                "Vertical swipe ",
              ),
              GestureDetector(
                      onVerticalDragStart: (dragDetails) {
                        startVerticalDragDetails = dragDetails;
                      },
                      onVerticalDragUpdate: (dragDetails) {
                        updateVerticalDragDetails = dragDetails;
                      },
                      onVerticalDragEnd: (endDetails) {
                        double dx = updateVerticalDragDetails.globalPosition.dx - startVerticalDragDetails.globalPosition.dx;
                        double dy = updateVerticalDragDetails.globalPosition.dy - startVerticalDragDetails.globalPosition.dy;
                        double velocity = endDetails.primaryVelocity!;

                        //Convert values to be positive
                        if (dx < 0) dx = -dx;
                        if (dy < 0) dy = -dy;

                        if (velocity < 0) {
                          toasty(context, " Swipe Up");
                        } else {
                          toasty(context, " Swipe Down ");
                        }
                      },
                      child: mImg())
                  .center(),
            ],
          ),
        ),
      ),
    );
  }
}
