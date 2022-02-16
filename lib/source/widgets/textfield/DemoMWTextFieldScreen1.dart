import 'package:flutter/material.dart';

class DemoMWTextFieldScreen1 extends StatefulWidget {
  static String tag = "/DemoMWTextFieldScreen1";

  @override
  _DemoMWTextFieldScreen1State createState() => _DemoMWTextFieldScreen1State();
}

class _DemoMWTextFieldScreen1State extends State<DemoMWTextFieldScreen1> {
  bool passwordVisible = false;

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
                style:  TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  labelText: 'Username',
                  labelStyle: TextStyle(fontSize: 14),
                  filled: true,
                ),
                cursorColor:  Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  labelText: "E-Mail",
                  labelStyle: TextStyle(fontSize: 14),
                  prefixIcon: Icon(
                    Icons.email,
                    color: appStore.iconColor,
                  ),
                  filled: true,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                obscureText: passwordVisible,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 14),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: appStore.textPrimaryColor!),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: appStore.textPrimaryColor!),
                    ),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: appStore.iconColor,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    )),
                cursorColor: Colors.black,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  labelText: "Phone Number",
                  labelStyle: TextStyle(fontSize: 14),
                  prefixIcon: Icon(Icons.phone, color: Colors.blue),
                  filled: true,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.textPrimaryColor!)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.textPrimaryColor!)),
                  labelText: "Pincode",
                  labelStyle: TextStyle(fontSize: 14),
                  filled: true,
                  counterStyle: TextStyle(fontSize: 14),
                ),
                maxLength: 6,
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
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
