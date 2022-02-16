import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'model/Db1Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';
import 'utils/flutter_rating_bar.dart';

class DemoDashboard1Popular extends StatefulWidget {
  static String tag = '/DemoDashboard1Popular';

  @override
  DemoDashboard1PopularState createState() => DemoDashboard1PopularState();
}

String fontMedium = 'Medium';

class DemoDashboard1PopularState extends State<DemoDashboard1Popular> {

  late List<DB1FoodModel> mListings2;

  @override
  void initState() {
    super.initState();
    mListings2 = getPopular();
    changeStatusColor(db1_colorPrimary);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

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
                      padding: EdgeInsets.only(left: 20, bottom: 16),
                      child: Text(db1_lbl_popular, style: primaryTextStyle(size: 20, fontFamily: fontMedium)),
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mListings2.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Popular(mListings2[index], index);
                        }),
                    SizedBox(height: 16)
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
class Popular extends StatelessWidget {
  late DB1FoodModel model;

  Popular(DB1FoodModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(model.img, fit: BoxFit.fill, height: 80, width: 80),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(model.name, style: primaryTextStyle(fontFamily: fontMedium)),
              Text(model.info, style: primaryTextStyle(color: db1_textColorSecondary, size: 14), maxLines: 1),
              Row(
                children: <Widget>[
                  Text(model.duration, style: secondaryTextStyle(color: db1_textColorSecondary, size: 14), maxLines: 1),
                  VerticalDivider(color: db1_grey, width: 0.5),
                  RatingBar(
                    initialRating: 5,
                    minRating: 1,
                    itemSize: 16,
                    direction: Axis.horizontal,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: db1_yellow,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

