import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/T5Models.dart';
import '../utils/AppWidget.dart';
import '../utils/T5Constant.dart';
import '../utils/T5DataGenerator.dart';
import '../utils/T5Strings.dart';
import '../utils/T5Widget.dart';
import '../utils/widgets/T5Slider.dart';

class DemoT5ImageSlider extends StatefulWidget {
  static var tag = "/DemoT5ImageSlider";

  @override
  DemoT5ImageSliderState createState() => DemoT5ImageSliderState();
}

class DemoT5ImageSliderState extends State<DemoT5ImageSlider> {
  int selectedPos = 1;
  List<T5Slider>? mSliderList;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(
      appStore.appBarColor,
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        color: context.scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 30),
              child: text(t5_image_slider, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeXLarge),
            ),
            T5SliderWidget(mSliderList),
          ],
        ),
      ),
    );
  }
}
