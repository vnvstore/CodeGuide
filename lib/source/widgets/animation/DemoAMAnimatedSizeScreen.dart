import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils


class DemoAMAnimatedSizeScreen extends StatefulWidget {
  static String tag = '/DemoAMAnimatedSizeScreen';

  @override
  DemoAMAnimatedSizeScreenState createState() => DemoAMAnimatedSizeScreenState();
}

class DemoAMAnimatedSizeScreenState extends State<DemoAMAnimatedSizeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 1));
    _updateSize();
    await Future.delayed(Duration(seconds: 2));
    init();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: Center(
          child: GestureDetector(
            onTap: () => _updateSize(),
            child: Container(
              child: AnimatedSize(
                curve: Curves.easeIn,
                vsync: this,
                duration: Duration(seconds: 1),
                child: FlutterLogo(
                  size: _size,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
