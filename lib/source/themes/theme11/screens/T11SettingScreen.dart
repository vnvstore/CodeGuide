import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/AppWidget.dart';
import '../utils/T11Images.dart';
import '../utils/T11Strings.dart';



class T11SettingScreen extends StatefulWidget {
  static String tag = '/T11SettingScreen';

  @override
  T11SettingScreenState createState() => T11SettingScreenState();
}

class T11SettingScreenState extends State<T11SettingScreen> {
  List<String> settingOption = ['view profile', 'Data Saver', 'Language', 'About', 'Terms and Condition', 'Privacy Policy', 'Support', 'Logout'];

  @override
  void initState() {
    setStatusBarColor(appStore.appBarColor!, statusBarIconBrightness: Brightness.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, t11_lbl_setting),
        body: SingleChildScrollView(
          child: Column(
            children: [
              16.height,
              commonCacheImageWidget(t11_ic_singer4, 120, fit: BoxFit.cover).cornerRadiusWithClipRRect(60),
              16.height,
              Wrap(
                runSpacing: 8,
                children: settingOption.map((data) {
                  return SettingItemWidget(
                    title: data.validate(),
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationDefault(),
                    onTap: () {},
                  );
                }).toList(),
              ),
              16.height
            ],
          ),
        ),
      ),
    );
  }
}
