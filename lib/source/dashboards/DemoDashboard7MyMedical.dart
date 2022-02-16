import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard7MyMedical extends StatefulWidget {
  static String tag = '/DemoDashboard7MyMedical';

  @override
  DemoDashboard7MyMedicalState createState() => DemoDashboard7MyMedicalState();
}

class DemoDashboard7MyMedicalState extends State<DemoDashboard7MyMedical> {

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
                //My Medical
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(db7_lbl_my_medical, style: boldTextStyle(size: 24)),
                      Icon(Icons.search, color: db7_textColorSecondary, size: 24),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.55,
                  child: PageView(
                    children: <Widget>[
                      Slider(file: db7_item1),
                      Slider(file: db7_item2),
                      Slider(file: db7_item3),
                    ],
                  ),
                ),
                SizedBox(height: 30),


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
class Slider extends StatelessWidget {
  final String file;

  Slider({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Image.asset(file, fit: BoxFit.fill),
      ),
    );
  }
}
