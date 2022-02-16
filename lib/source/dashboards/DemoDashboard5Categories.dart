import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/Db5Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';

class DemoDashboard5Categories extends StatefulWidget {
  static String tag = '/DemoDashboard5Categories';

  @override
  DemoDashboard5CategoriesState createState() => DemoDashboard5CategoriesState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard5CategoriesState extends State<DemoDashboard5Categories> {
  late List<Db5CategoryData> mListings;

  @override
  void initState() {
    super.initState();
    mListings = generateCategories();
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
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Categories
                  SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mListings.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return category(mListings[index], index);
                        }),
                  ),
                  //    SizedBox(height: 50,)
                ],
              ),
            )
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

// ignore: must_be_immutable, camel_case_types
class category extends StatelessWidget {
  late Db5CategoryData model;

  category(Db5CategoryData model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: db5_light_blue, borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SvgPicture.asset(model.image, height: 40, width: 40),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(model.name, style: primaryTextStyle(color: db5_textColorSecondary))
        ],
      ),
    );
  }
}
