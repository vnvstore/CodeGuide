import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

import 'utils/rest_apis.dart';
import 'utils/common.dart';
import 'utils/follower_model.dart';

class DemoGETMethodExampleScreen extends StatefulWidget {
  static String tag = '/DemoGETMethodExampleScreen';

  @override
  DemoGETMethodExampleScreenState createState() => DemoGETMethodExampleScreenState();
}

class DemoGETMethodExampleScreenState extends State<DemoGETMethodExampleScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget followerList(List<FollowerModel> data) {
      return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(8, 8, 8, 70),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor),
            child: Row(
              children: [
                networkImage(data[index].avatar_url, fit: BoxFit.fill, aWidth: 60, aHeight: 60).cornerRadiusWithClipRRect(50),
                10.width,
                Text(data[index].login!, style: boldTextStyle()),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: FutureBuilder<List<FollowerModel>>(
        future: getFollowers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text(snapshot.error as String).center();
          if (snapshot.hasData) return followerList(snapshot.data!);
          return loadingWidgetMaker().center();
        },
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