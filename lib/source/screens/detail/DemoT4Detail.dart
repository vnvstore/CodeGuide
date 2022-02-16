import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'models/T4Models.dart';
import 'utils/T4Constant.dart';
import 'utils/T4DataGenerator.dart';
import 'utils/T4Images.dart';
import 'utils/T4Strings.dart';
import 'utils/widgets/T4Button.dart';


class DemoT4Detail extends StatefulWidget {
  static var tag = "/T4Description";

  @override
  DemoT4DetailState createState() => DemoT4DetailState();
}

class DemoT4DetailState extends State<DemoT4Detail> {
  int selectedPos = 1;
  late List<T4NewsModel> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getList1Data();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(appStore.appBarColor);

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Observer(
        builder: (_) => Container(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  16.height,
                  Row(
                    children: <Widget>[
                      SizedBox(width: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => placeholderWidget(),
                          imageUrl: t4_img2,
                          width: (width - 48) * 0.5,
                          height: height * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => placeholderWidget(),
                          imageUrl: t4_img4,
                          width: (width - 48) * 0.5,
                          height: height * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(t4_samplelong_text, maxLines: 10,style:TextStyle(color: appStore.textPrimaryColor, fontSize: textSizeMedium))
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Divider(height: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(t4_profile),
                                radius: 28,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(t4_username,style:TextStyle(color: appStore.textPrimaryColor, fontSize: textSizeMedium, fontFamily: fontMedium)),
                                    Text(t4_designation, style:TextStyle(fontSize: textSizeMedium))
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              )
                            ],
                          ),
                        ),
                        T4Button(
                          textContent: t4_lbl_follow,
                          isStroked: true,
                          height: 40,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
                    child: Text("Related Articles", style:TextStyle(color: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal))
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => placeholderWidget(),
                                    imageUrl: mListings[index].image,
                                    width: width / 3,
                                    height: width / 3.2,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(mListings[index].name, style:TextStyle(color: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontBold)),
                                            Text(mListings[index].info, style:TextStyle(fontSize: textSizeMedium, color: appStore.textSecondaryColor)),
                                            SizedBox(height: 4),
                                            Text(mListings[index].otherinfo,maxLines: 3, style:TextStyle(fontSize: textSizeSMedium)),
                                            SizedBox(height: 4),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16),
                            Divider()
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
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

