import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'CirclePainter.dart';
import 'LinePainter.dart';
import 'RectanglePainter.dart';
import 'RoundedRectanglePainter.dart';
import 'TrianglePainter.dart';
import 'modal/PainterScreenModal.dart';

class DemoShapeScreen extends StatefulWidget {
  @override
  DemoShapeScreenState createState() => DemoShapeScreenState();
}

enum PaintType {
  CIRCLE,
  RECTANGLE,
  ROUND_RECTANGLE,
  TRIANGLE,
  LINE,
}

class DemoShapeScreenState extends State<DemoShapeScreen> {
  int selectedIndex = 0;
  List<Colors> colors = [];
  bool isCheck = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  CustomPainter buildCustomPainter(PaintType paint, bool isFill) {
    switch (paint) {
      case PaintType.CIRCLE:
        return CirclePainter(ifFill: isFill);
      case PaintType.RECTANGLE:
        return RectanglePainter(isFill: isFill);
      case PaintType.ROUND_RECTANGLE:
        return RoundedRectanglePainter(isFill: isFill);
      case PaintType.TRIANGLE:
        return TrianglePainter(isFill: isFill);
      case PaintType.LINE:
        return LinePainter();
    }
  }

  PaintType? paintType = PaintType.CIRCLE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: appBarWidget('Custom Shape', color: context.scaffoldBackgroundColor),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                height: 300,
                child: CustomPaint(
                  painter: buildCustomPainter(paintType!, isCheck),
                ),
              ).center(),
              16.height,
              SettingSection(
                headingDecoration: boxDecorationDefault(
                  color: Color(0xFFECECEC),
                  borderRadius: radius(0),
                ),
                title: Text('Shapes', style: boldTextStyle()),
                items: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      PainterScreenModal.getData().length,
                      (index) {
                        PainterScreenModal data = PainterScreenModal.getData()[index];

                        return AppButton(
                          text: data.shapeName,
                          color: context.cardColor,
                          textColor: selectedIndex == index ? Color(0xFF1157FA) : textPrimaryColorGlobal,
                          onTap: () {
                            selectedIndex = index;
                            paintType = data.paint!;
                            setState(() {});
                          },
                          padding: EdgeInsets.all(8),
                          shapeBorder: RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                        );
                      },
                    ),
                  ).paddingAll(16),
                ],
              ),
              Row(
                children: [
                  16.width,
                  Text('Fill', style: boldTextStyle(size: 22)),
                  Checkbox(
                    value: isCheck,
                    fillColor: MaterialStateProperty.all(Color(0xFF1157FA)),
                    onChanged: (value) {
                      setState(
                        () {
                          isCheck = value!;
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
