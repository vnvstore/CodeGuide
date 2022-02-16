import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DemoMWSliverAppBarScreen1 extends StatefulWidget {
  static String tag = '/DemoMWSliverAppBarScreen1';

  @override
  _DemoMWSliverAppBarScreen1State createState() => _DemoMWSliverAppBarScreen1State();
}

class _DemoMWSliverAppBarScreen1State extends State<DemoMWSliverAppBarScreen1> {
  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.filter_1),
                color: innerBoxIsScrolled
                    ? Colors.black
                    : Colors.white,
                onPressed: () {
                  // Do something
                },
              ),
              expandedHeight: 220.0,
              floating: true,
              pinned: true,
              snap: false,
              elevation: 50,
              backgroundColor: appStore.appBarColor,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('SliverAppBar with ListView', style: TextStyle(fontSize:16,fontWeight:FontWeight.bold,color: innerBoxIsScrolled ? appStore.textPrimaryColor : Colors.white)),
                  background: CachedNetworkImage(
                    placeholder: (context, url) => placeholderWidget(),
                    imageUrl: 'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Container(
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    'Item ${index.toString()}',
                    style: TextStyle(fontSize: 20.0, color: appStore.textPrimaryColor),
                  ),
                );
              }),
        ),
      ),
    );
  }
  Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);
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