import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWTextFormFieldScreen extends StatefulWidget {
  static String tag = '/DemoMWTextFormFieldScreen';

  @override
  DemoMWTextFormFieldScreenState createState() => DemoMWTextFormFieldScreenState();
}

class DemoMWTextFormFieldScreenState extends State<DemoMWTextFormFieldScreen> {
  var formKey = GlobalKey<FormState>();
  var autoValidate = false;

  var usernameCont = TextEditingController();
  var emailCont = TextEditingController();
  var phoneCont = TextEditingController();
  var addressCont = TextEditingController();
  var pinCont = TextEditingController();
  var urlCont = TextEditingController();
  var donateCont = TextEditingController();

  var usernameFocus = FocusNode();
  var emailFocus = FocusNode();
  var phoneFocus = FocusNode();
  var addressFocus = FocusNode();
  var pinFocus = FocusNode();
  var urlFocus = FocusNode();
  var donateFocus = FocusNode();

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
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameCont,
                    focusNode: usernameFocus,
                    style:  TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Username*',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Usermame is required';
                      if (!s.trim().isAlpha()) return 'Username is not valid';
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: emailCont,
                    style: TextStyle(fontSize: 16),
                    focusNode: emailFocus,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Email is required';
                      if (!s.trim().validateEmail()) return 'Email is not valid';
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: phoneCont,
                    focusNode: phoneFocus,
                    maxLength: 10,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      counterStyle: secondaryTextStyle(),
                      labelText: 'Mobile Number*',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Mobile is required';
                      if (!s.trim().validatePhone()) return 'Mobile is not valid';
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: addressCont,
                    focusNode: addressFocus,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'Address',
                      labelStyle: TextStyle(fontSize: 16),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 3,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Address is required';
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: pinCont,
                    focusNode: pinFocus,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.pin_drop,
                        color: appStore.iconColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      labelText: 'PinCode',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Pin is required';
                      if (!s.trim().isDigit()) return 'Pin is not valid';
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: urlCont,
                    style: TextStyle(fontSize: 16),
                    focusNode: urlFocus,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: appStore.iconColor!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                      ),
                      prefixIcon: Icon(
                        Icons.web,
                        color: appStore.iconColor,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      labelText: 'URL',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.url,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'URL is required';
                      if (!s.trim().validateURL()) return 'URL is not valid';
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: donateCont,
                    style: TextStyle(fontSize: 16),
                    focusNode: donateFocus,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: appStore.iconColor!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                        ),
                        labelText: 'Donate',
                        prefixText: '\₹ ',
                        labelStyle: TextStyle(fontSize: 16),
                        prefixStyle: TextStyle(fontSize: 16),
                        suffixText: 'INR',
                        suffixStyle: boldTextStyle(color: Colors.green)),
                    maxLines: 1,
                    validator: (s) {
                      if (s!.trim().isEmpty) return 'Donate amount is required';
                      if (!s.trim().isDigit()) return 'Donate amount is not valid';
                      return null;
                    },
                  ),
                  Theme(
                    data: ThemeData.light(),
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        } else {
                          autoValidate = true;
                        }

                        setState(() {});
                      },
                      child: Text('Submit', style: boldTextStyle(color: white)),
                    ),
                  ).paddingTop(15)
                ],
              ),
            ),
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
