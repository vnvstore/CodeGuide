import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoCWDialogActionScreen extends StatefulWidget {
  static String tag = '/DemoCWDialogActionScreen';

  @override
  DemoCWDialogActionScreenState createState() => DemoCWDialogActionScreenState();
}

class DemoCWDialogActionScreenState extends State<DemoCWDialogActionScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  List<ListModel> example = [
    ListModel(name: 'Simple Dialog'),
    ListModel(name: 'Camera Gallery Permission Dialog'),
    ListModel(name: 'Review Dialog'),
    ListModel(name: 'Map Permission Dialog'),
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text('Cupertino Dialog Action')),
      ),
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
