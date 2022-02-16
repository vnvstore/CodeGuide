import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoAMScaleTransitionScreen extends StatefulWidget {
  static String tag = '/DemoAMScaleTransitionScreen';

  @override
  DemoAMScaleTransitionScreenState createState() => DemoAMScaleTransitionScreenState();
}

class DemoAMScaleTransitionScreenState extends State<DemoAMScaleTransitionScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: Center(
          child: ScaleTransition(
            scale: _animation,
            alignment: Alignment.center,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
