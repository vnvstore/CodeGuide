import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class MWExpansionPanel7ComponentWidget extends StatefulWidget {
  const MWExpansionPanel7ComponentWidget({Key? key}) : super(key: key);

  @override
  _MWExpansionPanel7ComponentWidgetState createState() => _MWExpansionPanel7ComponentWidgetState();
}

class _MWExpansionPanel7ComponentWidgetState extends State<MWExpansionPanel7ComponentWidget> {
  bool isExpanded = false;
  Color appColorPrimary = Color(0xFF1157FA);

  List<String> text = [
    'Latest Cricket Scores',
    'What\'s the weather tomorrow?',
    'Play the latest News',
    'Show my photos',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: isExpanded ? radiusOnly(topRight: 16, topLeft: 16) : radius(16),
          child: Image.asset(
            'images/widgets/materialWidgets/mwDialogAlertPanelWidgets/tile.png',
            fit: BoxFit.cover,
            height: 140,
            width: context.width(),
          ),
        ),
        Container(
          height: 140,
          decoration: boxDecorationDefault(
            borderRadius: isExpanded ? radiusOnly(topRight: 16, topLeft: 16) : radius(16),
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        ExpansionTile(
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          title: Container(
            height: 130,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(top: 16),
                  child: Icon(Icons.calendar_today_rounded, color: Colors.white),
                  decoration: boxDecorationDefault(
                    color: appColorPrimary,
                    borderRadius: radius(100),
                    boxShadow: defaultBoxShadow(blurRadius: 0, spreadRadius: 0),
                  ),
                ),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Text('Find the information you need', style: primaryTextStyle(color: Colors.white, weight: FontWeight.w500, size: 20)),
                    4.height,
                    Text('With little help fro  google', style: secondaryTextStyle(color: Colors.white54)),
                  ],
                ).expand(),
              ],
            ),
          ),
          onExpansionChanged: (e) {
            isExpanded = !isExpanded;
            setState(() {});
          },
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: radiusOnly(bottomLeft: 16, bottomRight: 16),
                color: context.cardColor,
                boxShadow: defaultBoxShadow(blurRadius: 0, spreadRadius: 0, shadowColor: Colors.black),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: HorizontalList(
                itemCount: text.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(border: Border.all(color: context.iconColor), borderRadius: radius(16)),
                    child: Text(text[index], style: primaryTextStyle()),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
