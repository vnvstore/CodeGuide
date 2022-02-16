import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'FAddUserScreen.dart';
import 'FirebaseUserService.dart';
import 'model/FBusermodel.dart';

FirebaseUserService userService = FirebaseUserService();

class FUserListScreen extends StatefulWidget {
  const FUserListScreen({Key? key}) : super(key: key);

  @override
  _FUserListScreenState createState() => _FUserListScreenState();
}

class _FUserListScreenState extends State<FUserListScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(appStore.appBarColor);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(context.scaffoldBackgroundColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget('Firebase User List', color: appStore.appBarColor, elevation: 0),
        body: StreamBuilder<List<FBUserModel>>(
          stream: userService.getData(),
          builder: (context, snap) {
            if (snap.hasData) {
              if (snap.data!.isEmpty) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("images/integrations/img/no_data_found.png", height: 150, fit: BoxFit.cover),
                      16.height,
                      Text("No User Found", style: boldTextStyle()),
                    ],
                  ),
                ).center();
              }

              return ListView.builder(
                padding: EdgeInsets.only(bottom: 80, top: 8, left: 8, right: 8),
                itemCount: snap.data!.length,
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  FBUserModel data = snap.data![index];

                  return SettingItemWidget(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationDefault(color: context.cardColor),
                    onTap: () {
                      FAddUserScreen(data: data).launch(context);
                    },
                    title: data.name.validate(),
                    subTitle: data.email,
                    trailing: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: appStore.appColorPrimary),
                      child: Text(data.age.validate().toString(), style: primaryTextStyle(color: white)),
                    ),
                    subTitleTextStyle: secondaryTextStyle(size: 14),
                    titleTextStyle: boldTextStyle(size: 18),
                  ).paddingSymmetric(vertical: 4, horizontal: 8);
                },
              );
            }
            return snapWidgetHelper(snap);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FAddUserScreen().launch(context);
          },
          backgroundColor: appStore.appBarColor,
          child: Icon(Icons.add, color: appStore.appColorPrimary, size: 32),
        ),
      ),
    );
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
  Color primaryColor = Color(0xFFFF4E54);
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