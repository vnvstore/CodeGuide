import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils


class DemoAMFadeTransitionScreen extends StatefulWidget {
  static String tag = '/DemoAMFadeTransitionScreen';

  @override
  DemoAMFadeTransitionScreenState createState() => DemoAMFadeTransitionScreenState();
}

class DemoAMFadeTransitionScreenState extends State<DemoAMFadeTransitionScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  int index = 0;
  List<String?> listOfCategory = [
    'bounceInOut',
    'bounceIn',
    'easeInOutQuad',
    'ease',
    'bounceOut',
    'easeOutBack',
  ];
  String? selectedIndexCategory = 'bounceInOut';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget mName(var mValue) {
      return FadeTransition(
          opacity: CurvedAnimation(parent: _controller!, curve: mValue),
          child: FlutterLogo(
            size: 300,
          ).center());
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0) mName(Curves.bounceInOut),
              if (index == 1) mName(Curves.bounceIn),
              if (index == 2) mName(Curves.easeInOutQuad),
              if (index == 3) mName(Curves.ease),
              if (index == 4) mName(Curves.bounceOut),
              if (index == 5) mName(Curves.easeOutBack),
              DropdownButton(
                isExpanded: true,
                dropdownColor: appStore.appBarColor,
                value: selectedIndexCategory,
                style: boldTextStyle(),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: appStore.iconColor,
                ),
                underline: 0.height,
                onChanged: (dynamic newValue) {
                  setState(() {
                    selectedIndexCategory = newValue;
                    index = listOfCategory.indexOf(newValue);
                  });
                },
                items: listOfCategory.map((category) {
                  return DropdownMenuItem(
                    child: Text(category!, style: primaryTextStyle()).paddingLeft(8),
                    value: category,
                  );
                }).toList(),
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
