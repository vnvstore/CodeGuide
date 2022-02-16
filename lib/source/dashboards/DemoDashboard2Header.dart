import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/DbColors.dart';
import 'utils/DbStrings.dart';

class DemoDashboard2Header extends StatefulWidget {
  static String tag = '/DemoDashboard2Header';

  @override
  DemoDashboard2HeaderState createState() => DemoDashboard2HeaderState();
}

const CURVE_HEIGHT = 100.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.8;
const fontMedium = 'Medium';

class DemoDashboard2HeaderState extends State<DemoDashboard2Header> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    changeStatusColor(db2_colorSecondary);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            //header
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 140,
                  child: CustomPaint(painter: _MyPainter()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.menu, color: white),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                          Text(
                            db2_lbl_home,
                            style: boldTextStyle(size: 20, color: white),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.favorite, color: white),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart, color: white),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  transform: Matrix4.translationValues(0.0, 60.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.all(Radius.circular(26)), boxShadow: defaultBoxShadow()),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: white,
                                  hintText: db2_lbl_search_here,
                                  contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, right: 50.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: white, width: 0.5),
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: white, width: 0.5),
                                    borderRadius: BorderRadius.circular(26),
                                  ))),
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(Icons.search, color: db2_textColorSecondary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = db2_colorSecondary;

    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
