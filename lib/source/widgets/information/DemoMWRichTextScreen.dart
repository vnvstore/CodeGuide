import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';    //https://pub.dev/packages/nb_utils


class DemoMWRichTextScreen extends StatefulWidget {
  static String tag = '/DemoMWRichTextScreen';

  @override
  _DemoMWRichTextScreenState createState() => _DemoMWRichTextScreenState();
}

class _DemoMWRichTextScreenState extends State<DemoMWRichTextScreen> {
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
        backgroundColor: context.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Text With Link", style: boldTextStyle(size: 18)).paddingOnly(top: 16, bottom: 16),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Don't have an account?", style: primaryTextStyle(color: appStore.textPrimaryColor)),
                    TextSpan(
                      text: ' Sign Up ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          toasty(context, "Redirect to sign up");
                        },
                      style: primaryTextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              16.height,
              Divider(thickness: 1),
              Text("Text With Icon", style: boldTextStyle(size: 18)).paddingOnly(top: 16, bottom: 16),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText2,
                  children: [
                    WidgetSpan(child: Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.settings, size: 18))),
                    TextSpan(text: "Settings", style: primaryTextStyle(color: appStore.textPrimaryColor)),
                  ],
                ),
              ),
              10.height,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Profile", style: primaryTextStyle(color: appStore.textPrimaryColor)),
                    WidgetSpan(child: Padding(padding: EdgeInsets.only(left: 10), child: Icon(Icons.person, size: 18))),
                  ],
                ),
              ),
              16.height,
              Divider(thickness: 1),
              Text("Text With style", style: boldTextStyle(size: 18)).paddingOnly(top: 16, bottom: 16),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Click',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          toasty(context, "Click");
                        },
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, decoration: TextDecoration.underline, color: Colors.blue),
                    ),
                    TextSpan(text: " here", style: primaryTextStyle())
                  ],
                ),
              ),
              10.height,
              RichText(
                text: TextSpan(
                  children: <TextSpan>[TextSpan(text: 'Bold', recognizer: TapGestureRecognizer()..onTap = () {}, style: boldTextStyle(size: 18)), TextSpan(text: " Style", style: primaryTextStyle())],
                ),
              ),
              10.height,
              RichText(
                text: TextSpan(
                  text: lipsum.createWord(numWords: 2),
                  style: primaryTextStyle(color: Colors.red, size: 18),
                  children: <TextSpan>[
                    TextSpan(text: lipsum.createParagraph(numSentences: 1), style: primaryTextStyle(color: Colors.blueGrey)),
                  ],
                ),
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