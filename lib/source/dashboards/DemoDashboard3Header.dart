import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart'; //https://pub.dev/packages/nb_utils
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard3Header extends StatefulWidget {
  static String tag = '/DemoDashboard3Header';

  @override
  DemoDashboard3HeaderState createState() => DemoDashboard3HeaderState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard3HeaderState extends State<DemoDashboard3Header> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    changeStatusColor(Colors.transparent);

    double expandHeight = MediaQuery.of(context).size.height * 0.33;
    return Scaffold(
      body: NestedScrollView(
        //header
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: expandHeight,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              pinned: true,
              titleSpacing: 0,
              backgroundColor: innerBoxIsScrolled ? db3_white : db3_white,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              title: Container(
                height: 60,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            db3_lbl_home,
                            style: boldTextStyle(
                                color: db3_textColorPrimary,
                                size: 20,
                                fontFamily: fontBold),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon:
                                Icon(Icons.search, color: db3_textColorPrimary),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart,
                                color: db3_textColorPrimary),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: expandHeight,
                  child: Stack(
                  children: <Widget>[
                    Container(
                      child: PageView(
                        children: <Widget>[
                          Db3Slider(
                            img: db3_ic_sofa,
                            heading: "Make yourself \nat home",
                            subheading:
                                "We love clean design and natural \nfurniture solutions",
                          ),
                          Db3Slider(
                            img: db3_ic_sofa2,
                            heading: "Make yourself \nat home",
                            subheading:
                                "We love clean design and natural \nfurniture solutions",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }
}

class Db3Slider extends StatelessWidget {
  final String img, heading, subheading;

  Db3Slider(
      {Key? key,
      required this.img,
      required this.heading,
      required this.subheading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(img, fit: BoxFit.cover)),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(heading,
                    style: primaryTextStyle(
                        color: db3_white, size: 24, fontFamily: fontBold),
                    maxLines: 2),
                SizedBox(height: 4),
                Text(subheading,
                    style: primaryTextStyle(
                        color: db3_white, fontFamily: fontMedium),
                    maxLines: 2),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

