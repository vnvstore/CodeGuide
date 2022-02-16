import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'package:signature/signature.dart';  //https://pub.dev/packages/signature

class DemoSignatureScreen extends StatefulWidget {
  static String tag = '/DemoSignatureScreen';

  @override
  DemoSignatureScreenState createState() => DemoSignatureScreenState();
}

class DemoSignatureScreenState extends State<DemoSignatureScreen> {

  final SignatureController controller = SignatureController(penStrokeWidth: 5, penColor: Colors.red);
  Color appColorPrimary = Color(0xFF1157FA);

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Signature(controller: controller, height: MediaQuery.of(context).size.height, backgroundColor: Colors.white10),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                color: appColorPrimary,
                onPressed: () {
                  setState(() {
                    controller.clear();
                  });
                },
                child: Text('Clear Signature', style: TextStyle(color: whiteColor)),
              ),
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
