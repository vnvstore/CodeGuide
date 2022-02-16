import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoPEOpacityScreen extends StatefulWidget {
  static String tag = '/DemoPEOpacityScreen';

  @override
  DemoPEOpacityScreenState createState() => DemoPEOpacityScreenState();
}

class DemoPEOpacityScreenState extends State<DemoPEOpacityScreen> {
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
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Text('Opacity with different opacity value', style: boldTextStyle()).paddingBottom(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Opacity(
                    opacity: 0.2,
                    child: FadeInImage(
                        height: 100,
                        width: 100,
                        placeholder: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image,
                        image: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
                Expanded(
                  flex: 1,
                  child: Opacity(
                    opacity: 0.5,
                    child: FadeInImage(
                        height: 100,
                        width: 100,
                        placeholder: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image,
                        image: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
                Expanded(
                  flex: 1,
                  child: Opacity(
                    alwaysIncludeSemantics: true,
                    opacity: 1,
                    child: FadeInImage(
                        height: 100,
                        width: 100,
                        placeholder: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image,
                        image: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image),
                  ),
                ),
              ],
            ),
            20.height,
            Text('Opacity with ColorFilter', style: boldTextStyle()).paddingBottom(20),
            Container(
              height: 200,
              width: context.width(),
              decoration: BoxDecoration(image: DecorationImage(image: CachedNetworkImageProvider('https://i.picsum.photos/id/772/200/300.jpg?hmac=jap7uDpPOJZv41ksTZ3pa9FnXwuaBUpnni4hYBjZtfM'))),
              child: Text("Without Opacity", style: boldTextStyle(size: 25, color: Colors.white)).center(),
            ),
            Container(
              height: 200,
              width: context.width(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.dstATop),
                  image: CachedNetworkImageProvider('https://i.pinimg.com/originals/a7/3d/6e/a73d6e4ac85c6a822841e449b24c78e1.jpg'),
                ),
              ),
              child: Text("With Opacity", style: boldTextStyle(size: 25, color: Colors.white)).center(),
            ).paddingTop(10),
            20.height,
            Text('Opacity with ColorFilter saturation mode', style: boldTextStyle()).paddingBottom(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: CachedNetworkImage(
                      placeholder: (context, url) => placeholderWidget(),
                      imageUrl: 'https://images.unsplash.com/photo-1487035242901-d419a42d17af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                ),
                10.width,
                Expanded(
                  flex: 1,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.black, BlendMode.saturation),
                    child: CachedNetworkImage(
                        placeholder: (context, url) => placeholderWidget(),
                        imageUrl: 'https://images.unsplash.com/photo-1487035242901-d419a42d17af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                  ),
                ),
              ],
            ).paddingBottom(20)
          ],
        ),
      ),
    );
  }
  Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);
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