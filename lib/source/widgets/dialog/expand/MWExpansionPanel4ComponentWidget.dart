import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class MWExpansionPanel4ComponentWidget extends StatefulWidget {
  int? index;

  MWExpansionPanel4ComponentWidget({this.index});


  @override
  _MWExpansionPanel4ComponentWidgetState createState() => _MWExpansionPanel4ComponentWidgetState();
}

class _MWExpansionPanel4ComponentWidgetState extends State<MWExpansionPanel4ComponentWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      leading: Icon(Icons.check_circle_sharp, color: Colors.lightGreen, size: 30),
      title: Text('Item ${widget.index! +1}', style: primaryTextStyle()),
      subtitle: Text(
        'Active accordion',
        style: secondaryTextStyle(),
      ),
      trailing: isExpanded.validate(value: false)
          ? Container(
              child: Icon(Icons.keyboard_arrow_up, color: Colors.blue, size: 30),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(borderRadius: radius(100), color: Colors.blue.withAlpha(32)),
            )
          : Container(
              decoration: BoxDecoration(borderRadius: radius(100), color: context.cardColor),
              padding: EdgeInsets.all(4),
              child: Icon(Icons.keyboard_arrow_down, color: context.iconColor, size: 30),
            ),
      onExpansionChanged: (t) {
        isExpanded = !isExpanded.validate(value: false);
        setState(() {});
      },
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.blue.withAlpha(32), borderRadius: radius()),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Purchase UI Kits to boost your design process.Get Material-X',
                    style: boldTextStyle(size: 18),
                  ).expand(),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: boxDecorationDefault(color: context.cardColor, borderRadius: radius(100)),
                    child: Icon(
                      Icons.more_horiz,
                      color: context.iconColor,
                    ),
                  )
                ],
              ),
              16.height,
              SettingItemWidget(
                title: 'Design System Tokens',
                subTitle: '16 March, 2020',
                leading: Container(
                  padding: EdgeInsets.all(4),
                  decoration: boxDecorationDefault(color: Colors.blue.withAlpha(32), borderRadius: radius()),
                  child: Icon(
                    Icons.folder_open,
                    color: Colors.blue,
                  ),
                ),
              ),
              SettingItemWidget(
                title: 'Design Specs',
                subTitle: '18 March, 2018',
                leading: Container(
                  padding: EdgeInsets.all(4),
                  decoration: boxDecorationDefault(color: Colors.blue.withAlpha(32), borderRadius: radius()),
                  child: Icon(Icons.folder_open, color: Colors.blue),
                ),
              ),
              SettingItemWidget(
                title: 'Guidelines',
                subTitle: '31 December, 2020',
                leading: Container(
                  padding: EdgeInsets.all(4),
                  decoration: boxDecorationDefault(color: Colors.blue.withAlpha(32), borderRadius: radius()),
                  child: Icon(Icons.folder_open, color: Colors.blue),
                ),
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
              ).paddingAll(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton(
                    onTap: () {},
                    color: context.cardColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius()),
                    text: 'Purchase Me',
                    textStyle: primaryTextStyle(),
                    padding: EdgeInsets.all(8),
                  ),
                  8.width,
                  AppButton(
                    onTap: () {},
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius()),
                    text: 'I want this Kit',
                    textStyle: primaryTextStyle(color: Colors.white),
                    padding: EdgeInsets.all(8),
                    color: Colors.blueAccent,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
