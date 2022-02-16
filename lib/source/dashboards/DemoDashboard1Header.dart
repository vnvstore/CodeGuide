import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard1Header extends StatefulWidget {
  static String tag = '/DemoDashboard1Header';

  @override
  DemoDashboard1HeaderState createState() => DemoDashboard1HeaderState();
}

String fontMedium = 'Medium';

class DemoDashboard1HeaderState extends State<DemoDashboard1Header> {


  @override
  void initState() {
    super.initState();
    changeStatusColor(db1_colorPrimary);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: db1_colorPrimary,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 70,
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: white, width: 2)),
                            child: CircleAvatar(backgroundImage: AssetImage(db_profile), radius: 25),
                          ),
                          SizedBox(width: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[Text(db1_address, style: primaryTextStyle(color: white))],
                          )
                        ],
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  Icon(Icons.search, color: white)
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
