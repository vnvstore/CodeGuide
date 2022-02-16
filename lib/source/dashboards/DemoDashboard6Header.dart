import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'utils/DbColors.dart';
import 'utils/DbStrings.dart';

class DemoDashboard6Header extends StatefulWidget {
  static String tag = '/DemoDashboard6Header';

  @override
  DemoDashboard6HeaderState createState() => DemoDashboard6HeaderState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard6HeaderState extends State<DemoDashboard6Header> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double expandHeight = 260;

    changeStatusColor(db6_colorPrimary);

    return Scaffold(
      body: NestedScrollView(
        //Header
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: expandHeight,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              pinned: true,
              titleSpacing: 0,
              backgroundColor: innerBoxIsScrolled ? db6_colorPrimary : db6_colorPrimary,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: white),
                  onPressed: () {
                    finish(context);
                  }),
              title: Container(
                height: 60,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 8, 0),
                  child: Text(db6_username, style: boldTextStyle(color: db6_white, size: 24, fontFamily: fontBold)),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 70),
                  color: db6_colorPrimary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Text(db6_your_location, style: primaryTextStyle(color: db6_white)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 2, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: Icon(Icons.location_on, color: db6_white, size: 16),
                                    ),
                                  ),
                                  TextSpan(text: db6_san_francisco, style: primaryTextStyle(size: 18, color: db6_white)),
                                ],
                              ),
                            ),
                            Text(db6_change, style: primaryTextStyle(color: db6_white, size: 18)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), color: white),
                          child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                fillColor: db6_white,
                                hintText: db6_hint_search,
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                              )),
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: Container(),
      ),

      //Footer
      bottomNavigationBar: Text(""),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}
