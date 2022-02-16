import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWStepperScreen4 extends StatefulWidget {
  static const tag = '/DemoMWStepperScreen4';

  @override
  _DemoMWStepperScreen4State createState() => _DemoMWStepperScreen4State();
}

class _DemoMWStepperScreen4State extends State<DemoMWStepperScreen4> {
  int currStep = 1;

  @override
  Widget build(BuildContext context) {
    List<Step> mSteps = [
      Step(title: Text("Step 1"), content: Text("This is our Step 1 example.", style: secondaryTextStyle(color: appStore.textSecondaryColor)), isActive: currStep == 0, state: StepState.complete),
      Step(title: Text("Step 2"), content: Text("This is our Step 2 example.", style: secondaryTextStyle(color: appStore.textSecondaryColor)), isActive: currStep == 1, state: StepState.disabled),
    ];

    return SafeArea(
      child: Scaffold(
        body: Theme(
          data:ThemeData.light(),
          child: Stepper(
            steps: mSteps,
            type: StepperType.horizontal,
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
              ).paddingTop(16);
            },
            onStepContinue: () {
              setState(() {
                if (currStep < mSteps.length - 1) {
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