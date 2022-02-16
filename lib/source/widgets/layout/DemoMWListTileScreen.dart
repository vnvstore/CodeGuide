import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWListTileScreen extends StatefulWidget {
  static String tag = '/DemoMWListTileScreen';

  @override
  DemoMWListTileScreenState createState() => DemoMWListTileScreenState();
}

class DemoMWListTileScreenState extends State<DemoMWListTileScreen> {
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
        body: ListView.builder(
          itemCount: userList.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: appStore.appBarColor,
              margin: EdgeInsets.all(8),
              elevation: 2,
              child: ListTile(
                onTap: () {
                  toasty(context, userList[index].name);
                },
                leading: CircleAvatar(radius: 20, backgroundImage: Image.asset(userList[index].images!).image),
                title: Text(
                  userList[index].name!,
                  style: boldTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(userList[index].value!, style: secondaryTextStyle()),
                ),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class UserModel {
  String? images;
  String? name;
  String? value;

  UserModel({
    this.images,
    this.name,
    this.value,
  });
}

List<UserModel> userList = [
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user1.png',
    name: 'Lee',
    value: '2 min ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user2.png',
    name: 'John Smith',
    value: '2 min ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user3.png',
    name: 'Smith',
    value: '1 hour ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user1.png',
    name: 'Paul',
    value: '1 hour ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user4.png',
    name: 'John Smith',
    value: '1 hour ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user5.png',
    name: 'Lee',
    value: '1 day ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user2.png',
    name: 'Smith',
    value: '1 day ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user1.png',
    name: 'Emene',
    value: '2 min ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user2.png',
    name: 'Paul',
    value: '2 min ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user3.png',
    name: 'Jeck',
    value: '1 hour ago',
  ),
];

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