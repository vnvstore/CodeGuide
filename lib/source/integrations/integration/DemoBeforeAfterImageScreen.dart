import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'utils/BeforeAfter.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoBeforeAfterImageScreen extends StatefulWidget {
  static String tag = '/DemoBeforeAfterImageScreen';


  @override
  DemoBeforeAfterImageScreenState createState() => DemoBeforeAfterImageScreenState();
}

class DemoBeforeAfterImageScreenState extends State<DemoBeforeAfterImageScreen> {
  Color appColorPrimary = Color(0xFF1157FA);

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);
    return Scaffold(
      body: Center(
        child: BeforeAfter(
          beforeImage: Image.asset('images/integrations/img/after.jpg'),
          afterImage: Image.asset('images/integrations/img/before.jpg'),
        ),
      ),
    );
  }
  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}
