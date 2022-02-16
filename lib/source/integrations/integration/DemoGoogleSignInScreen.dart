import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';  //https://pub.dev/packages/google_sign_in
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoGoogleSignInScreen extends StatefulWidget {
  static String tag = '/DemoGoogleSignInScreen';

  @override
  DemoGoogleSignInScreenState createState() => DemoGoogleSignInScreenState();
}

class DemoGoogleSignInScreenState extends State<DemoGoogleSignInScreen> {
  final double textSizeLargeMedium = 18.0;
  final double textSizeMedium = 16.0;
  final String fontSemibold = 'Semibold';
  final String fontRegular = 'Regular';
  Color thirdColor = Color(0xFF607d8b);

  var isSuccess = false;
  String? name = 'UserName';
  var email = 'Email id';
  String? photoUrl = '';

  void onSignInTap() async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      'email',
    ]);
    await googleSignIn.signIn().then((res) async {
      await res!.authentication.then((accessToken) async {
        setState(() {
          isSuccess = true;
          name = res.displayName;
          email = res.email;
          photoUrl = res.photoUrl;
        });

        print('Access Token: ${accessToken.accessToken.toString()}');
      }).catchError((error) {
        isSuccess = false;
        toasty(context, error.toString());
        setState(() {});
        throw (error.toString());
      });
    }).catchError((error) {
      isSuccess = false;
      toasty(context, error.toString());
      setState(() {});
      throw (error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appColorPrimary);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 24),
                  decoration: BoxDecoration(color: thirdColor, shape: BoxShape.circle),
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    backgroundImage: Image.network(photoUrl!).image,
                    radius: 50,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name!, style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontSemibold, color: isSuccess ? greenColor : appStore.textPrimaryColor) ),
                      Text(email, style: TextStyle(fontSize: textSizeLargeMedium, color: isSuccess ? greenColor : appStore.textPrimaryColor) ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
              onTap: () => onSignInTap(),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(24),
                  padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.red,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "images/integrations/icons/ic_google.png",
                        width: 30,
                        color: whiteColor,
                      ),
                      Center(child: Text('Sign In with google',textAlign:TextAlign.center, style: TextStyle(color: whiteColor, fontFamily: fontRegular, fontSize: textSizeMedium))),
                    ],
                  )))
        ],
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
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