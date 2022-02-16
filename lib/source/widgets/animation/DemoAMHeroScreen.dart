import 'package:flutter/material.dart';
import '../../Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils


class DemoAMHeroScreen extends StatefulWidget {
  static String tag = '/DemoAMHeroScreen';

  @override
  DemoAMHeroScreenState createState() => DemoAMHeroScreenState();
}

class DemoAMHeroScreenState extends State<DemoAMHeroScreen> {
  late List<ItemModel> mListing;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    mListing = getData();
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = context.width() / 2;
    double cardHeight = context.height() / 4;
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mListing.length,
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: cardWidth / cardHeight),
          itemBuilder: (context, index) => Product(mListing[index], index),
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => DetailScreen(
            name: model.name,
            image: model.img,
          ),
        ));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(
              tag: model.img,
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(12.0),
                child: Image.asset(
                  model.img,
                  fit: BoxFit.cover,
                  height: context.height() / 6,
                  width: MediaQuery.of(context).size.width,
                ),
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
  item6.name = "Shirt";

  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);

  return popularArrayList;
}

class DetailScreen extends StatefulWidget {
  DetailScreen({this.name, this.image});

  final String? name;
  final String? image;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var text = lipsum.createText(numParagraphs: 3, numSentences: 5);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: widget.image!,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                  child: Image.asset(
                    widget.image!,
                    fit: BoxFit.cover,
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              16.height,
              Text(widget.name!, style: boldTextStyle()).paddingOnly(left: 16),
              16.height,
              Text(
                text,
                style: primaryTextStyle(),
              ).paddingAll(8)
            ],
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
