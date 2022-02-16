import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard8Header extends StatefulWidget {
  static String tag = '/DemoDashboard8Header';

  @override
  DemoDashboard8HeaderState createState() => DemoDashboard8HeaderState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard8HeaderState extends State<DemoDashboard8Header> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;

    return Scaffold(
      backgroundColor: db8_colorPrimary,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            //Header
            Container(
              height: width * 0.4,
              margin: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.menu, color: db8_white, size: 24),
                      Text(db8_lbl_control_panel, style: TextStyle(color: db8_white, fontSize: 20.0, fontFamily: fontBold) ),
                      SvgPicture.asset(db8_ic_notification, color: db8_white, width: 24, height: 24),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SvgPicture.asset(db8_ic_storm, color: db8_white, width: 22, height: 22),
                          Text(db8_lbl_lightning, style: TextStyle(color: db8_white) ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(db8_lbl_19_c, style: TextStyle(color: db8_white, fontSize: 18.0) ),
                          Text(db8_lbl_temp_outside, style: TextStyle(color: db8_white) ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(db8_lbl_25_c, style: TextStyle(color: db8_white, fontSize: 18.0) ),
                          Text(db8_lbl_temp_indoor, style: TextStyle(color: db8_white) ),
                        ],
                      ),
                    ],
                  ),
                ],
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

