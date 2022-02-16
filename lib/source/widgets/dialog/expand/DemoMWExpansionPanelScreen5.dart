import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'MWExpansionPanel5ComponentWidget.dart';

class DemoMWExpansionPanelScreen5 extends StatefulWidget {
  const DemoMWExpansionPanelScreen5({Key? key}) : super(key: key);

  @override
  _DemoMWExpansionPanelScreen5State createState() => _DemoMWExpansionPanelScreen5State();
}

class _DemoMWExpansionPanelScreen5State extends State<DemoMWExpansionPanelScreen5> {
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
                return MWExpansionPanel5ComponentWidget().paddingSymmetric(
                  vertical: 8,
                  horizontal: 16,
                );
              })),
    );
  }
}
