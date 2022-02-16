import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils


class DemoMWStepperScreen1 extends StatefulWidget {
  static const tag = '/DemoMWStepperScreen1';

  @override
  _DemoMWStepperScreen1State createState() => _DemoMWStepperScreen1State();
}

class _DemoMWStepperScreen1State extends State<DemoMWStepperScreen1> {
  int currStep = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
        title: Text("Account"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Account Information", style: boldTextStyle()),
            TextFormField(
              maxLines: 1,
              style: primaryTextStyle(),
              decoration: InputDecoration(
                labelText: 'Email',
                hintStyle: secondaryTextStyle(),
                labelStyle: secondaryTextStyle(),
                hintText: 'Enter Email Id',
                icon: Icon(Icons.email, color: appStore.iconColor),
              ),
            ),
            TextFormField(
              maxLines: 1,
              style: primaryTextStyle(),
              decoration: InputDecoration(
                labelText: 'Username',
                hintStyle: secondaryTextStyle(),
                labelStyle: secondaryTextStyle(),
                hintText: 'Enter UserName',
                icon: Icon(Icons.person, color: appStore.iconColor),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              maxLines: 1,
              style: primaryTextStyle(),
              decoration: InputDecoration(
                hintStyle: secondaryTextStyle(),
                labelStyle: secondaryTextStyle(),
                labelText: 'Password',
                hintText: 'Enter Password',
                icon: Icon(Icons.lock, color: appStore.iconColor),
              ),
            ),
          ],
        ),
        isActive: currStep == 0,
      ),
      Step(
        title: Text("Personal"),
        isActive: currStep == 1,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Personal Information", style: boldTextStyle()),
            TextFormField(
              maxLines: 1,
              style: primaryTextStyle(),
              decoration: InputDecoration(
                labelText: 'First Name',
                hintStyle: secondaryTextStyle(),
                labelStyle: secondaryTextStyle(),
                hintText: 'Enter First Name',
                icon: Icon(Icons.person, color: appStore.iconColor),
              ),
            ),
            TextFormField(
              maxLines: 1,
              style: primaryTextStyle(),
              decoration: InputDecoration(
                labelText: 'Last Name',
                hintStyle: secondaryTextStyle(),
                labelStyle: secondaryTextStyle(),
                hintText: 'Enter Last Name',
                icon: Icon(Icons.person, color: appStore.iconColor),
              ),
            ),
          ],
        ),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: Theme(
          data:ThemeData.light(),
          child: Stepper(
            steps: steps,
            physics: BouncingScrollPhysics(),
            type: StepperType.horizontal,
            currentStep: currStep,
            controlsBuilder: (BuildContext context, {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                    onPressed: onStepContinue,
                    child: Text('CONTINUE', style: secondaryTextStyle()),
                  ),
                  10.width,
                  TextButton(
                    onPressed: onStepCancel,
                    child: Text('CANCEL', style: secondaryTextStyle()),
                  ),
                ],
              ).paddingOnly(top: 20);
            },
            onStepContinue: () {
              setState(() {
                if (currStep < steps.length - 1) {
                  currStep = currStep + 1;
                } else {
                  //currStep = 0;
                  finish(context);
                }
              });
            },
            onStepCancel: () {
              finish(context);
              setState(() {
                if (currStep > 0) {
                  currStep = currStep - 1;
                } else {
                  currStep = 0;
                }
              });
            },
            onStepTapped: (step) {
              setState(() {
                currStep = step;
              });
            },
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