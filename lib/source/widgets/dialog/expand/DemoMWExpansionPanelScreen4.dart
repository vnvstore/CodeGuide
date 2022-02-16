import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';    //https://pub.dev/packages/nb_utils
import 'MWExpansionPanel4ComponentWidget.dart';

class DemoMWExpansionPanelScreen4 extends StatefulWidget {
  const DemoMWExpansionPanelScreen4({Key? key}) : super(key: key);

  @override
  _DemoMWExpansionPanelScreen4State createState() => _DemoMWExpansionPanelScreen4State();
}

class _DemoMWExpansionPanelScreen4State extends State<DemoMWExpansionPanelScreen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding: EdgeInsets.only(bottom: 30, top: 26),
            physics: BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return MWExpansionPanel4ComponentWidget(index: index).paddingSymmetric(horizontal: 16);
            }));
  }
}
