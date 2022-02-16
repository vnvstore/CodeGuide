import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T3Dashboard.dart';
import '../utils/T3Images.dart';
import '../utils/colors.dart';


class DemoT3Dialog extends StatefulWidget {
  static var tag = "/DemoT3Dialog";

  @override
  DemoT3DialogState createState() => DemoT3DialogState();
}

class DemoT3DialogState extends State<DemoT3Dialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    });
    return T3Dashboard();
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            child: CachedNetworkImage(
                placeholder: (context, url) => placeholderWidget(),
                imageUrl: t3_ic_pizza_dialog),
            borderRadius: BorderRadius.circular(8),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  finish(context);
                },
                child: Container(padding: EdgeInsets.all(16), alignment: Alignment.centerRight, child: Icon(Icons.close, color: t3_white)),
              ),
            ],
          ),
        ],
      ));
}
