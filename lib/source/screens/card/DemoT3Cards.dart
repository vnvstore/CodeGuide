import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/T3_Model.dart';
import '../utils/AppWidget.dart';
import '../utils/T3Listing.dart';
import '../utils/T3DataGenerator.dart';



class DemoT3Cards extends StatefulWidget {
  static var tag = "/DemoT3Cards";

  @override
  DemoT3CardsState createState() => DemoT3CardsState();
}

class DemoT3CardsState extends State<DemoT3Cards> {
  late List<Theme3Dish> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getList();
    afterBuildCreated(() {
      changeStatusColor(appStore.appBarColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Observer(
          builder: (_) => Container(
            color: context.scaffoldBackgroundColor,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T3List(mListings[index], index);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
