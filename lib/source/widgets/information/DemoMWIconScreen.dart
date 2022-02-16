import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils


class DemoMWIconScreen extends StatefulWidget {
  static String tag = '/DemoMWIconScreen';

  @override
  DemoMWIconScreenState createState() => DemoMWIconScreenState();
}

class DemoMWIconScreenState extends State<DemoMWIconScreen> with SingleTickerProviderStateMixin {
  bool isPress = false;
  bool isBookMarkPress = true;
  List<bool> isSelected = [false, false, false];
  late AnimationController _animationController;
  bool isPlaying1 = false;
  bool isPlaying2 = false;
  bool isPlaying3 = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
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
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "Simple Icon",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.email,
                      size: 26,
                      color: appStore.iconColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.book,
                      size: 26,
                      color: appStore.appColorPrimary,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Toggle Button",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              ToggleButtons(
                selectedBorderColor: appStore.appColorPrimary,
                selectedColor: appStore.appColorPrimary,
                fillColor: appStore.appColorPrimary,
                borderColor: appStore.appBarColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                children: <Widget>[
                  Icon(Icons.format_bold, color: appStore.iconColor),
                  Icon(Icons.format_italic, color: appStore.iconColor),
                  Icon(Icons.format_underlined, color: appStore.iconColor),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isSelected,
              ).paddingLeft(16),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: IconButton(
                        icon: Icon(
                          isPress ? Icons.favorite_border : Icons.favorite,
                          size: 40,
                          color: isPress ? appStore.iconColor : appStore.appDarkRed,
                        ),
                        onPressed: () {
                          setState(() {
                            isPress = !isPress;
                          });
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: IconButton(
                        icon: Icon(
                          isBookMarkPress ? Icons.bookmark_border : Icons.bookmark,
                          size: 40,
                          color: isBookMarkPress ? appStore.iconColor : appStore.appColorPrimary,
                        ),
                        onPressed: () {
                          setState(() {
                            isBookMarkPress = !isBookMarkPress;
                          });
                        },
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "Animated Icon",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    iconSize: 50,
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.arrow_menu,
                      progress: _animationController,
                      color: appStore.iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isPlaying1 = !isPlaying1;
                        isPlaying1 ? _animationController.forward() : _animationController.reverse();
                      });
                    },
                  ).paddingLeft(16),
                  IconButton(
                    iconSize: 50,
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _animationController,
                      color: appStore.iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isPlaying3 = !isPlaying3;
                        isPlaying3 ? _animationController.forward() : _animationController.reverse();
                      });
                    },
                  ).paddingLeft(16),
                ],
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
  Color appDarkRed = Color(0xFFF06263);

  AppStore();

}