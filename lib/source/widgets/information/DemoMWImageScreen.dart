import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils


class DemoMWImageScreen extends StatefulWidget {
  static String tag = '/DemoMWImageScreen';

  @override
  DemoMWImageScreenState createState() => DemoMWImageScreenState();
}

class DemoMWImageScreenState extends State<DemoMWImageScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Load Image from Asset folder",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              Image.asset(
                'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item4.jpg',
                fit: BoxFit.cover,
                height: 150,
                width: 130,
              ).paddingLeft(16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Network Image",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              Image.network('https://killerattitudestatus.in/wp-content/uploads/2019/12/gud-night-images.jpg', fit: BoxFit.cover, width: 130, height: 150.0).paddingLeft(16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Placeholder",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              FadeInImage(
                height: 150,
                width: 130,
                fit: BoxFit.cover,
                placeholder: AssetImage(
                  'Loading',
                ),
                image: Image.asset(
                  'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item3.jpg',
                  height: 35,
                  width: 20,
                ).image,
              ).paddingLeft(16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Shape",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item7.jpg',
                      fit: BoxFit.cover,
                      height: 150,
                      width: 130,
                    ),
                  ).paddingOnly(right: 16, left: 16),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item4.jpg'),
                    radius: 40,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
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