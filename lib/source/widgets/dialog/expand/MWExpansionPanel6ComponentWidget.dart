import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class MWExpansionPanel6ComponentWidget extends StatefulWidget {
  const MWExpansionPanel6ComponentWidget({Key? key}) : super(key: key);

  @override
  _MWExpansionPanel6ComponentWidgetState createState() => _MWExpansionPanel6ComponentWidgetState();
}

class _MWExpansionPanel6ComponentWidgetState extends State<MWExpansionPanel6ComponentWidget> {
  bool isExpanded = false;
  Color appColorPrimary = Color(0xFF1157FA);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isExpanded ? boxDecorationDefault(color: context.cardColor) : BoxDecoration(),
      padding: isExpanded ? EdgeInsets.all(4) : EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(4),
        title: Text('This is Expansion Tile Card '),
        subtitle: Text('Tap to see more'),
        textColor: appColorPrimary,
        collapsedIconColor: appColorPrimary,
        iconColor: appColorPrimary,
        childrenPadding: EdgeInsets.all(8),
        onExpansionChanged: (t) {
          isExpanded = !isExpanded;
          setState(() {});
        },
        backgroundColor: context.cardColor,
        children: [
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
            style: primaryTextStyle(),
            textAlign: TextAlign.justify,
          ),
          26.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.star, color: appColorPrimary),
                  Text(
                    'Save',
                    style: boldTextStyle(color: appColorPrimary),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.open_in_browser, color: appColorPrimary),
                  Text(
                    'Open',
                    style: boldTextStyle(color: appColorPrimary),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(Icons.share, color: appColorPrimary),
                  Text(
                    'Share',
                    style: boldTextStyle(color: appColorPrimary),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
