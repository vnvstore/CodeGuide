import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoTaskDoneScreen extends StatefulWidget {
  const DemoTaskDoneScreen({Key? key}) : super(key: key);

  @override
  _DemoTaskDoneScreenState createState() => _DemoTaskDoneScreenState();
}

class _DemoTaskDoneScreenState extends State<DemoTaskDoneScreen> {
  @override
  void dispose() {
    setStatusBarColor(Color(0xFFEBF2F7));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          20.height,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Task Done', style: boldTextStyle(size: 20)),
                  85.width,
                  IconButton(
                    icon: Icon(Icons.add, size: 30),
                    onPressed: () {
                      toast('Add Task');
                    },
                  ).paddingOnly(right: 32),
                ],
              ),
              16.height,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', style: primaryTextStyle(size: 15), textAlign: TextAlign.center),
              ),
            ],
          ),
          150.height,
          Image.asset('images/emptyScreen1/taskDone1.png', height: 250),
        ],
      ).paddingSymmetric(vertical: 32),
    );
  }
}
