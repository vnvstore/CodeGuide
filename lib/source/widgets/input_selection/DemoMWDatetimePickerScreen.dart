import 'package:flutter/material.dart';

class DemoMWDatetimePickerScreen extends StatefulWidget {
  static String tag = '/DemoMWDatetimePickerScreen';

  @override
  DemoMWDatetimePickerScreenState createState() => DemoMWDatetimePickerScreenState();
}

class DemoMWDatetimePickerScreenState extends State<DemoMWDatetimePickerScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    init();
    print(selectedTime.period);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        helpText: 'Select your Booking date',
        cancelText: 'Not Now',
        confirmText: "Book",
        fieldLabelText: 'Booking Date',
        fieldHintText: 'Month/Date/Year',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter date in valid range',
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        },
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        print(picked);
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: child!,
            ),
          );

        });

    if (picked != null)
      setState(() {
        selectedTime = picked;
      });
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Card(
                  elevation: 4,
                  child: ListTile(
                    onTap: () {
                      _selectDate(context);
                    },
                    title: Text(
                      'Select your Booking date',
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.date_range,
                        color: appStore.iconColor,
                      ),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  )),
              Card(
                  elevation: 4,
                  child: ListTile(
                    onTap: () {
                      _selectTime(context);
                    },
                    title: Text(
                      'Select your checking time',
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      "${selectedTime.hour < 10 ? "0${selectedTime.hour}" : "${selectedTime.hour}"} : ${selectedTime.minute < 10 ? "0${selectedTime.minute}" : "${selectedTime.minute}"} ${selectedTime.period != DayPeriod.am ? 'PM' : 'AM'}   ",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.date_range,
                        color: appStore.iconColor,
                      ),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  )),
            ],
          ),
        ),
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

  }
}