import 'package:flutter/material.dart';
import 'MWExpansionPanel6ComponentWidget.dart';

class DemoMWExpansionPanelScreen6 extends StatefulWidget {
  const DemoMWExpansionPanelScreen6({Key? key}) : super(key: key);

  @override
  _DemoMWExpansionPanelScreen6State createState() => _DemoMWExpansionPanelScreen6State();
}

class _DemoMWExpansionPanelScreen6State extends State<DemoMWExpansionPanelScreen6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 30, top: 26),
              physics: BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return MWExpansionPanel6ComponentWidget();
              })),
    );
  }
}
