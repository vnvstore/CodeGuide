import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

import 'utils/liquid_pull_to_refresh.dart';
import '../../Lipsum.dart' as lipsum;

class DemoLiquidPullToRefreshScreen extends StatefulWidget {
  static String tag = '/DemoLiquidPullToRefreshScreen';

  @override
  DemoLiquidPullToRefreshScreenState createState() => DemoLiquidPullToRefreshScreenState();
}

class DemoLiquidPullToRefreshScreenState extends State<DemoLiquidPullToRefreshScreen> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  Color appColorPrimary = Color(0xFF1157FA);

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);

    return Scaffold(
      body: LiquidPullToRefresh(
          key: refreshIndicatorKey,
          color: appColorPrimary,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  (index + 1).toString() + ' ' + lipsum.createText(),
                  maxLines: 1,
                  style: primaryTextStyle(),
                ),
              );
            },
            itemCount: 100,
            shrinkWrap: true,
          ),
          onRefresh: refreshData),
    );
  }

  Future<void> refreshData() async {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {
      refreshIndicatorKey.currentState!.show();
    });
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }
}
