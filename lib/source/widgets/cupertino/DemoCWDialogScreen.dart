import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import '../../flutter_rating_bar.dart';


class DemoCWDialogScreen extends StatefulWidget {
  static String tag = '/DemoCWDialogScreen';

  @override
  DemoCWDialogScreenState createState() => DemoCWDialogScreenState();
}

class DemoCWDialogScreenState extends State<DemoCWDialogScreen> {
  List<ListModel> example = [
    ListModel(name: 'Simple Dialog'),
    ListModel(name: 'Review Dialog'),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: example.length,
              itemBuilder: (BuildContext context, index) {
                return ExampleItemWidget(example[index], onTap: () {
                  if (index == 0) {
                    showDialog(
                        context: context,
                        builder: (_) => Theme(
                          data: ThemeData.light(),
                              child: CupertinoAlertDialog(
                                title: Text(
                                  "Cupertino Dialog",
                                  style: boldTextStyle(color: appStore.textPrimaryColor, size: 16),
                                ).paddingBottom(6),
                                content: Text("Hey! I'm Coflutter!", style: primaryTextStyle(color: appStore.textSecondaryColor, size: 16)).paddingBottom(6),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      'Close me!',
                                      style: primaryTextStyle(),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ),
                            ));
                  } else if (index == 1) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Theme(
                          data: ThemeData.light(),
                              child: CupertinoAlertDialog(
                                title: Text(
                                  'Rating',
                                  style: boldTextStyle(size: 16),
                                ).paddingOnly(bottom: 8),
                                content: Column(
                                  children: [
                                    RatingBar(
                                      initialRating: 5,
                                      minRating: 1,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ],
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text(
                                      "Cancel",
                                    ),
                                    onPressed: () {
                                      finish(context);
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('Submit'),
                                    onPressed: () {
                                      toasty(context, 'Submit');
                                      finish(context);
                                    },
                                  )
                                ],
                              ),
                            ));
                  }
                });
              })),
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
