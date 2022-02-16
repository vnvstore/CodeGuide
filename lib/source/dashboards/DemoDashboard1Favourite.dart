import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';  //https://pub.dev/packages/flutter_svg
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'model/Db1Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard1Favourite extends StatefulWidget {
  static String tag = '/DemoDashboard1Favourite';

  @override
  DemoDashboard1FavouriteState createState() => DemoDashboard1FavouriteState();
}

String fontMedium = 'Medium';

class DemoDashboard1FavouriteState extends State<DemoDashboard1Favourite> {

  late List<Db1CategoryModel> mListings1;

  @override
  void initState() {
    super.initState();
    mListings1 = getFilterFavourites();
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
                      child: Text(db1_lbl_filter_your_favourite, style: primaryTextStyle(size: 20, fontFamily: fontMedium)),
                    ),
                    SizedBox(
                      height: width * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mListings1.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Filter(mListings1[index], index);
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
class Filter extends StatelessWidget {
  late Db1CategoryModel model;

  Filter(Db1CategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: model.color, borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: SvgPicture.asset(model.img, height: width * 0.12, width: width * 0.12),
            ),
          ),
          Text(model.name, style: primaryTextStyle(color: db1_textColorSecondary))
        ],
      ),
    );
  }
}
