import 'package:flutter/material.dart';

class DemoMWTextFieldScreen2 extends StatefulWidget {
  static String tag = "/DemoMWTextFieldScreen2";

  @override
  _DemoMWTextFieldScreen2State createState() => _DemoMWTextFieldScreen2State();
}

class _DemoMWTextFieldScreen2State extends State<DemoMWTextFieldScreen2> {
  bool? passwordVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 16,
            children: <Widget>[
              SizedBox(height: 20),
              TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  labelText: "UserName",
                  alignLabelWithHint: false,
                  fillColor: Colors.blue,
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                ),
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: appStore.iconColor!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: appStore.textSecondaryColor),
                    alignLabelWithHint: false,
                    filled: true),
                cursorColor: Colors.black,
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: appStore.iconColor!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                    ),
                    labelText: "Message",
                    labelStyle: TextStyle(color: appStore.textSecondaryColor),
                    alignLabelWithHint: false,
                    filled: true),
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: appStore.iconColor!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                    ),
                    hintText: "E-Mail",
                    hintStyle: TextStyle(color: appStore.textSecondaryColor),
                    alignLabelWithHint: false,
                    filled: true),
                cursorColor: Colors.black,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: appStore.iconColor!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                  ),
                  hintText: "New Phone Number",
                  hintStyle: TextStyle(color: appStore.textSecondaryColor),
                  labelStyle: TextStyle(color: appStore.textSecondaryColor),
                  labelText: "New Phone Number",
                  alignLabelWithHint: false,
                  filled: true,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Address",
                  hintStyle: TextStyle(color: Colors.white30),
                  alignLabelWithHint: false,
                  fillColor: Colors.blue,
                  filled: true,
                ),
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: appStore.iconColor!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                  ),
                  labelText: "Ticket Form",
                  hintText: "write....",
                  hintStyle: TextStyle(color: appStore.textSecondaryColor),
                  labelStyle: TextStyle(color: appStore.textSecondaryColor),
                  alignLabelWithHint: true,
                  filled: true,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color? textPrimaryColor;
  Color? iconColorPrimaryDark;
  Color? scaffoldBackground;
  Color? backgroundColor;
  Color? backgroundSecondaryColor;
  Color? appColorPrimaryLightColor;
  Color? textSecondaryColor;
  Color? appBarColor;
  Color? iconColor;
  Color? iconSecondaryColor;
  Color? cardColor;

  AppStore(){

    textPrimaryColor = Color(0xFF212121);
    iconColorPrimaryDark = Color(0xFF212121);
    scaffoldBackground = Color(0xFFEBF2F7);
    backgroundColor = Colors.black;
    backgroundSecondaryColor = Color(0xFF131d25);
    appColorPrimaryLightColor = Color(0xFFF9FAFF);
    textSecondaryColor = Color(0xFF5A5C5E);
    appBarColor = Colors.white;
    iconColor = Color(0xFF212121);
    iconSecondaryColor = Color(0xFFA8ABAD);
    cardColor = Color(0xFF191D36);

  }
}