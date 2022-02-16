import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/Db6Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard6TopServices extends StatefulWidget {
  static String tag = '/DemoDashboard6TopServices';

  @override
  DemoDashboard6TopServicesState createState() => DemoDashboard6TopServicesState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard6TopServicesState extends State<DemoDashboard6TopServices> {
  late List<DB6Service> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = getTopLaundryService();

  }

  Widget db6Label(var text) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text, style: TextStyle(fontSize: 18, color: db6_black, fontFamily: fontMedium)),
          Text(db6_lbl_view_all, style: TextStyle(fontSize: 14, color: db6_textColorSecondary)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    changeStatusColor(db6_colorPrimary);
    return Scaffold(

      body: NestedScrollView(
        //Header
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar()
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Top Services
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16, 0, 16),
                  child: Text(
                    db6_lbl_top_services,
                    style: primaryTextStyle(size: 20, fontFamily: fontBold),
                  ),
                ),
                SizedBox(
                  height: w * 0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mList1.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return D6TopService(mList1[index], index);
                      }),
                ),
                SizedBox(height: 16)
              ],
            ),
          ),
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

// ignore: must_be_immutable
class D6TopService extends StatelessWidget {
  late DB6Service model;

  D6TopService(DB6Service model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: db6_white, boxShadow: [BoxShadow(color: dbShadowColor, blurRadius: 10, spreadRadius: 2)]),
            width: width * 0.2,
            height: width * 0.2,
            padding: EdgeInsets.all(width * 0.05),
            child: Image.asset(
              model.img,
            ),
          ),
          SizedBox(height: 6),
          Text(model.name, style: primaryTextStyle(color: db1_textColorSecondary))
        ],
      ),
    );
  }
}

