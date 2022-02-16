import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/Db6Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard6SpecialPackageOffers extends StatefulWidget {
  static String tag = '/DemoDashboard6SpecialPackageOffers';

  @override
  DemoDashboard6SpecialPackageOffersState createState() => DemoDashboard6SpecialPackageOffersState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard6SpecialPackageOffersState extends State<DemoDashboard6SpecialPackageOffers> {
  late List<DB6Offer> mList3;

  @override
  void initState() {
    super.initState();
    mList3 = getOffer();
  }

  Widget db6Label(var text) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text, style: TextStyle(fontSize: 18, color: db6_black, fontFamily: fontMedium)),
          Text(db6_lbl_view_all, style: TextStyle(fontSize: 14, color: db6_textColorSecondary)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    changeStatusColor(db6_colorPrimary);
    return Scaffold(

      body: NestedScrollView(
        //Header
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar()
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Offers
                db6Label(db6_lbl_pkg_offers),
                SizedBox(
                  height: w * 0.4,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mList3.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return D6Special(mList3[index], index);
                      }),
                ),
                SizedBox(height: 16)
              ],
            ),
          ),
        ),
      ),

      //Footer
      bottomNavigationBar: Text(""),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }
}

// ignore: must_be_immutable
class D6Special extends StatelessWidget {
  late DB6Offer model;

  D6Special(DB6Offer model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.only(left: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(color: db6_white, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: defaultBoxShadow()),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(model.img, height: width * 0.17, width: width * 0.2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(model.title, style: primaryTextStyle()),
                Text(model.subTitle, style: primaryTextStyle(color: db6_colorPrimary, size: 20, fontFamily: 'Medium')),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
                      child: Text(db6_lbl_view_offers.toUpperCase(), style: primaryTextStyle(color: db6_white, fontFamily: 'Medium')),
                      decoration: BoxDecoration(color: db6_colorPrimary, borderRadius: BorderRadius.all(Radius.circular(6)))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
