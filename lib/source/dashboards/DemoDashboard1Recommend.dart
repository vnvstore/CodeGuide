import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'model/Db1Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard1Recommend extends StatefulWidget {
  static String tag = '/DemoDashboard1Recommend';

  @override
  DemoDashboard1RecommendState createState() => DemoDashboard1RecommendState();
}

String fontMedium = 'Medium';

class DemoDashboard1RecommendState extends State<DemoDashboard1Recommend> {

  late List<DB1FoodModel> mListings3;

  @override
  void initState() {
    super.initState();
    mListings3 = getFoodItems();
    changeStatusColor(db1_colorPrimary);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: db1_colorPrimary,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(color: white, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 4),
                      child: Text(db1_lbl_recommended_dishes, style: primaryTextStyle(size: 20, fontFamily: fontMedium)),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: width * 0.6,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mListings3.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Recommended(mListings3[index], index);
                          }),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}
// ignore: must_be_immutable
class Recommended extends StatelessWidget {
  late DB1FoodModel model;

  Recommended(DB1FoodModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
        width: MediaQuery.of(context).size.width / 1.5,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Container(
                alignment: FractionalOffset.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(model.img, height: width * 0.38, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
                )),
            Container(
              transform: Matrix4.translationValues(0.0, -30.0, 0.0),
              margin: EdgeInsets.only(left: 20, right: 20, top: 0),
              decoration: BoxDecoration(
                color: white,
                shape: BoxShape.rectangle,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: dbShadowColor, blurRadius: 0.5, spreadRadius: 1),
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(model.name, style: primaryTextStyle(fontFamily: fontMedium), maxLines: 2),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(model.info, style: primaryTextStyle(color: db1_textColorSecondary)),
                          Text(model.duration, style: primaryTextStyle(color: db1_textColorSecondary)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

