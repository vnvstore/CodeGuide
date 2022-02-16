import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../models/models.dart';
import '../utils/AppWidget.dart';
import '../utils/T2DataGenerator.dart';
import '../utils/T2Slider.dart';
import '../utils/T2Strings.dart';

class DemoT2ImageSlider extends StatefulWidget {
  static var tag = "/DemoT2ImageSlider";

  @override
  DemoT2ImageSliderState createState() => DemoT2ImageSliderState();
}

class DemoT2ImageSliderState extends State<DemoT2ImageSlider> {
  var currentIndexPage = 0;
  List<T2Slider>? mSliderList;

  @override
  void initState() {
    super.initState();
    mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);

    return Scaffold(
      body: Observer(
        builder: (_) => Column(
          children: <Widget>[
            SizedBox(height: 16),
            T2SliderWidget(),
          ],
        ),
      ),
    );
  }
}
