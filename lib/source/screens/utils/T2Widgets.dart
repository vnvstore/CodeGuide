import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'T2Colors.dart';

Color textPrimaryColor = Color(0xFF212121);
Color iconColor = Color(0xFF212121);

// ignore: must_be_immutable, camel_case_types
class t2AppButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  t2AppButton({required this.textContent, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return t2AppButtonState();
  }
}

// ignore: camel_case_types
class t2AppButtonState extends State<t2AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: t2_white),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: EdgeInsets.all(0.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[t2_colorPrimary, t2_colorPrimaryDark]),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                widget.textContent,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class T2EditTextField extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var maxLine;
  TextEditingController? mController;

  VoidCallback? onPressed;

  T2EditTextField(
      {var this.fontSize = 20.0, var this.textColor = t2_textColorSecondary, var this.isPassword = true, var this.isSecure = false, var this.text = "", var this.mController, var this.maxLine = 1});

  @override
  State<StatefulWidget> createState() {
    return T2EditTextFieldState();
  }
}

class T2EditTextFieldState extends State<T2EditTextField> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isSecure) {
      return TextField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: t2_colorPrimary,
        maxLines: widget.maxLine,
        style: TextStyle(fontSize: widget.fontSize, color: textPrimaryColor, fontFamily: widget.fontFamily),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: iconColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: t2_colorPrimary),
          ),
        ),
      );
    } else {
      return TextField(
          controller: widget.mController,
          obscureText: widget.isPassword,
          cursorColor: t2_colorPrimary,
          style: TextStyle(fontSize: widget.fontSize, color: t2TextColorPrimary, fontFamily: widget.fontFamily),
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  widget.isPassword = !widget.isPassword;
                });
              },
              child: Icon(widget.isPassword ? Icons.visibility : Icons.visibility_off, color: iconColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: iconColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: t2_colorPrimary),
            ),
          ));
    }
  }
}

Widget ring(String description) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150.0),
          border: Border.all(width: 16.0, color: t2_colorPrimary),
        ),
      ),
      SizedBox(height: 16),
      Text(description, style: boldTextStyle(color: textPrimaryColor, size: 20), maxLines: 2, textAlign: TextAlign.center)
    ],
  );
}

Widget shareIcon(String iconPath, Color tintColor) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Image.asset(iconPath, width: 28, height: 28, fit: BoxFit.fill),
  );
}
