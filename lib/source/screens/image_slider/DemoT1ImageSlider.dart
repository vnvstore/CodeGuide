import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/src/dots_decorator.dart';
import '../utils/src/dots_indicator.dart';
import '../utils/T1Colors.dart';
import '../utils/T1Images.dart';


class DemoT1ImageSlider extends StatefulWidget {
  static var tag = "/DemoT1ImageSlider";

  @override
  DemoT1ImageSliderState createState() => DemoT1ImageSliderState();
}

class DemoT1ImageSliderState extends State<DemoT1ImageSlider> {
  var currentIndexPage = 0;

  // List<T1Slider> mSliderList;
  @override
  void initState() {
    super.initState();
    // mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    return Observer(
      builder: (_) => Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.55,
              child: PageView(
                children: <Widget>[
                  Slider(file: t1_slider1),
                  Slider(file: t1_slider2),
                  Slider(file: t1_slider3),
                ],
                onPageChanged: (int i) {
                  setState(() {
                    currentIndexPage = i;
                  });
                },
              ),
            ),
            8.height,
            DotsIndicator(
                dotsCount: 3,
                position: currentIndexPage,
                decorator: DotsDecorator(
                  size: Size.square(8.0),
                  activeSize: Size.square(10.0),
                  color: t1_view_color,
                  activeColor: t1_colorPrimary,
                ))
          ],
        ),
      ),
    );
  }
}

class Slider extends StatelessWidget {
  final String file;

  Slider({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: CachedNetworkImage(
            placeholder: (context, url) => placeholderWidget(),
            imageUrl: file,
            fit: BoxFit.fill,
          )),
    );
  }
}
