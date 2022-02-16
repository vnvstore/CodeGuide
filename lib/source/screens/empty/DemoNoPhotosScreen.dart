import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoPhotosScreen extends StatefulWidget {
  const DemoNoPhotosScreen({Key? key}) : super(key: key);

  @override
  _DemoNoPhotosScreenState createState() => _DemoNoPhotosScreenState();
}

class _DemoNoPhotosScreenState extends State<DemoNoPhotosScreen> {
  @override
  void dispose() {
    setStatusBarColor(Color(0xFFEBF2F7));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('images/emptyScreen1/noPhotos1.png'),
              16.height,
              Text('No Photos!', style: boldTextStyle(size: 20)),
              16.height,
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: primaryTextStyle(size: 15),
                textAlign: TextAlign.center,
              ).paddingSymmetric(vertical: 8, horizontal: 60),
              32.height,
              FloatingActionButton(
                child: Icon(Icons.add, size: 30),
                onPressed: () {
                  toast('Add Photos');
                },
              ),
              70.height,
            ],
          ),
        ),


      ),
    );
  }
}
