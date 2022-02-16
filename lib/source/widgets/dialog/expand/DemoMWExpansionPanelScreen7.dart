import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';    //https://pub.dev/packages/nb_utils
import 'MWExpansionPanel7ComponentWidget.dart';

class DemoMWExpansionPanelScreen7 extends StatefulWidget {
  const DemoMWExpansionPanelScreen7({Key? key}) : super(key: key);

  @override
  _DemoMWExpansionPanelScreen7State createState() => _DemoMWExpansionPanelScreen7State();
}

class _DemoMWExpansionPanelScreen7State extends State<DemoMWExpansionPanelScreen7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 30, top: 26),
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return MWExpansionPanel7ComponentWidget().paddingSymmetric(horizontal: 16, vertical: 8);
              })),
    );
  }
}
