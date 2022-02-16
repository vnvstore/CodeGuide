import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoMWAlertDialogScreen extends StatefulWidget {
  static String tag = '/DemoMWAlertDialogScreen';

  @override
  DemoMWAlertDialogScreenState createState() => DemoMWAlertDialogScreenState();
}

class DemoMWAlertDialogScreenState extends State<DemoMWAlertDialogScreen> {
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
    ListModel(name: 'Simple Alert Dialog'),
    ListModel(name: 'Confirmation Alert Dialog with Action Button'),
    ListModel(name: 'Alert Dialog with Shape'),
    ListModel(name: 'Warning Alert Dialog'),
  ];

  @override
  Widget build(BuildContext context) {
    AlertDialog mAlertItem1 = AlertDialog(
      backgroundColor: appStore.cardColor,
      title: Text(
        "Alert Title",
        style:  TextStyle(fontWeight: FontWeight.bold,color: appStore.textPrimaryColor),
      ),
      content: Text(
        "Alert Message",
        style: TextStyle(fontSize: 14,color: appStore.textSecondaryColor),
      ),
      actions: [],
    );

    AlertDialog mAlertItem2 = AlertDialog(
      backgroundColor: appStore.cardColor,
      title: Text("Confirmation", style: TextStyle(fontWeight: FontWeight.bold,color: appStore.textPrimaryColor)),
      content: Text(
        "Are you sure you want to logout?",
        style: TextStyle(fontSize: 14,color: appStore.textSecondaryColor),
      ),
      actions: [
        TextButton(
          child: Text(
            "Yes",
            style: TextStyle(fontSize: 16,color: appStore.appColorPrimary),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text("No", style: TextStyle(fontSize: 16,color: appStore.appColorPrimary)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    AlertDialog mAlertItem3 = AlertDialog(
      backgroundColor: appStore.cardColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hold On", style: TextStyle(fontWeight: FontWeight.bold,color: appStore.textPrimaryColor)),
          SizedBox(height: 16,),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            style: TextStyle(fontSize: 14,color: appStore.textSecondaryColor),
          ),
          SizedBox(height: 16,),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(color: appStore.appColorPrimary, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text("Ok", style: TextStyle(color: Colors.white, fontSize: 16.0), ),
              ),
            ),
          )
        ],
      ),
      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomLeft: Radius.circular(50))),
    );

    AlertDialog mAlertItem4 = AlertDialog(
      backgroundColor: appStore.cardColor,
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 120, color: appStore.appColorPrimary),
                Column(
                  children: [
                    Icon(Icons.warning, color: Colors.white, size: 32),
                    SizedBox(height: 8,),
                    Text('OOPs...', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 18)),
                  ],
                )
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text("Something Went Wrong", style: TextStyle(fontSize: 14,)),
            ),
            SizedBox(height: 16,),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(color: appStore.appColorPrimary, borderRadius: BorderRadius.circular(10),),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text("Try again", style: TextStyle(color: Colors.white, fontSize: 16.0)),
              ),
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
      contentPadding: EdgeInsets.all(0),
    );

    return Scaffold(
        backgroundColor: appStore.scaffoldBackgroundColor,
        body: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(example[index], onTap: () {
                if (index == 0) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return mAlertItem1;
                    },
                  );
                } else if (index == 1) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return mAlertItem2;
                    },
                  );
                } else if (index == 2) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return mAlertItem3;
                    },
                  );
                } else if (index == 3) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return mAlertItem4;
                    },
                  );
                }
              });
            }));
  }
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
        title: Text(tabBarType.name!, style: TextStyle(fontWeight: FontWeight.bold,)),
        trailing: showTrailing
            ? Icon(Icons.arrow_forward_ios, size: 15, color: appStore.textPrimaryColor)
            : tabBarType.isNew??false
            ? Text('New', style: TextStyle(fontSize: 14,color: Colors.red))
            : null,
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
  Color cardColor = Colors.white;
  Color? appColorPrimary;
  Color? scaffoldBackgroundColor;

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
    appColorPrimary = Color(0xFF1157FA);
    scaffoldBackgroundColor = Color(0xFFEFEFEF);

  }
}
class ListModel {
  String? name;
  bool? isNew;
  Widget? widget;

  ListModel({this.name, this.widget,this.isNew});
}
