import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';  //https://pub.dev/packages/liquid_swipe
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/DefaultLayout.dart';


class DemoLiquidSwipeScreen extends StatefulWidget {
  static String tag = '/DemoLiquidSwipeScreen';

  @override
  DemoLiquidSwipeScreenState createState() => DemoLiquidSwipeScreenState();
}

class DemoLiquidSwipeScreenState extends State<DemoLiquidSwipeScreen> {
  Color appColorPrimary = Color(0xFF1157FA);

  List<String> titles = ["Discover place near you", "Most Delicious Dishes!", "Just make an order!"];
  var subTitles = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text  ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text"
  ];

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);
    final pages = [
      DefaultLayout(
        title: titles[0],
        description: subTitles[0],
        color: Color(0xFF8ef6e4),
        imageLink: 'images/food/food_ic_walk1.svg',
      ),
      DefaultLayout(
        title: titles[1],
        description: subTitles[1],
        color: Color(0xFF9896f1),
        imageLink: 'images/food/food_ic_walk2.svg',
      ),
      DefaultLayout(
        title: titles[2],
        description: subTitles[2],
        color: Color(0xFFedb1f1),
        imageLink: 'images/food/food_ic_walk3.svg',
      ),
    ];

    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        enableLoop: false,
        waveType: WaveType.liquidReveal,
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}
