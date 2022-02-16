import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';  //https://pub.dev/packages/flutter_vector_icons
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoEmptyCartScreen extends StatefulWidget {
  const DemoEmptyCartScreen({Key? key}) : super(key: key);

  @override
  _DemoEmptyCartScreenState createState() => _DemoEmptyCartScreenState();
}

class _DemoEmptyCartScreenState extends State<DemoEmptyCartScreen> {
  @override
  void dispose() {
    setStatusBarColor(Color(0xFFEBF2F7));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 230,
              padding: EdgeInsets.all(16),
              child: Image.asset('images/emptyScreen1/emptyCart1.png'),
              decoration: BoxDecoration(color: grey.withOpacity(0.2), shape: BoxShape.circle),
            ),
            70.height,
            Text('Empty Cart', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              backgroundColor: Color(0xFF2D3E5E),
              child: Icon(Ionicons.cart_outline, size: 30, color: Colors.white),
              onPressed: () {
                toast('Add Items');
              },
            ),
          ],
        ),
      ),
    );
  }
}
