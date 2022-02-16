import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'model/Db1Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard1Top extends StatefulWidget {
  static String tag = '/DemoDashboard1Top';

  @override
  DemoDashboard1TopState createState() => DemoDashboard1TopState();
}

String fontMedium = 'Medium';

class DemoDashboard1TopState extends State<DemoDashboard1Top> {

  late List<Db1CategoryModel> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getCategories();
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
                      padding: EdgeInsets.only(left: 20, bottom: 16),
                      child: Text(db1_top_picks_for_you, style: primaryTextStyle(size: 20, fontFamily: fontMedium)),
                    ),
                    SizedBox(
                      height: width * 0.33,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mListings.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Category(mListings[index], index);
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
class Category extends StatelessWidget {
  late Db1CategoryModel model;

  Category(Db1CategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(model.img, fit: BoxFit.fill, height: width * 0.2, width: width * 0.2),
          ),
          SizedBox(height: 4),
          Text(model.name, style: primaryTextStyle(size: 14))
        ],
      ),
    );
  }
}
