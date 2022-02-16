import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWListViewScreen3 extends StatefulWidget {
  static const tag = '/DemoMWListViewScreen3';

  @override
  _DemoMWListViewScreen3State createState() => _DemoMWListViewScreen3State();
}

class _DemoMWListViewScreen3State extends State<DemoMWListViewScreen3> {
  late List<ItemModel> mListing;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    mListing = getData();

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            16.height,
            Text("Product", style: boldTextStyle(color: appStore.textPrimaryColor, size: 18)).paddingLeft(16),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mListing.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16),
                itemBuilder: (context, index) {
                  return Product(mListing[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Product extends StatelessWidget {
  late ItemModel model;

  Product(ItemModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.only(left: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(12.0),
            child: Image.asset(
              model.img,
              fit: BoxFit.cover,
              height: 170,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.name, style: primaryTextStyle(color: appStore.textPrimaryColor)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemModel {
  var name = "";
  var img = "";
}

List<ItemModel> getData() {
  List<ItemModel> popularArrayList = [];
  ItemModel item1 = ItemModel();
  item1.img = 'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item3.jpg';
  item1.name = "Black Jacket";

  ItemModel item2 = ItemModel();
  item2.img = 'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item1.jpg';
  item2.name = "Denim Jacket";

  ItemModel item3 = ItemModel();
  item3.img = 'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item5.jpg';
  item3.name = "Blazer";

  ItemModel item4 = ItemModel();
  item4.img = 'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item2.jpg';
  item4.name = "T-shirt";

  ItemModel item5 = ItemModel();
  item5.img = 'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item4.jpg';
  item5.name = "Sunglasses";

  ItemModel item6 = ItemModel();
  item6.img = 'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item7.jpg';
  item6.name = "Sunglasses";

  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);
  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);
  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);
  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);
  return popularArrayList;
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