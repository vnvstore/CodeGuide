import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoCWContextMenuScreen extends StatefulWidget {
  static String tag = '/DemoCWContextMenuScreen';

  @override
  DemoCWContextMenuScreenState createState() => DemoCWContextMenuScreenState();
}

class DemoCWContextMenuScreenState extends State<DemoCWContextMenuScreen> {

  String SampleImageUrl = 'https://assets.iqonic.design/old-themeforest-images/prokit/images/defaultTheme/slider/01.jpg';

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
        body: Theme(
          data: ThemeData.light(),
          child: CupertinoContextMenu(
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: Image.asset(
                  'images/widgets/cupertinoWidgets/grey.jpg',
                  fit: BoxFit.cover,
                ).image,
                image: CachedNetworkImageProvider(
                  SampleImageUrl,
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
              ).cornerRadiusWithClipRRect(10),
            ),
            actions: <Widget>[
              CupertinoContextMenuAction(
                child: Text(
                  'Copy',
                  style: primaryTextStyle(color: Colors.black),
                ),
                isDefaultAction: true,
                trailingIcon: Icons.content_copy,
                onPressed: () {
                  toasty(context, "Copy");
                  finish(context);
                },
              ),
              CupertinoContextMenuAction(
                child: Text('Share', style: primaryTextStyle(color: Colors.black)),
                trailingIcon: Icons.share,
                onPressed: () {
                  toasty(context, "Share");
                  finish(context);
                },
              ),
              CupertinoContextMenuAction(
                child: Text('Delete', style: primaryTextStyle(color: Colors.black)),
                trailingIcon: Icons.delete,
                onPressed: () {
                  toasty(context, "Delete");
                  finish(context);
                },
              ),
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