import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoCWPickerScreen extends StatefulWidget {
  static String tag = '/DemoCWPickerScreen';

  @override
  DemoCWPickerScreenState createState() => DemoCWPickerScreenState();
}

class DemoCWPickerScreenState extends State<DemoCWPickerScreen> {
  List<ListModel> example = [
    ListModel(name: 'Cupertino Date Picker'),
    ListModel(name: 'Cupertino Time Picker'),
    ListModel(name: 'Cupertino Picker'),
  ];

  List countryName = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Bangladesh",
    "Brazil",
    "Colombia",
    "Denmark",
    "Estonia",
    "France",
    "Guinea-Bissau",
    "Holy See",
    "India",
    "Japan"
  ];

  String? selectedValue;
  String? time;
  String? date;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    time = 'Please Select Time';
    date = 'Please select Date';
    selectedValue = 'Please select value';
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: example.length,
          itemBuilder: (BuildContext context, index) {
            return ExampleItemWidget(example[index], onTap: () {
              if (index == 0) {
                dateBottomSheet(context);
              } else if (index == 1) {
                timeBottomSheet(context);
              } else if (index == 2) {
                pickerBottomSheet(context);
              }
            });
          },
        ),
      ),
    );
  }

  Future<void> timeBottomSheet(context) async {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext e) {
        return Container(
          height: 250,
          child: Column(
            children: [
              Container(
                color: appStore.appBarColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cancel', style: primaryTextStyle(size: 18)).onTap(() {
                      finish(context);
                      toasty(context, 'Please select time');
                      setState(() {});
                    }),
                    Text('Done', style: primaryTextStyle(size: 18)).onTap(() {
                      finish(context, time);
                      toasty(context, time!.isNotEmpty ? time : 'Please select time');
                    })
                  ],
                ).paddingAll(8.0),
              ),
              Container(
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: primaryTextStyle(size: 20))),
                  child: CupertinoDatePicker(
                    // backgroundColor: context.scaffoldBackgroundColor,
                    minimumDate: today,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: false,
                    onDateTimeChanged: (DateTime dateTime) {
                      var timeFormat = DateFormat('HH:mm a');
                      String formattedDate = timeFormat.format(dateTime);
                      time = formattedDate;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> dateBottomSheet(context) async {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);

    await showModalBottomSheet(
        context: context,
        builder: (BuildContext e) {
          return Container(
            height: 245,
            child: Column(
              children: [
                Container(
                  color: appStore.appBarColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cancel',
                        style: boldTextStyle(),
                      ).onTap(() {
                        finish(context);
                        date = today as String;
                        setState(() {});
                      }),
                      Text(
                        'Done',
                        style: boldTextStyle(),
                      ).onTap(() {
                        finish(context, date);
                        toasty(context, date.toString());
                      })
                    ],
                  ).paddingOnly(top: 8, left: 8, right: 8, bottom: 8),
                ),
                Container(
                  height: 200,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: primaryTextStyle(size: 20))),
                    child: CupertinoDatePicker(
                      backgroundColor: appStore.appBarColor,
                      minimumDate: today,
                      minuteInterval: 1,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (var dateTime) {
                        var dateFormat = new DateFormat('dd-MM-yyyy');
                        String formattedDate = dateFormat.format(dateTime);
                        print(formattedDate);
                        date = formattedDate;
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<void> pickerBottomSheet(context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext e) {
        return Container(
          height: 250,
          child: Column(
            children: [
              Container(
                color: appStore.appBarColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cancel', style: primaryTextStyle(size: 18)).onTap(() {
                      finish(context);
                      toasty(context, 'Please select value');
                      setState(() {});
                    }),
                    Text('Done', style: primaryTextStyle(size: 18)).onTap(() {
                      finish(context);
                      toasty(context, selectedValue!.isNotEmpty ? selectedValue : 'Please select value');
                    })
                  ],
                ).paddingAll(8.0),
              ),
              Container(
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      pickerTextStyle: primaryTextStyle(),
                    ),
                  ),
                  child: CupertinoPicker(
                   // backgroundColor: context.scaffoldBackgroundColor,
                    itemExtent: 30,
                    children: countryName.map((e) {
                      return Text(e, style: primaryTextStyle(size: 20));
                    }).toList(),
                    onSelectedItemChanged: (int val) {
                      selectedValue = countryName[val];
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
  Color iconColorPrimaryDark = Color(0xFF212121);
  Color scaffoldBackground = Color(0xFFEBF2F7);
  Color backgroundColor = Colors.black;
  Color backgroundSecondaryColor = Color(0xFF131d25);
  Color appColorPrimaryLightColor = Color(0xFFF9FAFF);
  Color textSecondaryColor = Color(0xFF5A5C5E);
  Color appBarColor = Colors.white;
  Color iconColor = Color(0xFF212121);
  Color iconSecondaryColor = Color(0xFFA8ABAD);
  Color cardColor = Colors.white;
  Color appColorPrimary = Color(0xFF1157FA);
  Color scaffoldBackgroundColor = Color(0xFFEFEFEF);

  AppStore();

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
        title: Text(tabBarType.name!, style: TextStyle(fontWeight:FontWeight.bold)),
        trailing: showTrailing
            ? Icon(Icons.arrow_forward_ios, size: 15, color: appStore.textPrimaryColor)
            : tabBarType.isNew??false
            ? Text('New', style: TextStyle(fontSize:14,color: Colors.red))
            : null,
      ),
    );
  }
}
