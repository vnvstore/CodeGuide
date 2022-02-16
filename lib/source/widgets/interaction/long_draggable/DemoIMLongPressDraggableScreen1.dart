import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoIMLongPressDraggableScreen1 extends StatefulWidget {
  static String tag = '/DemoIMLongPressDraggableScreen1';

  @override
  _DemoIMLongPressDraggableScreen1State createState() => _DemoIMLongPressDraggableScreen1State();
}

class _DemoIMLongPressDraggableScreen1State extends State<DemoIMLongPressDraggableScreen1> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Simple Draggable",
                style: boldTextStyle(),
              ).paddingOnly(bottom: 2),
              Text(
                "Widget movable around the screen",
                style: secondaryTextStyle(),
              ).paddingOnly(bottom: 16),
              LongPressDraggable(
                child: FlutterLogo(
                  size: 100,
                ),
                feedback: FlutterLogo(
                  size: 100,
                ),
                childWhenDragging: Container(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              Text(
                "Custom Draggable",
                style: boldTextStyle(),
              ).paddingOnly(bottom: 2),
              Text(
                "widget to be displayed in the original position & Widget is being dragged",
                style: secondaryTextStyle(),
              ).paddingOnly(bottom: 16),
              LongPressDraggable(
                child: FlutterLogo(
                  size: 100,
                ),
                feedback: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 100,
                ),
                childWhenDragging: Center(
                  child: Draggable(
                    child: FlutterLogo(
                      size: 100,
                    ),
                    feedback: FlutterLogo(
                      style: FlutterLogoStyle.stacked,
                      size: 100,
                    ),
                    childWhenDragging: Container(),
                  ),
                ),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              Text(
                "Custom Draggable",
                style: boldTextStyle(),
              ).paddingOnly(bottom: 2),
              Text(
                "widget must be changed when dragged",
                style: secondaryTextStyle(),
              ).paddingOnly(bottom: 16),
              LongPressDraggable(
                child: FlutterLogo(
                  size: 100,
                ),
                feedback: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 100,
                ),
                childWhenDragging: Container(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              Text(
                "Horizontal Draggable",
                style: boldTextStyle(),
              ).paddingOnly(bottom: 16),
              LongPressDraggable(
                axis: Axis.horizontal,
                child: FlutterLogo(
                  size: 100,
                ),
                feedback: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 100,
                ),
                childWhenDragging: Container(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              Text(
                "Vertical Draggable",
                style: boldTextStyle(),
              ).paddingOnly(bottom: 16),
              LongPressDraggable(
                axis: Axis.vertical,
                child: FlutterLogo(
                  size: 100,
                ),
                feedback: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 100,
                ),
                childWhenDragging: Container(),
              ).center(),
            ],
          ),
        ),
      ),
    );
  }
}
