import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard2Offers extends StatefulWidget {
  static String tag = '/DemoDashboard2Offers';

  @override
  DemoDashboard2OffersState createState() => DemoDashboard2OffersState();
}

const CURVE_HEIGHT = 100.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.8;
const fontMedium = 'Medium';

class DemoDashboard2OffersState extends State<DemoDashboard2Offers> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    changeStatusColor(db2_colorSecondary);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    //Offers
                    Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 16),
                      child: Text(
                        db2_lbl_offers,
                        style: primaryTextStyle(size: 20, fontFamily: fontMedium),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 16, left: 16),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.38,
                      child: PageView(
                        children: <Widget>[
                          Db2Slider(file: b1),
                          Db2Slider(file: b2),
                          Db2Slider(file: b3),
                          Db2Slider(file: b4),
                          Db2Slider(file: b5),
                          Db2Slider(file: b6),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }
}


class Db2Slider extends StatelessWidget {
  final String file;

  Db2Slider({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Image.asset(file, fit: BoxFit.fill),
      ),
    );
  }
}

