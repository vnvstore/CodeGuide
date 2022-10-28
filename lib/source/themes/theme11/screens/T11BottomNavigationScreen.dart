import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppWidget.dart';
import '../utils/T11Strings.dart';



class T11BottomNavigationScreen extends StatefulWidget {
  static String tag = '/T11BottomNavigationScreen';

  @override
  T11BottomNavigationScreenState createState() => T11BottomNavigationScreenState();
}

class T11BottomNavigationScreenState extends State<T11BottomNavigationScreen> {
  int _selectedIndex = 0;
  List<String> pages = ['Home', 'Playlist', 'Profile'];

  @override
  void initState() {
    changeStatusColor(appStore.appBarColor);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, t11_lbl_bottom_navigation),
      body: Text(
        pages.elementAt(_selectedIndex),
        style: boldTextStyle(size: 18),
      ).center(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.music), label: ''),
          BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.playlist_music), label: ''),
          BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.account), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: appColorPrimary,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(fontSize: 0),
        unselectedLabelStyle: TextStyle(fontSize: 0),
        backgroundColor: Colors.white,
      ),
    );
  }
}
