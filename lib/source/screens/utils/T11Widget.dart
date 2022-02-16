import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/T11Model.dart';
import 'AppWidget.dart';
import 'strings.dart';
import 'T11Colors.dart';

Widget optionContainer(double width, String txt) {
  return Container(
    width: width,
    height: 50,
    alignment: Alignment.center,
    decoration: boxDecorationDefault(borderRadius: radius(24)),
    child: Text(txt, style: boldTextStyle()),
  );
}

Widget musicAlbumList(List<Music> musicList) {
  return HorizontalList(
      spacing: 8,
      padding: EdgeInsets.only(left: 16),
      itemCount: musicList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset((musicList[index].image), height: 90, width: 90, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
            8.height,
            Text(musicList[index].title, style: boldTextStyle()),
            2.height,
            Text(musicList[index].subtitle, style: secondaryTextStyle()),
          ],
        );
      });
}

Widget musicSimilarArtistList(List<Music> musicList) {
  return HorizontalList(
      spacing: 8,
      padding: EdgeInsets.only(left: 16, bottom: 16),
      itemCount: musicList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: boxDecorationRoundedWithShadow(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                (musicList[index].image),
                height: 70,
                width: 100,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRectOnly(topLeft: 24, topRight: 24),
              Text(musicList[index].title, style: boldTextStyle(), textAlign: TextAlign.center).paddingAll(4),
            ],
          ),
        );
      });
}

Widget bottomNavigationWidget() {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.music, color: appStore.appColorPrimary), label: ''),
      BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.playlist_music, color: appStore.appColorPrimary), label: ''),
      BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.account, color: appStore.appColorPrimary), label: ''),
    ],
    selectedLabelStyle: TextStyle(fontSize: 0),
    unselectedLabelStyle: TextStyle(fontSize: 0),
    backgroundColor: Colors.white,
  );
}

Widget searchWidget(Color color) {
  return Container(
    child: TextFormField(
      style: secondaryTextStyle(color: appStore.appColorPrimary),
      keyboardType: TextInputType.name,
      cursorColor: black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintText: t3_lbl_search_here,
        hintStyle: secondaryTextStyle(),
        filled: true,
        fillColor: color,
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: appStore.appColorPrimary, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: appStore.appColorPrimary, width: 0.0),
        ),
      ),
    ),
  );
}

Widget t11EditTextStyle(var hintText, TextFieldType keyboardType) {
  return AppTextField(
    textFieldType: keyboardType,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(26, 14, 4, 14),
      hintText: hintText,
      hintStyle: secondaryTextStyle(),
      filled: true,
      fillColor: white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: t11_edit_text_color, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: t11_edit_text_color, width: 0.0),
      ),
    ),
  );
}

class T11PlayPauseAnimation extends StatefulWidget {
  @override
  T11PlayPauseAnimationState createState() => T11PlayPauseAnimationState();
}

class T11PlayPauseAnimationState extends State<T11PlayPauseAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.skip_previous, color: appStore.appColorPrimary), label: ''),
        BottomNavigationBarItem(icon: AnimatedIcon(progress: _animationController, icon: AnimatedIcons.play_pause, color: appStore.appColorPrimary), label: ''),
        BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.skip_next, color: appStore.appColorPrimary), label: ''),
      ],
      selectedLabelStyle: TextStyle(fontSize: 0),
      unselectedLabelStyle: TextStyle(fontSize: 0),
      backgroundColor: Colors.white,
      onTap: (v) {
        print(v);
        _handleOnPressed();
      },
    );
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying ? _animationController.forward() : _animationController.reverse();
    });
  }
}
