import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/T5Models.dart';
import '../utils/AppWidget.dart';
import '../utils/T5Colors.dart';
import '../utils/T5DataGenerator.dart';
import '../utils/T5Strings.dart';
import '../utils/T5Widget.dart';
import '../utils/widgets/T5GridListing.dart';


class DemoT5BottomSheet extends StatefulWidget {
  static var tag = "/DemoT5BottomSheet";

  @override
  DemoT5BottomSheetState createState() => DemoT5BottomSheetState();
}

class DemoT5BottomSheetState extends State<DemoT5BottomSheet> {
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();
  List<T5Category>? mFavouriteList;

  @override
  void initState() {
    super.initState();
    mFavouriteList = getBottomSheetItems();
  }

  showSheet(BuildContext aContext) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: aContext,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.65,
              maxChildSize: 1,
              minChildSize: 0.5,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: EdgeInsets.only(top: 24),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(color: context.scaffoldBackgroundColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                  child: Column(
                    children: <Widget>[
                      Container(color: t5ViewColor, width: 50, height: 3),
                      SizedBox(height: 20),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 16),
                          child: T5GridListing(mFavouriteList, true),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    scaffoldKey = new GlobalKey<ScaffoldState>();
    Future.delayed(Duration(milliseconds: 1000), () {
      showSheet(context);
    });
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          TopBar(),
          Container(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () {
                    showSheet(context);
                  },
                  child: ring(t5_lbl_welcome_to_bottom_sheet)))
        ],
      ),
    );
  }
}