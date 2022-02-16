import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoMissingArticleScreen extends StatefulWidget {
  const DemoMissingArticleScreen({Key? key}) : super(key: key);

  @override
  _DemoMissingArticleScreenState createState() => _DemoMissingArticleScreenState();
}

class _DemoMissingArticleScreenState extends State<DemoMissingArticleScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFFFFFFF));
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(Color(0xFFEBF2F7));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset('images/errorScreens/12_Article Not Found.png', fit: BoxFit.cover, height: context.height()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Missing Article', style: boldTextStyle(size: 30)),
                16.height,
                Text(
                  'Article you are looking for is not available',
                  style: primaryTextStyle(size: 18, color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('BACK', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 10,
                  color: Color(0xFF39C7B3),
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    toast('BACK');
                  },
                ),
                100.height,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
