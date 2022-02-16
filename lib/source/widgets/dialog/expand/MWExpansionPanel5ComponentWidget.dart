import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class MWExpansionPanel5ComponentWidget extends StatefulWidget {
  const MWExpansionPanel5ComponentWidget({Key? key}) : super(key: key);

  @override
  _MWExpansionPanel5ComponentWidgetState createState() => _MWExpansionPanel5ComponentWidgetState();
}

class _MWExpansionPanel5ComponentWidgetState extends State<MWExpansionPanel5ComponentWidget> {
  bool isExpanded = false;

  String dropdownValue = 'UK';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius(),
        color: Color(0xFF1157FA).withAlpha(100),
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(8),
        leading: Container(
          child: Icon(Icons.payment_outlined, color: Colors.white, size: 30),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(borderRadius: radius(100), color: Color(0xFFD51A18)),
        ),
        title: Text.rich(
          TextSpan(
            text: 'Your Card ',
            style: boldTextStyle(),
            children: <InlineSpan>[
              TextSpan(text: ' *5138', style: primaryTextStyle()),
              TextSpan(text: ' is Expired', style: boldTextStyle()),
            ],
          ),
        ),
        subtitle: Text('Update your Financial information', style: secondaryTextStyle(size: 12)),
        trailing: isExpanded
            ? Container(
                child: Icon(Icons.keyboard_arrow_up, color: context.iconColor, size: 30),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(borderRadius: radius(100), color: context.accentColor.withAlpha(32)),
              )
            : Icon(Icons.keyboard_arrow_down, color: context.iconColor, size: 30),
        onExpansionChanged: (t) {
          isExpanded = !isExpanded;
          setState(() {});
        },
        children: [
          Container(
            decoration: boxDecorationDefault(color: context.cardColor, boxShadow: null),
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                SettingItemWidget(
                  padding: EdgeInsets.all(4),
                  title: 'Credit Card',
                  subTitle: 'Update your Financial information',
                  trailing: Icon(Icons.more_horiz),
                  titleTextStyle: boldTextStyle(size: 20, weight: FontWeight.w500),
                ),
                16.height,
                AppTextField(
                  textFieldType: TextFieldType.OTHER,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.payment, color: context.iconColor),
                    labelText: 'Card Number',
                    suffixIcon: Icon(Icons.camera_alt_outlined, color: context.iconColor),
                    border: OutlineInputBorder(),
                  ),
                ),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.width() * 0.42,
                      child: AppTextField(
                        textFieldType: TextFieldType.OTHER,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today_sharp, size: 15, color: context.iconColor),
                          labelText: 'Expires',
                          suffixIcon: Icon(Icons.info_outline, size: 15),
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.width() * 0.35,
                      child: AppTextField(
                        textFieldType: TextFieldType.OTHER,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline_rounded, color: context.iconColor, size: 15),
                          labelText: 'CVV',
                          labelStyle: TextStyle(fontSize: 15),
                          suffixIcon: Icon(Icons.info_outline, size: 15),
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                8.height,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: radius(4),
                    border: Border.all(color: context.dividerColor),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    value: dropdownValue,
                    underline: SizedBox(),
                    isExpanded: true,
                    items: ['India', 'UK', 'Australia'].map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      dropdownValue = newValue!;
                      setState(() {});
                    },
                  ),
                ),
                8.height,
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline, color: context.iconColor),
                    labelText: 'Cardholder Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                8.height,
                Text(
                  'By updating your Credit card information you\'re be able to receive special deals from SetProduct',
                  style: secondaryTextStyle(size: 12),
                )
              ],
            ).paddingAll(8),
          )
        ],
      ),
    );
  }
}
