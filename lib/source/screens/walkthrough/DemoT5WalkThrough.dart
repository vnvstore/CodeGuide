import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/dots_indicator.dart';
import '../utils/T5Colors.dart';
import '../utils/T5Images.dart';
import '../utils/T5Strings.dart';


class DemoT5WalkThrough extends StatefulWidget {
  static var tag = "/DemoT5WalkThrough";

  @override
  DemoT5WalkThroughState createState() => DemoT5WalkThroughState();
}

class DemoT5WalkThroughState extends State<DemoT5WalkThrough> {
  int currentIndexPage = 0;
  var titles = [t5_quickly_and_easily, t5_shopping_online, t5_manage_your_finance, t5_welcome_to_mollet];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PageView(
            children: <Widget>[
              WalkThrough(textContent: t5_quickly_and_easily, bgImg: t5_bg_walk_1, walkImg: t5_ic_walk_1),
              WalkThrough(textContent: t5_shopping_online, bgImg: t5_walk_2, walkImg: t5_ic_walk_3),
              WalkThrough(textContent: t5_manage_your_finance, bgImg: t5_bg_walk_3, walkImg: t5_ic_walk_2),
              WalkThrough(textContent: t5_welcome_to_mollet, walkImg: t5_ic_walk_1),
            ],
            onPageChanged: (value) {
              setState(() => currentIndexPage = value);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: DotsIndicator(
                dotsCount: 4,
                position: currentIndexPage,
                decorator: DotsDecorator(
                  size: Size.square(8.0),
                  activeSize: Size.square(12.0),
                  color: t5ViewColor,
                  activeColor: t5ColorPrimary,
                )),
          ),
        )
      ],
    ));
  }
}

class WalkThrough extends StatelessWidget {
  final String? textContent;
  final String? bgImg;
  final String? walkImg;

  WalkThrough({Key? key, this.textContent, this.bgImg, this.walkImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: h * 0.05),
                height: h * 0.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    bgImg != null ? Image.asset(bgImg!, width: width, height: h * 0.5, fit: BoxFit.fill) : Container(),
                    CachedNetworkImage(
                      placeholder: (context, url) => placeholderWidget(),
                      imageUrl: walkImg!,
                      width: width * 0.8,
                      height: h * 0.6,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.08,
              ),
              text(textContent, textColor: appStore.textPrimaryColor, fontSize: 20.0, fontFamily: 'Medium'),
              Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0),
                child: text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.simply duumy text ", fontSize: 16.0, maxLine: 3, isCentered: true),
              )
            ],
          ),
        ),
        bgImg == null
            ? Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    toasty(context, "Sign in clicked");
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 50),
                    alignment: Alignment.center,
                    height: width / 8,
                    child: text(t5_sign_in, textColor: t5White, isCentered: true),
                    decoration: boxDecoration(bgColor: t5ColorPrimary, radius: 8),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
