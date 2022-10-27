import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/AppWidget.dart';
import '../model/T3_Model.dart';
import 'T3Listing.dart';
import '../utils/T3DataGenerator.dart';


class T3Cards extends StatefulWidget {
  static var tag = "/T3Cards";

  @override
  T3CardsState createState() => T3CardsState();
}

class T3CardsState extends State<T3Cards> {
  late List<Theme3Dish> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getList();
    afterBuildCreated(() {
      changeStatusColor(appStore.appBarColor!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Cards'),
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
