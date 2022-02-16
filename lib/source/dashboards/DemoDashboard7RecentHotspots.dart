import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard7RecentHotspots extends StatefulWidget {
  static String tag = '/DemoDashboard7RecentHotspots';

  @override
  DemoDashboard7RecentHotspotsState createState() => DemoDashboard7RecentHotspotsState();
}

class DemoDashboard7RecentHotspotsState extends State<DemoDashboard7RecentHotspots> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget mOption(var icon, var value, var subValue, var iconColor, var bgColor) {
      return Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
            width: width * 0.08,
            height: width * 0.08,
            padding: EdgeInsets.all(6),
            child: SvgPicture.asset(icon, width: width * 0.05, height: width * 0.05, color: iconColor),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(value, style: primaryTextStyle(fontFamily: 'Medium')),
              Text(subValue, style: primaryTextStyle(color: db7_textColorSecondary, size: 12)),
            ],
          )
        ],
      );
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Recent Hotspots
                      Text(db7_lbl_recent_hotspots, style: boldTextStyle(size: 20)),
                      SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: mOption(db7_ic_plus, db7_lbl_registered, db7_lbl_just_5_minutes, db7_colorPrimary, db7_light_green),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: mOption(db7_ic_warning, db7_lbl_inquiry, db7_lbl_multiple_problems, db7_dark_blue, db7_light_blue),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: mOption(db7_ic_drugs, db7_lbl_pharmacy, db7_lbl_life_medication, db7_dark_yellow, db7_light_yellow),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: mOption(db7_ic_books_piled, db7_lbl_lecture, db7_lbl_inspection_report, db7_dark_red, db7_light_red),
                          )
                        ],
                      ),
                      Divider(height: 50),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      //Footer
      bottomNavigationBar: Text(""),
    );
  }

}


