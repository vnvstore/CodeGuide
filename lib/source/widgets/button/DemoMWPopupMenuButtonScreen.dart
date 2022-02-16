import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DemoMWPopupMenuButtonScreen extends StatefulWidget {
  static String tag = '/DemoMWPopupMenuButtonScreen';

  @override
  DemoMWPopupMenuButtonScreenState createState() => DemoMWPopupMenuButtonScreenState();
}

class DemoMWPopupMenuButtonScreenState extends State<DemoMWPopupMenuButtonScreen> {
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
        body: Container(
          padding: EdgeInsets.all(12),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Card(
                elevation: 4,
                child: ListTile(
                    title: Text(
                      'Default Popup menu',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: appStore.textPrimaryColor,
                      ),
                      onSelected: (dynamic value) {
                        print( value);
                      },
                      itemBuilder: (context) {
                        List<PopupMenuEntry<Object>> list = [];
                        list.add(
                          PopupMenuItem(
                            child: Text("Mark as read",style: TextStyle(fontSize: 16)),
                            value: 'Mark as read',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Mute Notification",style: TextStyle(fontSize: 16)),
                            value: ' Mute Notification',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Settings",style: TextStyle(fontSize: 16)),
                            value: 'Settings',
                          ),
                        );
                        return list;
                      },
                    )),
              ),
              Card(
                elevation: 4,
                child: ListTile(
                    title: Text(
                      'Sectioned Popup menu',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: appStore.textPrimaryColor,
                      ),
                      onSelected: (dynamic value) {
                        print( value);
                      },
                      offset: Offset(0, 100),
                      itemBuilder: (context) {
                        List<PopupMenuEntry<Object>>  list = [];
                        list.add(
                          PopupMenuItem(
                            child: Text("Select Language",style: TextStyle(fontSize: 16)),
                            value: 'Select Language',
                          ),
                        );
                        list.add(PopupMenuDivider(
                          height: 2,
                        ));
                        list.add(
                          PopupMenuItem(
                            child: Text("English",style: TextStyle(fontSize: 16)),
                            value: 'English',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Spanish",style: TextStyle(fontSize: 16)),
                            value: 'Spanish',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Arabic",style: TextStyle(fontSize: 16)),
                            value: 'Arabic',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Hindi",style: TextStyle(fontSize: 16)),
                            value: 'Hindi',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Gujarati",style: TextStyle(fontSize: 16)),
                            value: 'Gujarati',
                          ),
                        );

                        return list;
                      },
                    )),
              ),
              Card(
                elevation: 4,
                child: ListTile(
                    title: Text(
                      'Popup menu with Icons',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: appStore.textPrimaryColor,
                      ),
                      onSelected: (dynamic value) {
                        print( value);
                      },
                      offset: Offset(0, 100),
                      itemBuilder: (context) {
                        List<PopupMenuEntry<Object>> list = [];
                        list.add(
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.file_upload,
                                color: appStore.iconColor,
                              ),
                              title: Text('Upload',style: TextStyle(fontSize: 16)),
                            ),
                            value: 'Upload',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.bookmark,
                                color: appStore.iconColor,
                              ),
                              title: Text('Bookmark',style: TextStyle(fontSize: 16)),
                            ),
                            value: 'Bookmark',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.share,
                                color: appStore.iconColor,
                              ),
                              title: Text('Share',style: TextStyle(fontSize: 16)),
                            ),
                            value: 'Share',
                          ),
                        );
                        return list;
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
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