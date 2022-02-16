import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/shimmer.dart';

class DemoSHomePage extends StatefulWidget {
  static String tag = '/DemoSHomePage';

  @override
  _DemoSHomePageState createState() => _DemoSHomePageState();
}

class _DemoSHomePageState extends State<DemoSHomePage> {
  bool? isActive;

  List<Feeds> feed1 = [
    Feeds(
      profileImg: 'https://assets.iqonic.design/old-themeforest-images/prokit/images/grocery/grocery_ic_user1.png',
      name: 'John Doe',
      feedImage: 'https://assets.iqonic.design/old-themeforest-images/prokit/images/food/food_ic_popular2.jpg',
    ),
    Feeds(
      profileImg: 'https://assets.iqonic.design/old-themeforest-images/prokit/images/grocery/grocery_ic_user2.png',
      name: 'Carry Milton',
      feedImage: 'https://assets.iqonic.design/old-themeforest-images/prokit/images/food/food_ic_popular3.jpg',
    ),
    Feeds(
      profileImg: 'https://assets.iqonic.design/old-themeforest-images/prokit/images/grocery/grocery_ic_user3.png',
      name: 'Jhonny Smith',
      feedImage: 'https://assets.iqonic.design/old-themeforest-images/prokit/images/food/food_ic_popular1.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    isActive = true;
    print(isActive);
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: feed1.length,
          itemBuilder: (BuildContext context, int index) {
            return isActive!
                ? SizedBox(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[400],
                      highlightColor: Colors.grey[100],
                      child: Container(
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, width: 1.0))),
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15, right: 10),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    height: 8,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  height: 10,
                                  margin: EdgeInsets.only(right: 10),
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 200,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                    margin: EdgeInsets.only(top: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(feed1[index].profileImg!),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(feed1[index].name!, style: primaryTextStyle()),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Icon(Icons.more_vert, color: appStore.iconColor),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                          child: CachedNetworkImage(placeholder: (context, url) => placeholderWidget(), imageUrl: feed1[index].feedImage!),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
  Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);

}

class Feeds {
  String? profileImg;
  String? name;
  String? feedImage;

  Feeds({this.profileImg, this.name, this.feedImage});
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