import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWStepperScreen2 extends StatefulWidget {
  static const tag = '/DemoMWStepperScreen2';

  @override
  _DemoMWStepperScreen2State createState() => _DemoMWStepperScreen2State();
}

class _DemoMWStepperScreen2State extends State<DemoMWStepperScreen2> {
  int currStep = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
        title: Text("Contact Detail", style: boldTextStyle(color: appStore.textPrimaryColor)),
        subtitle: Text("Add Contact Detail", style: primaryTextStyle(color: appStore.textPrimaryColor, size: 14)),
        isActive: currStep == 0,
        content: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle(color: appStore.textSecondaryColor)),
      ),
      Step(
        title: Text("Shipping Information", style: boldTextStyle(color: appStore.textPrimaryColor)),
        subtitle: Text("Add Shipping Information", style: primaryTextStyle(color: appStore.textPrimaryColor, size: 14)),
        content: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle(color: appStore.textSecondaryColor)),
        isActive: currStep == 1,
      ),
      Step(
        title: Text("Billing Address", style: boldTextStyle(color: appStore.textPrimaryColor)),
        subtitle: Text("Added Billing Address", style: primaryTextStyle(color: appStore.textPrimaryColor, size: 14)),
        content: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle(color: appStore.textSecondaryColor)),
        isActive: currStep == 2,
      ),
      Step(
        title: Text("Payment Flow", style: boldTextStyle(color: appStore.textPrimaryColor)),
        subtitle: Text("Select Payment method", style: primaryTextStyle(color: appStore.textPrimaryColor, size: 14)),
        content: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle(color: appStore.textSecondaryColor)),
        isActive: currStep == 3,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: Theme(
          data: ThemeData(backgroundColor: context.scaffoldBackgroundColor),
          child: Stepper(
            steps: steps,
            physics: BouncingScrollPhysics(),
            type: StepperType.vertical,
            currentStep: this.currStep,
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
              );
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