import 'package:flutter/material.dart';
import 'DemoMWListViewScreen1.dart';

class DemoMWListViewScreen4 extends StatefulWidget {
  static const tag = '/DemoMWListViewScreen4';

  @override
  _DemoMWListViewScreen4State createState() => _DemoMWListViewScreen4State();
}

class _DemoMWListViewScreen4State extends State<DemoMWListViewScreen4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: dataList.length,
            padding: EdgeInsets.only(bottom: 16),
            itemBuilder: (context, index) {
              return DataList(dataList[index], index);
            }),
      ),
    );
  }
}
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