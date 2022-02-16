import 'package:flutter/material.dart';

class DemoMWDropDownButtonScreen extends StatefulWidget {
  static const tag = '/DemoMWDropDownButtonScreen';

  @override
  _DemoMWDropDownButtonScreenState createState() => _DemoMWDropDownButtonScreenState();
}

class _DemoMWDropDownButtonScreenState extends State<DemoMWDropDownButtonScreen> {
  TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
  
  List<String> listOfCategory = ['It', 'Computer Science', 'Business', 'Data Science', 'Infromation Technologies', 'Health', 'Physics'];
  String? selectedIndexCategory = 'Business';
  String? dropdownNames;
  String? dropdownScrollable = 'I';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text('Category', style: boldTextStyle),
              SizedBox(height: 10,),
              Card(
                  elevation: 4,
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: appStore.appBarColor,
                    value: selectedIndexCategory,
                    style: boldTextStyle,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: appStore.iconColor,
                    ),
                    underline: SizedBox(height: 0,),
                    onChanged: (dynamic newValue) {
                      setState(() {
                        print( newValue);
                        selectedIndexCategory = newValue;
                      });
                    },
                    items: listOfCategory.map((category) {
                      return DropdownMenuItem(
                        child: Container(
                          padding: EdgeInsets.only(left:8),
                          child: Text(category, style: TextStyle(fontSize: 16)),
                        ),
                        value: category,
                      );
                    }).toList(),
                  )),
              SizedBox(height: 10,),
              Text('Dropdown with  Hint', style: boldTextStyle),
              SizedBox(height: 10,),
              DropdownButton<String>(
                value: dropdownNames,
                underline: SizedBox(height: 0,),
                dropdownColor: appStore.appBarColor,
                hint: Container(
                  padding: EdgeInsets.only(left:8),
                  child: Text(
                    'Choose Text Style',
                    style: TextStyle(fontSize: 16),
                  )
                ),
                icon: Container(
                    padding: EdgeInsets.only(left:10),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: appStore.iconColor,
                    )
                ),

                onChanged: (String? newValue) {
                  setState(() {
                    print( newValue);
                    dropdownNames = newValue;
                  });
                },
                items: <String>['Normal', 'Bold', 'Italic', 'Underline'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Tooltip(message: value, child: Container(margin: EdgeInsets.only(left: 4, right: 4), child: Text(value, style: TextStyle(fontSize: 16)))),
                  );
                }).toList(),
              ),
              SizedBox(height: 10,),
              Text('Scrollable Dropdown', style: boldTextStyle),
              SizedBox(height: 10,),
              DropdownButton<String>(
                value: dropdownScrollable,
                underline: SizedBox(height: 0,),
                dropdownColor: appStore.appBarColor,
                icon: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: appStore.iconColor,
                  ),
                ),
                onChanged: (String? newValue) {
                  print( newValue);
                  setState(() {
                    dropdownScrollable = newValue;
                  });
                },
                items: <String>[
                  'I',
                  'He',
                  'She',
                  'You',
                  'We',
                  'They',
                  'Am',
                  'Is',
                  'Are',
                  'A',
                  'An',
                  'Me',
                  'His',
                  'Her',
                  'Your',
                  'Our',
                  'The',
                  'i',
                  'he',
                  'she',
                  'you',
                  'we',
                  'they',
                  'am',
                  'is',
                  'are',
                  'a',
                  'an',
                  'me',
                  'his',
                  'her',
                  'your',
                  'our',
                  'the',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                        padding: EdgeInsets.only(left:8),
                        child: Text(value, style:  TextStyle(fontSize: 16)),
                    ),


                  );
                }).toList(),
              ),
              SizedBox(height: 10,),
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