import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/AppWidget.dart';
import '../models/T6Models.dart';
import '../utils/T6DataGenerator.dart';
import '../utils/T6Widget.dart';
import '../utils/Widget/T6SliderWidget.dart';
import 'package:nb_utils/nb_utils.dart';



class T6ImageSlider extends StatefulWidget {
  static String tag = '/T6ImageSlider';

  @override
  T6ImageSliderState createState() => T6ImageSliderState();
}

class T6ImageSliderState extends State<T6ImageSlider> {
  int selectedPos = 1;
  List<T6Slider>? mSliderList;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(titleName: "Image Slider"),
            SizedBox(height: 16),
            T6SliderWidget(mSliderList),
          ],
        ),
      ),
    );
  }
}
