import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/Db8Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard8 extends StatefulWidget {
  static String tag = '/DemoDashboard8';

  @override
  DemoDashboard8State createState() => DemoDashboard8State();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard8State extends State<DemoDashboard8> {
  late List<DB8Scene> mList1;
  late List<DB8Rooms> mList2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mList1 = getScene();
    mList2 = getRooms();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    width = width - 50;
    var mSelection = 0;

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

                    Container(
                      padding: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)), color: db8_viewColor),
                      child: Column(
                        children: <Widget>[
                          //Scenes
                          mHeading(db8_lbl_scenes),
                          scene,
                          //Rooms
                          mHeading(db8_lbl_rooms),
                          SizedBox(
                            height: 220,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mList2.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Rooms(mList2[index], index);
                              },
                            ),
                          ),
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

// ignore: must_be_immutable
class Rooms extends StatelessWidget {
  late DB8Rooms model;

  Rooms(DB8Rooms model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(model.img, height: width * 0.3, fit: BoxFit.fill),
          Text(model.name, style: TextStyle(fontFamily: fontMedium) ),
          Text(model.device, style: TextStyle(color: db8_textColorSecondary) ),

        ],
      ),
    );
  }
}
