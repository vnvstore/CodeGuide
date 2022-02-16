import 'package:flutter/material.dart';
import '../../../Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

// ignore: must_be_immutable
class DemoMWListViewScreen5 extends StatefulWidget {
  static const tag = '/DemoMWListViewScreen5';
  List<String> item = ["Management", "Food", "Cafe", "Travel", "Education", "Finance", "Business", "Yoga & Gym", "Health"];

  @override
  _DemoMWListViewScreen5State createState() => _DemoMWListViewScreen5State();
}

class _DemoMWListViewScreen5State extends State<DemoMWListViewScreen5> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    void reorderData(int oldindex, int newindex) {
      setState(() {
        if (newindex > oldindex) {
          newindex -= 1;
        }
        final items = widget.item.removeAt(oldindex);
        widget.item.insert(newindex, items);
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Theme(
          data:ThemeData.light(),
          child: ReorderableListView(
            children: <Widget>[
              for (final items in widget.item)
                Container(
                  key: ValueKey(items),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(
                          items,
                          style: boldTextStyle(),
                        ),
                        leading: Icon(
                          Icons.menu,
                          color: appStore.iconColor,
                        ),
                        subtitle: Text(
                          lipsum.createParagraph(numSentences: 1),
                          style: secondaryTextStyle(),
                          maxLines: 1,
                        ),
                      ),
                      Divider()
                    ],
                  ),
                ),
            ],
            onReorder: reorderData,
          ),
        ),
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