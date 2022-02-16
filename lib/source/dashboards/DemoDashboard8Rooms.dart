import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/Db8Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard8Rooms extends StatefulWidget {
  static String tag = '/DemoDashboard8Rooms';

  @override
  DemoDashboard8RoomsState createState() => DemoDashboard8RoomsState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard8RoomsState extends State<DemoDashboard8Rooms> {
  late List<DB8Rooms> mList2;

  @override
  void initState() {
    super.initState();
    mList2 = getRooms();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    width = width - 50;

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
