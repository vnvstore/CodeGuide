import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import '../../flutter_rating_bar.dart';


class DemoMWBottomSheetScreen extends StatefulWidget {
  static String tag = '/DemoMWBottomSheetScreen';

  @override
  DemoMWBottomSheetScreenState createState() => DemoMWBottomSheetScreenState();
}

class DemoMWBottomSheetScreenState extends State<DemoMWBottomSheetScreen> {
  List<String> text1 = [
    'All transactions',
    'Day view',
    'Month view',
    'Custom view',
    'Reminders',
    'Budgets',
    'Category',
    'Payment modes',
  ];
  List<IconData> icons1 = [
    Icons.view_list_sharp,
    Icons.calendar_today_rounded,
    Icons.calendar_today_outlined,
    Icons.aspect_ratio_rounded,
    Icons.access_time,
    Icons.attach_money,
    Icons.playlist_add_rounded,
    Icons.payment_outlined,
  ];
  List<Color> color1 = [
    Colors.green,
    Colors.deepOrange,
    darkGreen,
    Colors.yellow,
    Colors.teal,
    navy,
    greenColor,
    Colors.brown,
  ];

  List<IconData> icons2 = [
    Icons.monetization_on,
    Icons.settings,
    Icons.recommend,
    Icons.star,
    Icons.message,
    Icons.new_releases,
  ];
  List<String> text2 = ['Buy Premium', 'Settings', 'Referrals', 'Rate app', 'Query Feedback', 'FAQ'];
  List<Color> color2 = [
    Colors.deepOrangeAccent,
    Colors.deepPurple,
    darkBlue,
    Colors.purple,
    Colors.redAccent,
    Colors.black,
  ];
  List<String> text = ['Top Rated Experiences', 'Trending Discussions', 'Popular Collections', 'Adventures Near You'];

  List<bool> isEnable = [true, false, false, false];

  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  List<ListModel> example = [
    ListModel(name: 'Simple Bottom Sheet'),
    ListModel(name: 'Bottom Sheet with rounded corner'),
    ListModel(name: 'Bottom Sheet with scrollable content'),
    ListModel(name: 'Bottom Sheet with Form'),
    ListModel(name: 'Bottom Sheet 5', isNew: true),
    ListModel(name: 'Bottom Sheet 6', isNew: true),
    ListModel(name: 'Bottom Sheet 7', isNew: true),
  ];

  _mBottomSheet6() {
    showModalBottomSheet(
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.2,
          maxChildSize: 1,
          builder: (context, scrollController) {
            return Container(
              color: context.cardColor,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: appStore.iconColor,
                          size: 50,
                        ),
                        8.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Guest User',
                              style: primaryTextStyle(size: 20),
                            ),
                            Text(
                              'Sign in',
                              style: secondaryTextStyle(),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.security)
                      ],
                    ).paddingSymmetric(horizontal: 16),
                    Divider(),
                    16.height,
                    ...List.generate(
                      text1.length,
                      (index) {
                        return SettingItemWidget(
                          title: text1[index],
                          leading: Icon(
                            icons1[index],
                            color: color1[index],
                            size: 20,
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'More options',
                        style: secondaryTextStyle(),
                      ),
                    ).paddingSymmetric(horizontal: 16),
                    ...List.generate(
                      text2.length,
                      (index) {
                        return SettingItemWidget(
                          title: text2[index],
                          leading: Icon(
                            icons2[index],
                            color: color2[index],
                            size: 20,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  _mBottomSheet7() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 32, topRight: 32)),
      context: context,
      builder: (builder) {
        return StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filtered By :',
                  style: boldTextStyle(size: 20),
                ),
                24.height,
                Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: text.map(
                      (e) {
                        int index = text.indexOf(e);
                        return Container(
                          child: Text(
                            e,
                            style: secondaryTextStyle(
                              color: isEnable[index] ? Colors.white : textSecondaryColorGlobal,
                            ),
                          ),
                          padding: EdgeInsets.all(8),
                          decoration: boxDecorationDefault(
                            color: isEnable[index] ? navy : context.cardColor,
                          ),
                        ).onTap(
                          () {
                            setState(() {});
                            isEnable[index] = !isEnable[index];
                          },
                        );
                      },
                    ).toList()),
                Spacer(),
                Text(
                  'Range Distance',
                  style: boldTextStyle(size: 20),
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 5,
                    inactiveTrackColor: context.dividerColor,
                    activeTrackColor: navy,
                    thumbColor: context.cardColor,
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 50.0,
                      disabledThumbRadius: 50,
                      elevation: 3,
                    ),
                    overlayColor: Colors.grey.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: RangeSlider(
                    values: _currentRangeValues,
                    min: 0,
                    max: 100,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    AppButton(
                      onTap: () {},
                      color: context.cardColor,
                      shapeBorder: RoundedRectangleBorder(borderRadius: radius()),
                      text: 'Reset',
                      textStyle: primaryTextStyle(),
                    ).expand(),
                    16.width,
                    AppButton(
                      onTap: () {},
                      shapeBorder: RoundedRectangleBorder(borderRadius: radius()),
                      text: 'Apply',
                      textStyle: primaryTextStyle(
                        color: Colors.white,
                      ),
                      color: navy,
                    ).expand()
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 32);
          },
        );
      },
    );
  }

  void mSimpleBottomSheet() {
    Widget mOption(var icon, var value) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: appStore.iconColor,
            ),
            16.width,
            Text(value, style: primaryTextStyle(size: 16, color: appStore.textPrimaryColor))
          ],
        ),
      );
    }

    showModalBottomSheet(
        context: context,
        backgroundColor: context.scaffoldBackgroundColor,
        builder: (builder) {
          return Container(
            height: 160.0,
            color: Colors.transparent,
            child: Column(
              children: [
                mOption(Icons.share, "Share").onTap(() {
                  finish(context);
                  toasty(context, 'share');
                }),
                mOption(Icons.link, "Get Link").onTap(() {
                  finish(context);
                  toasty(context, 'Get Link');
                }),
                mOption(Icons.edit, "Edit Name").onTap(() {
                  finish(context);
                  toasty(context, 'Edit Name');
                }),
              ],
            ),
          );
        });
  }

  mCornerBottomSheet(BuildContext aContext) {
    showModalBottomSheet(
        context: aContext,
        backgroundColor: aContext.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (builder) {
          return Container(
            height: 250.0,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Information",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
                16.height,
                Divider(height: 5, color: appStore.appDividerColor.withOpacity(0.5)),
                16.height,
                Text("Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.", style: secondaryTextStyle(color: appStore.textSecondaryColor)),
                8.height,
              ],
            ),
          );
        });
  }

  mExpandedSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.45,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return Container(
            color: context.scaffoldBackgroundColor,
            child: GestureDetector(
              onTap: () {
                finish(context);
              },
              child: ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Item $index',
                      style: primaryTextStyle(color: appStore.textPrimaryColor),
                    ),
                  );
                },
                itemCount: 20,
              ),
            ),
          );
        },
      ),
    );
  }

  mFormBottomSheet(BuildContext aContext) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: aContext,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: appStore.appBarColor),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Add Review",
                style: boldTextStyle(color: appStore.textPrimaryColor),
              ),
              Divider().paddingOnly(top: 16, bottom: 16),
              Text(
                "Email",
                style: primaryTextStyle(color: appStore.textPrimaryColor),
              ),
              8.height,
              editTextStyle("Enter Email"),
              16.height,
              Text(
                "Description",
                style: primaryTextStyle(color: appStore.textPrimaryColor),
              ),
              8.height,
              editTextStyle("Description"),
              16.height,
              RatingBar(
                initialRating: 5,
                minRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ).center(),
              30.height,
              GestureDetector(
                onTap: () {
                  finish(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: appStore.appColorPrimary, borderRadius: BorderRadius.circular(16),),
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: primaryTextStyle(color: white),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Padding editTextStyle(var hintText) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
        style: TextStyle(fontSize: 16, fontFamily: 'Regular'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(24, 16, 24, 16),
          hintText: hintText,
          hintStyle: primaryTextStyle(color: grey),
          filled: true,
          fillColor: appStore.appBarColor,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: appStore.iconSecondaryColor!, width: 1.0)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: appStore.iconSecondaryColor!, width: 1.0)),
        ),
      ),
    );
  }

  _mBottomSheet5(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 32, topRight: 32)),
      context: context,
      builder: (builder) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payout',
              style: boldTextStyle(size: 30, weight: FontWeight.w400),
            ),
            4.height,
            Text(
              'Pay out your balance now',
              style: secondaryTextStyle(),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.self_improvement,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(8),
                      decoration: boxDecorationDefault(color: Colors.deepOrangeAccent, borderRadius: radius(100)),
                    ),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sparkasse',
                          style: primaryTextStyle(),
                        ),
                        Text(
                          'Credit',
                          style: secondaryTextStyle(),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black54,
                    size: 15,
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: boxDecorationDefault(color: Colors.white, borderRadius: radius(100)),
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Text(
                        'S',
                        style: boldTextStyle(color: Colors.white),
                      ).center(),
                      padding: EdgeInsets.all(8),
                      decoration: boxDecorationDefault(color: Colors.black, borderRadius: radius(100)),
                    ),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Account',
                          style: primaryTextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  '12,50',
                  style: boldTextStyle(size: 30, weight: FontWeight.w400),
                ),
                Icon(Icons.euro)
              ],
            ),
            4.height,
            Row(
              children: [
                Text(
                  'Will be paid to your account ',
                  style: secondaryTextStyle(),
                ),
                Row(
                  children: List.generate(
                    4,
                    (index) => Icon(
                      Icons.circle,
                      size: 8,
                    ).paddingRight(1),
                  ),
                ),
                Text(
                  ' 4355',
                  style: boldTextStyle(),
                )
              ],
            ),
            Spacer(),
            AppButton(
              text: 'Withdraw to Bank Account',
              textStyle: primaryTextStyle(
                size: 15,
                color: Colors.white,
              ),
              color: Colors.deepOrange,
              width: context.width(),
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(32)),
              onTap: () {
                Navigator.pop(context);
              },
            ).center(),
            8.height,
            AppButton(
              text: 'Never Mind',
              textStyle: primaryTextStyle(size: 15),
              width: context.width(),
              color: context.cardColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(32)),
              onTap: () {
                Navigator.pop(context);
              },
            ).center(),
          ],
        ).paddingAll(16);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (BuildContext context, index) {
          return ExampleItemWidget(
            example[index],
            onTap: () {
              if (index == 0) {
                mSimpleBottomSheet();
              } else if (index == 1) {
                mCornerBottomSheet(context);
              } else if (index == 2) {
                mExpandedSheet(context);
              } else if (index == 3) {
                mFormBottomSheet(context);
              } else if (index == 4) {
                _mBottomSheet5(context);
              } else if (index == 5) {
                _mBottomSheet6();
              } else if (index == 6) {
                _mBottomSheet7();
              }
            },
          );
        },
      ),
    );
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color? textPrimaryColor;
  Color? iconColorPrimaryDark;
  Color? scaffoldBackground;
  Color? backgroundColor;
  Color? backgroundSecondaryColor;
  Color? appColorPrimaryLightColor;
  Color? textSecondaryColor;
  Color? appBarColor;
  Color? iconColor;
  Color? iconSecondaryColor;
  Color? cardColor;
  Color? appColorPrimary;
  Color appDividerColor = Color(0xFFDADADA);

  AppStore(){

    textPrimaryColor = Color(0xFF212121);
    iconColorPrimaryDark = Color(0xFF212121);
    scaffoldBackground = Color(0xFFEBF2F7);
    backgroundColor = Colors.black;
    backgroundSecondaryColor = Color(0xFF131d25);
    appColorPrimaryLightColor = Color(0xFFF9FAFF);
    textSecondaryColor = Color(0xFF5A5C5E);
    appBarColor = Colors.white;
    iconColor = Color(0xFF212121);
    iconSecondaryColor = Color(0xFFA8ABAD);
    cardColor = Color(0xFF191D36);
    appColorPrimary = Color(0xFF1157FA);

  }
}
class ListModel {
  String? name;
  bool? isNew;
  Widget? widget;

  ListModel({this.name, this.widget,this.isNew});
}
class ExampleItemWidget extends StatelessWidget {
  final ListModel tabBarType;
  final Function onTap;
  final bool showTrailing;

  ExampleItemWidget(this.tabBarType, {required this.onTap, this.showTrailing = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appStore.appBarColor,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
      elevation: 2.0,
      shadowColor: Colors.black,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(tabBarType.name!, style: boldTextStyle()),
        trailing: showTrailing
            ? Icon(Icons.arrow_forward_ios, size: 15, color: appStore.textPrimaryColor)
            : tabBarType.isNew.validate()
            ? Text('New', style: secondaryTextStyle(color: Colors.red))
            : null,
      ),
    );
  }
}

