import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'DemoCurvedCustomPaint.dart';

class DemoCustomRoundBubbleAnimationScreen extends StatefulWidget {
  @override
  DemoCustomRoundBubbleAnimationScreenState createState() => DemoCustomRoundBubbleAnimationScreenState();
}

class DemoCustomRoundBubbleAnimationScreenState extends State<DemoCustomRoundBubbleAnimationScreen> {
  double width = 550;
  double height = 350;
  List<Circular> circulars = [];
  Timer? drawTimer;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
   setup();
   loop();
    //
  }
  setup() {
    for (var i = 0; i < 20; i++) {
      double r = random(10, 20).toDouble();
      double x = random(
        (0 + r).toInt(),
        (width - r).toInt(),
      ).toDouble();
      double y = -(10 + r);
      Color color = Color.fromARGB(
        255,
        random(0, 255),
        random(0, 255),
        random(0, 255),
      );
      circulars.add(Circular(x, y, r, color));
    }
  }
  draw() {
    for (var i = circulars.length - 1; i >= 0; i--) {
      Circular c = circulars[i];
      c.update();
      if (c.edge(height)) {
        circulars.remove(c);
      }
    }
  }
  noLoop() {
    drawTimer!.cancel();
  }
  loop() {
    drawTimer = Timer.periodic(
      Duration(milliseconds: 60),
          (_) {
        draw();
        setState(() {});
      },
    );
  }


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Curved painter',center: true,color: context.scaffoldBackgroundColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomPaint(
            foregroundPainter: DemoCurvedCustomPaint(circulars),
            child: Container(
              width: width,
              height: height,

            ),
          ).center(),

          AppButton(
            text: 'Re-paint',
            color: context.cardColor,
            textColor: Colors.black,

            onTap: (){
              setup();
            },
          )
        ],
      ).center().paddingBottom(16),
    );
  }
}


