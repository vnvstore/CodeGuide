import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/AppWidget.dart';
import '../utils/T11Images.dart';
import '../utils/T11Strings.dart';
import '../utils/T11Widget.dart';



class T11ProfileScreen extends StatefulWidget {
  static String tag = '/T11ProfileScreen';

  @override
  T11ProfileScreenState createState() => T11ProfileScreenState();
}

class T11ProfileScreenState extends State<T11ProfileScreen> {
  @override
  void initState() {
    setStatusBarColor(appStore.appBarColor!, statusBarIconBrightness: Brightness.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            16.height,
            commonCacheImageWidget(t11_ic_singer1, 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
            16.height,
            Text(
              t11_lbl_singer_name.toUpperCase(),
              style: boldTextStyle(),
            ),
            8.height,
            Icon(AntDesign.edit, color: Colors.grey, size: 18),
            32.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                optionContainer(context.width(), t11_lbl_account).expand(),
                16.width,
                optionContainer(context.width(), t11_lbl_account).expand(),
              ],
            ),
            20.height,
            optionContainer(context.width(), t11_lbl_account),
          ],
        ).paddingAll(16),
      ),
      bottomNavigationBar: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: boxDecorationWithShadow(borderRadius: radius(0)),
        child: Text(t11_lbl_log_out, style: boldTextStyle(), textAlign: TextAlign.center),
      ),
    );
  }
}
