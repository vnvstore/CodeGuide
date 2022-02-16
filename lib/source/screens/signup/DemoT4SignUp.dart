import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/AppWidget.dart';
import '../utils/T4Colors.dart';
import '../utils/T4Images.dart';
import '../utils/T4Strings.dart';
import '../utils/widgets/T4Button.dart';
import '../utils/widgets/T4EditText.dart';

class DemoT4SignUp extends StatefulWidget {
  static String tag = '/DemoT4SignUp';

  @override
  DemoT4SignUpState createState() => DemoT4SignUpState();
}

class DemoT4SignUpState extends State<DemoT4SignUp> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(Colors.transparent);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: t4_bg,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[Color(0XD5160336), Color(0XD5160336)]),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 24, right: 24, top: height * 0.1),
                child: Column(
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: t4_icon,
                      width: width / 3.2,
                      color: t4_white,
                    ),
                    SizedBox(height: 40),
                    T4EditText(
                      hint: t4_hint_name,
                      isPassword: false,
                    ),
                    SizedBox(height: 24),
                    T4EditText(
                      hint: t4_hint_phone,
                      isPassword: false,
                    ),
                    SizedBox(height: 24),
                    T4EditText(
                      hint: t4_hint_Email,
                      isPassword: false,
                    ),
                    SizedBox(height: 24),
                    T4EditText(hint: t4_hint_password, isSecure: true),
                    SizedBox(height: 24),
                    T4Button(
                      textContent: t4_lbl_register_now,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
