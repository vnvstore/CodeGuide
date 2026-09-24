import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';  //https://pub.dev/packages/flutter_reaction_button
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/fab_circular_menu.dart';

class DemoButtonScreen extends StatefulWidget {
  static String tag = '/DemoButtonScreen';

  @override
  DemoButtonScreenState createState() => DemoButtonScreenState();
}

class DemoButtonScreenState extends State<DemoButtonScreen> {
  //   The menu can be handled using a key
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  //  maintain the state of the response on loader of button.
  int _state = 0;
  String changeText = 'Login';

  //   List of the Reaction on the click of button
  List<Reaction<int>> reaction = [
    Reaction<int>(
      value: 1,
      previewIcon: _buildPreviewIcon('images/Reaction/images/like.gif'),
      icon: _buildIcon(
        'images/Reaction/images/like_fill.png',
        'Like',
        Color(0XFF3b5998),
      ),
    ),
    Reaction<int>(
      value: 2,
      previewIcon: _buildPreviewIcon('images/Reaction/images/love.gif'),
      icon: _buildIcon(
        'images/Reaction/images/love.png',
        'Love',
        Color(0XFFed5168),
      ),
    ),
    Reaction<int>(
      value: 3,
      previewIcon: _buildPreviewIcon('images/Reaction/images/wow.gif'),
      icon: _buildIcon(
        'images/Reaction/images/wow.png',
        'Wow',
        Color(0XFFffda6b),
      ),
    ),
    Reaction<int>(
      value: 4,
      previewIcon: _buildPreviewIcon('images/Reaction/images/haha.gif'),
      icon: _buildIcon(
        'images/Reaction/images/haha.png',
        'Haha',
        Color(0XFFffda6b),
      ),
    ),
    Reaction<int>(
      value: 5,
      previewIcon: _buildPreviewIcon('images/Reaction/images/sad.gif'),
      icon: _buildIcon(
        'images/Reaction/images/sad.png',
        'Sad',
        Color(0XFFffda6b),
      ),
    ),
    Reaction<int>(
      value: 6,
      previewIcon: _buildPreviewIcon('images/Reaction/images/angry.gif'),
      icon: _buildIcon(
        'images/Reaction/images/angry.png',
        'Angry',
        Color(0XFFf05766),
      ),
    ),
  ];

  //   List of the Reaction on the click of button
  List<Reaction<int>> reaction2 = [
    Reaction<int>(
      value: 1,
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/whatsapp.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
    ),
    Reaction<int>(
      value: 2,
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/fb2.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
    ),
    Reaction<int>(
      value: 3,
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/wordpress.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
    ),
    Reaction<int>(
      value: 4,
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/map.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
    ),
    Reaction<int>(
      value: 5,
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/linkedin.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
    ),
    Reaction<int>(
      value: 6,
      previewIcon: _buildPreviewIcon('images/Reaction/images/SocialMedia/youtube.png'),
      icon: _buildIcon(
        'images/Reaction/images/SocialMedia/media.png',
        'Contact us',
        Colors.grey[600],
      ),
    ),
  ];

  void animateButton() {
    setState(() {
      _state = 1;
    });
    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 0;
        changeText = 'Login Successfull';
        Timer(Duration(milliseconds: 3300), () {
          setState(() {
            changeText = 'Login';
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appColorPrimary);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          SizedBox(height: 10),
          Text(
            'Reaction Buttons',
            style: boldTextStyle(),
          ),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ReactionButton<int>(
                itemSize: Size(40, 40),
                onReactionChanged: (reaction) {
                  if (reaction != null) {
                    print('reaction selected id: ${reaction.value}');
                  }
                },
                //  Apply the list
                reactions: reaction,
                // Specify the Elevation.
                boxElevation: 10,
                // Initial reaction when the screen loads
                selectedReaction: Reaction<int>(
                  value: 0,
                  previewIcon: _buildPreviewIcon('images/Reaction/images/like.png'),
                  icon: _buildIcon('images/Reaction/images/like.png', 'Like', Colors.grey[600]),
                ),
              ),
              ReactionButton<int>(
                itemSize: Size(40, 40),
                onReactionChanged: (reaction) {
                  if (reaction == null) return;
                  //  Handle the respose of the reaction the user select.
                  String message = '';
                  print('reaction selected id: ${reaction.value}');
                  if (reaction.value == 1) {
                    setState(
                      () {
                        message = "Whatsapp";
                      },
                    );
                  } else if (reaction.value == 2) {
                    setState(
                      () {
                        message = "Facebook";
                      },
                    );
                  } else if (reaction.value == 3) {
                    setState(
                      () {
                        message = "Wordpress";
                      },
                    );
                  } else if (reaction.value == 4) {
                    setState(
                      () {
                        message = "Map";
                      },
                    );
                  } else if (reaction.value == 5) {
                    setState(
                      () {
                        message = "Linkedin";
                      },
                    );
                  } else if (reaction.value == 6) {
                    setState(
                      () {
                        message = "Youtube";
                      },
                    );
                  }
                  toasty(context, 'You clicked $message share');
                },
                reactions: reaction2,
                boxRadius: 10,
                selectedReaction: Reaction<int>(
                  value: 0,
                  icon: _buildIcon('images/Reaction/images/SocialMedia/media.png', 'Contact us', Colors.grey[600]),
                ),
              ),
            ],
          ),
          10.height,
          Divider(),
          10.height,
          Text(
            'Button with Progress Bar',
            style: boldTextStyle(),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.all(0.0),
                backgroundColor: Color(0xFF8998FF),
              ),
              child: _state != 1
                  ? Text(
                      changeText,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    )
                  : SizedBox(
                      height: 36.0,
                      width: 36.0,
                      child: CircularProgressIndicator(
                        value: null,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
              onPressed: () {
                setState(() {
                  if (_state == 0) {
                    animateButton();
                  }
                });
              },


            ),
          ),
        ],
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }
}

Widget _buildPreviewIcon(String path) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
      child: Image.asset(path, height: 40),
    );

Widget _buildIcon([String? path, String? text, Color? textColor]) => Container(
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          Image.asset(
            path!,
            height: 24,
          ),
          10.width,
          Text(
            text!,
            style: boldTextStyle(
              size: 16,
            ),
          ),
        ],
      ),
    );

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