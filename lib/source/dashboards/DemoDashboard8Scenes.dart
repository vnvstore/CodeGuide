import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/Db8Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard8Scenes extends StatefulWidget {
  static String tag = '/DemoDashboard8Scenes';

  @override
  DemoDashboard8ScenesState createState() => DemoDashboard8ScenesState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard8ScenesState extends State<DemoDashboard8Scenes> {
  late List<DB8Scene> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = getScene();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    width = width - 50;
    var mSelection = 0;
    Widget mHeading(var value) {
      return Container(
        margin: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(value, style: TextStyle(fontFamily: fontMedium) ),
            Icon(Icons.add, color: db8_textColorPrimary, size: 18),
          ],
        ),
      );
    }
    final scene = Container(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mList1.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                mSelection = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 16),
              decoration: BoxDecoration(color: mSelection == index ? db8_colorPrimary : db8_white, borderRadius: BorderRadius.circular(10),),
              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(mList1[index].img, width: width * 0.09, height: width * 0.09, color: mSelection == index ? db8_white : db8_textColorPrimary),
                  SizedBox(height: 4),
                  Text(mList1[index].name, style: TextStyle(color: mSelection == index ? db8_white : db8_textColorPrimary) ),
                ],
              ),
            ),
          );
        },
      ),
    );
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
                    Container(
                      padding: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)), color: db8_viewColor),
                      child: Column(
                        children: <Widget>[
                          //Scenes
                          mHeading(db8_lbl_scenes),
                          scene,

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
