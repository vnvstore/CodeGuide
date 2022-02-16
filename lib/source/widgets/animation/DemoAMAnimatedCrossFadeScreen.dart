import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils


class DemoAMAnimatedCrossFadeScreen extends StatefulWidget {
  static String tag = '/DemoAMAnimatedCrossFadeScreen';

  @override
  DemoAMAnimatedCrossFadeScreenState createState() => DemoAMAnimatedCrossFadeScreenState();
}

class DemoAMAnimatedCrossFadeScreenState extends State<DemoAMAnimatedCrossFadeScreen> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _crossFadeState = CrossFadeState.showFirst;
      });
    });

    Future.delayed(const Duration(seconds: 3), () async {
      setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      });

      await Future.delayed(Duration(seconds: 3));
      init();
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.scaffoldBackgroundColor,
          body: Center(
            child: AnimatedCrossFade(
              duration: Duration(seconds: 3),
              firstChild: FlutterLogo(style: FlutterLogoStyle.horizontal, size: 150.0),
              secondChild: FlutterLogo(size: 150.0),
              crossFadeState: _crossFadeState,
            ),
          )),
    );
  }
}
