import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils


class DemoMWExpansionPanelScreen extends StatefulWidget {
  static String tag = '/DemoMWExpansionPanelScreen';

  @override
  DemoMWExpansionPanelScreenState createState() => DemoMWExpansionPanelScreenState();
}

class DemoMWExpansionPanelScreenState extends State<DemoMWExpansionPanelScreen> {
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
      backgroundColor: context.scaffoldBackgroundColor,
      body: MyStatefulWidget(),
    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String? expandedValue;
  String? headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(
    numberOfItems,
    (int index) {
      return Item(headerValue: 'Item $index', expandedValue: 'This is item number $index');
    },
  );
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Theme(
          data: Theme.of(context).copyWith(cardColor: context.scaffoldBackgroundColor),
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return Theme(
      data:ThemeData.light(),
      child: ExpansionPanelList(
        dividerColor: Theme.of(context).dividerColor.withOpacity(0.5),
        expansionCallback: (int index, bool isExpanded) {
          _data[index].isExpanded = !isExpanded;
          setState(() {});
        },
        children: _data.map<ExpansionPanel>(
          (Item item) {
            return ExpansionPanel(
              isExpanded: item.isExpanded,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    item.headerValue!,
                    style: primaryTextStyle(color: appStore.textPrimaryColor),
                  ),
                );
              },
              body: ListTile(
                title: Text(item.expandedValue!, style: primaryTextStyle(color: appStore.textPrimaryColor)),
                subtitle: Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: boldTextStyle(color: appStore.textSecondaryColor),
                  ),
                ),
              ),
            );
          },
        ).toList(),
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
