import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard8Power extends StatefulWidget {
  static String tag = '/DemoDashboard8Power';

  @override
  DemoDashboard8PowerState createState() => DemoDashboard8PowerState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard8PowerState extends State<DemoDashboard8Power> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    width = width - 50;

    Widget mOption(var icon, var value, var subValue) {
      return Row(
        children: <Widget>[
          SvgPicture.asset(icon, width: 22, height: 22),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(value, style: TextStyle(fontFamily: fontMedium) ),
              Text(subValue, style: TextStyle(color: db8_textColorSecondary, fontSize: 12.0) ),
            ],
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: db8_colorPrimary,
      body: SafeArea(
        child: Stack(
          children: <Widget>[

            SingleChildScrollView(
              padding: EdgeInsets.only(top: width * 0.4),
              child: Container(
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height - h * 0.13,
                decoration: BoxDecoration(color: db4_LayoutBackgroundWhite, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    //Power
                    Container(
                      decoration: BoxDecoration(color: db8_viewColor),
                      margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: mOption(db8_ic_plug, db8_lbl_29_5_kwh, db8_lbl_power_usage_today), flex: 1),
                          SizedBox(width: 8),
                          Expanded(child: mOption(db8_ic_power, db8_lbl_303_kwh, db8_lbl_power_usage_month), flex: 1)
                        ],
                      ),
                    ),


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
