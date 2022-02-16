import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoNoResultsScreen extends StatefulWidget {
  const DemoNoResultsScreen({Key? key}) : super(key: key);

  @override
  _DemoNoResultsScreenState createState() => _DemoNoResultsScreenState();
}

class _DemoNoResultsScreenState extends State<DemoNoResultsScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF5B5E7D));
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
            Image.asset(
              'images/errorScreens/14_No Search Results.png',
              fit: BoxFit.cover,
              height: context.height(),
              width: context.width(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('No Results', style: secondaryTextStyle(size: 40, color: white)),
                48.height,
                Text(
                  'Sorry there are no results for this search, Please try another phrase',
                  style: primaryTextStyle(size: 20, color: Colors.white54),
                ),
                48.height,
                AppTextField(
                  textFieldType: TextFieldType.OTHER,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    filled: true,
                    hintText: 'Search..',
                    hintStyle: secondaryTextStyle(size: 16),
                    suffixIcon: Icon(Icons.search, color: black),
                    border: OutlineInputBorder(borderRadius: radius(30)),
                    fillColor: context.cardColor,
                  ),
                ),
              ],
            ).paddingAll(32),
          ],
        ),
      ),
    );
  }
}
