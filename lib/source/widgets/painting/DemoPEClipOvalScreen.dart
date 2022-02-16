import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoPEClipOvalScreen extends StatefulWidget {
  static String tag = '/DemoPEClipOvalScreen';

  @override
  DemoPEClipOvalScreenState createState() => DemoPEClipOvalScreenState();
}

class DemoPEClipOvalScreenState extends State<DemoPEClipOvalScreen> {
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
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Text('Clip Oval', style: boldTextStyle()).paddingBottom(10),
            ClipOval(
              child: CachedNetworkImage(
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://www.mockrabbit.com/wp-content/uploads/2018/12/Become-a-Full-Stack-Developers.jpg',
              ),
            ),
            20.height,
            Text('Clip Rect', style: boldTextStyle()).paddingBottom(10),
            ClipRect(
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.75,
                  heightFactor: 0.75,
                  child: CachedNetworkImage(placeholder: (_, s) => placeholderWidget(), imageUrl: 'https://www.mockrabbit.com/wp-content/uploads/2018/12/Become-a-Full-Stack-Developers.jpg'),
                ),
              ),
            ),
            20.height,
            Text('ClipRRect', style: boldTextStyle()).paddingBottom(10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.75,
                  heightFactor: 0.75,
                  child: CachedNetworkImage(placeholder: (_, s) => placeholderWidget(), imageUrl: 'https://www.mockrabbit.com/wp-content/uploads/2018/12/Become-a-Full-Stack-Developers.jpg'),
                ),
              ),
            ),
            20.height,
            Text('ClipPath with custom clipper', style: boldTextStyle()).paddingBottom(10),
            ClipPath(
              clipper: MyCustomClipper(),
              child: CachedNetworkImage(
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://www.mockrabbit.com/wp-content/uploads/2018/12/Become-a-Full-Stack-Developers.jpg',
              ),
            ),
            20.height,
          ],
        ),
      ),
    );
  }
  Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(size.width * 0.25, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
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