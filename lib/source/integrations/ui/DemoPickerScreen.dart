import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/common.dart';

class DemoPickerScreen extends StatefulWidget {
  static String tag = '/DemoPickerScreen';

  @override
  DemoPickerScreenState createState() => DemoPickerScreenState();
}

class DemoPickerScreenState extends State<DemoPickerScreen> {
  Color thirdColor = Color(0xFF607d8b);
  /*fonts*/
  String  fontRegular = 'Regular';
  String  fontMedium = 'Medium';
  String  fontSemibold = 'Semibold';
  String  fontBold = 'Bold';
  /* font sizes*/
  double  textSizeSmall = 12.0;
  double  textSizeSMedium = 14.0;
  double  textSizeMedium = 16.0;
  double  textSizeLargeMedium = 18.0;
  double  textSizeNormal = 20.0;
  double  textSizeLarge = 24.0;
  double  textSizeXLarge = 28.0;
  double  textSizeXXLarge = 30.0;

  var mSelectedDate = '';
  DateTime selectedDate = DateTime.now();
  Color? pickerColor = appStore.textPrimaryColor;
  var mSelectedColor = '';

  var mSelectedAddress = '';

  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget? child) {
          return Theme(child: child!,data: ThemeData.light(),);
        });
    setState(() {
      if (picked != null && picked != selectedDate) selectedDate = picked;
      mSelectedDate = DateFormat.yMMMd().format(selectedDate.toLocal());
    });
  }

  Future pickColor(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor!,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Pick"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  getLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    /*
    var coordinates = Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("$addresses : ${first.addressLine}");
    setState(() {
      mSelectedAddress = first.addressLine;
    });

     */
    setState(() {
      mSelectedAddress = "${position.latitude},${position.longitude}";
    });
  }

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
      mSelectedColor = intToHex(pickerColor!.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appColorPrimary);
    //TODO Without NullSafety Geo coder


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Date Selection Picker:", style: TextStyle(color: appStore.appColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium), ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child:  Text(mSelectedDate.isEmpty ? "Select your date" : mSelectedDate, style: TextStyle(color: mSelectedDate.isEmpty ? appStore.textSecondaryColor : appStore.textPrimaryColor), ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectDate(context);
                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          decoration: BoxDecoration(color: appStore.appColorPrimary, borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                          child: Text('Pick Date', style:TextStyle(fontSize:16,fontFamily: fontMedium ))
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                height: 0.5,
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Your Location Picker:", style: TextStyle(color: appStore.appColorPrimary,fontFamily: fontMedium, fontSize: textSizeLargeMedium) ),


              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child:
                Text(mSelectedAddress.isEmpty ? "Your Location" : mSelectedAddress, style: TextStyle(color: mSelectedAddress.isEmpty ? appStore.textSecondaryColor : appStore.textPrimaryColor,), maxLines: 5 ),


              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  getLocation();
                },
                child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    decoration: BoxDecoration(
                        color: appStore.appColorPrimary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: Text('Pick Your Current Location', style:TextStyle(fontSize:16,fontFamily: fontMedium ))
                ),


              ),
              SizedBox(height: 20),
              Divider(
                height: 0.5,
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Color Picker:", style: TextStyle(color: appStore.appColorPrimary,fontFamily: fontMedium, fontSize: textSizeLargeMedium) ),

              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: pickerColor, border: Border.all(color: thirdColor, width: 3)),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Color Code:", style: TextStyle(color: pickerColor,fontFamily: fontMedium, fontSize: textSizeLargeMedium) ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(mSelectedColor, style: primaryTextStyle(color: pickerColor))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                         pickColor(context);
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 16, right: 16),
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            decoration: BoxDecoration(
                                color: appStore.appColorPrimary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            child: Text('Pick Color', style:TextStyle(fontSize:16,fontFamily: fontMedium )))

                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Divider(
                height: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
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