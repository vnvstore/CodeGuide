import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/Db6Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard6PopularLaundryNearby extends StatefulWidget {
  static String tag = '/DemoDashboard6PopularLaundryNearby';

  @override
  DemoDashboard6PopularLaundryNearbyState createState() => DemoDashboard6PopularLaundryNearbyState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard6PopularLaundryNearbyState extends State<DemoDashboard6PopularLaundryNearby> {
  late List<DB6Laundry> mList2;

  @override
  void initState() {
    super.initState();
    mList2 = getLaundry();
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
                //Nearby Laundry
                db6Label(db6_lbl_nearby_laundry),
                SizedBox(
                  height: w * 0.5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mList2.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return D6Popular(mList2[index], index);
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
class D6Popular extends StatelessWidget {
  late DB6Laundry model;

  D6Popular(DB6Laundry model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        margin: EdgeInsets.only(left: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: db6_white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: defaultBoxShadow(),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Image.asset(model.img, fit: BoxFit.fill, height: width * 0.2, width: width * 0.2)),
                  SizedBox(height: 10),
                  Divider(height: 0.5, color: db6_viewColor, thickness: 0.5),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(model.name, style: primaryTextStyle(size: 14)),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Icon(Icons.star_border, color: db6_yellow, size: 16),
                              ),
                            ),
                            TextSpan(text: model.rating, style: primaryTextStyle(size: 16, color: db6_textColorSecondary)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(model.location, style: primaryTextStyle(color: db6_textColorSecondary)),
                ],
              ),
            ),
          ],
        ));
  }
}

