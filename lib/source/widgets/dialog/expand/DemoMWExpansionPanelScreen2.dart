import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWExpansionPanelScreen2 extends StatefulWidget {
  const DemoMWExpansionPanelScreen2({Key? key}) : super(key: key);

  @override
  _DemoMWExpansionPanelScreen2State createState() => _DemoMWExpansionPanelScreen2State();
}

class _DemoMWExpansionPanelScreen2State extends State<DemoMWExpansionPanelScreen2> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 30, top: 26),
        physics: BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: boxDecorationDefault(borderRadius: radius(32), color: context.cardColor),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                backgroundColor: context.cardColor,
                title: Text(
                  'Item ${index + 1}',
                  style: primaryTextStyle(),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/face1.jpg'),
                  radius: 20,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 32, top: 16, bottom: 16),
                collapsedIconColor: context.iconColor,
                iconColor: context.iconColor,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Id :',
                      style: primaryTextStyle(),
                      children: <InlineSpan>[
                        TextSpan(text: ' 12786', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                  2.height,
                  Text.rich(
                    TextSpan(
                      text: 'Due Date :',
                      style: primaryTextStyle(),
                      children: <InlineSpan>[
                        TextSpan(text: ' Expired', style: secondaryTextStyle(color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  2.height,
                  Text.rich(
                    TextSpan(
                      text: 'Originator : ',
                      style: primaryTextStyle(),
                      children: <InlineSpan>[
                        TextSpan(text: ' Zac Efron', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                  2.height,
                  Text.rich(
                    TextSpan(
                      text: 'Start Date : ',
                      style: primaryTextStyle(),
                      children: <InlineSpan>[
                        TextSpan(text: ' February 20,2019 at 7:05 PM ', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                  2.height,
                  Text.rich(
                    TextSpan(
                      text: 'Current Step : ',
                      style: primaryTextStyle(),
                      children: <InlineSpan>[
                        TextSpan(text: ' 2 of 3 ', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                  2.height,
                  Divider(
                    endIndent: 32,
                    color: Colors.black54,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Template Used : ',
                      style: primaryTextStyle(),
                      children: <InlineSpan>[
                        TextSpan(text: ' Company Profile', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                  2.height,
                  Text.rich(
                    TextSpan(
                      text: 'Active Until : ',
                      style: primaryTextStyle(),
                      children: <InlineSpan>[
                        TextSpan(text: ' February 28,2019 at 7:05 PM ', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                  4.height,
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.all(4),
                        decoration: boxDecorationDefault(border: Border.all(color: Colors.black26)),
                        child: Icon(
                          Icons.sports_handball,
                          color: Colors.black54,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.all(4),
                        decoration: boxDecorationDefault(border: Border.all(color: Colors.black26)),
                        child: Icon(
                          Icons.apartment_outlined,
                          color: Colors.black54,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
