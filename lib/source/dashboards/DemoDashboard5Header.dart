import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'utils/DbColors.dart';
import 'utils/DbStrings.dart';

class DemoDashboard5Header extends StatefulWidget {
  static String tag = '/DemoDashboard5Header';

  @override
  DemoDashboard5HeaderState createState() => DemoDashboard5HeaderState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard5HeaderState extends State<DemoDashboard5Header> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(db5_colorPrimary);
    return Scaffold(
      backgroundColor: db5_white,

      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            //Header
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(db5_hi_juila, style: primaryTextStyle(size: 20, color: db5_colorPrimary)),
                      Icon(Icons.search, color: db5_icon_color),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(db5_you_are_in_54_king_ports, style: primaryTextStyle(color: db5_textColorSecondary, size: 14)),
                    ],
                  )
                ],
              ),
            ),

          ],
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
