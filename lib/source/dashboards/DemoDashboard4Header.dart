import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard4Header extends StatefulWidget {
  static String tag = '/DemoDashboard4Header';

  @override
  DemoDashboard4HeaderState createState() => DemoDashboard4HeaderState();
}
const fontMedium = 'Medium';
class DemoDashboard4HeaderState extends State<DemoDashboard4Header> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(db4_colorPrimary);

    var width = MediaQuery.of(context).size.width;
    width = width - 50;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: db4_colorPrimary,
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            //Header
            Container(
              height: 70,
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(backgroundImage: AssetImage(db_profile), radius: 25),
                      SizedBox(width: 16),
                      Text(db4_username, style: primaryTextStyle(color: white, size: 20, fontFamily: fontMedium))
                    ],
                  ),
                  SvgPicture.asset(db4_options, width: 25, height: 25, color: white)
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Text(""),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}

