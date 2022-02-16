import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWListViewScreen1 extends StatefulWidget {
  static const tag = '/DemoMWListViewScreen1';

  @override
  _DemoMWListViewScreen1State createState() => _DemoMWListViewScreen1State();
}

class _DemoMWListViewScreen1State extends State<DemoMWListViewScreen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 16),
            itemBuilder: (context, index) {
              return DataList(dataList[index], index);
            }),
      ),
    );
  }
}

// ignore: must_be_immutable
class DataList extends StatelessWidget {
  late DataModel model;

  DataList(DataModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: appStore.scaffoldBackgroundColor),
      padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        children: [
          Image.asset(
            model.images,
            height: 40,
            width: 40,
          ),
          16.width,
          Text(
            model.name,
            style: boldTextStyle(color: appStore.textPrimaryColor),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}

class DataModel {
  var images;
  var name;

  DataModel({
    this.images,
    this.name,
  });
}

List<DataModel> dataList = [
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/airplane.png',
    name: 'Travels',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/book.png',
    name: 'Education',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/computer.png',
    name: 'Management',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/finance.png',
    name: 'Finance',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/food.png',
    name: 'Food',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/graphic.png',
    name: 'Business',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/healthy.png',
    name: 'Yoga & Gym',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/heart.png',
    name: 'Health',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/airplane.png',
    name: 'Travel',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/book.png',
    name: 'Education',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/computer.png',
    name: 'Management',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/finance.png',
    name: 'Finance',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/food.png',
    name: 'Food',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/airplane.png',
    name: 'Travel',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/book.png',
    name: 'Education',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/computer.png',
    name: 'Management',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/finance.png',
    name: 'Finance',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/food.png',
    name: 'Food',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/graphic.png',
    name: 'Business',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/healthy.png',
    name: 'Yoga & Gym',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/heart.png',
    name: 'Health',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/airplane.png',
    name: 'Travel',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/book.png',
    name: 'Education',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/computer.png',
    name: 'Management',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/finance.png',
    name: 'Finance',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/food.png',
    name: 'Food',
  ),
];

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
  Color iconColorPrimaryDark = Color(0xFF212121);
  Color scaffoldBackground = Color(0xFFEBF2F7);
  Color backgroundColor = Colors.black;
  Color backgroundSecondaryColor = Color(0xFF131d25);
  Color appColorPrimaryLightColor = Color(0xFFF9FAFF);
  Color textSecondaryColor = Color(0xFF5A5C5E);
  Color appBarColor = Colors.white;
  Color iconColor = Color(0xFF212121);
  Color iconSecondaryColor = Color(0xFFA8ABAD);
  Color cardColor = Colors.white;
  Color appColorPrimary = Color(0xFF1157FA);
  Color scaffoldBackgroundColor = Color(0xFFEFEFEF);

  AppStore();

}
