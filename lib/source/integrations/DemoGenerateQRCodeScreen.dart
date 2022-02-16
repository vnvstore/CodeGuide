import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';      //https://pub.dev/packages/nb_utils
import 'package:qr_flutter/qr_flutter.dart';  //https://pub.dev/packages/qr_flutter

class DemoGenerateQRCodeScreen extends StatefulWidget {
  @override
  DemoGenerateQRCodeScreenState createState() => DemoGenerateQRCodeScreenState();
}

class DemoGenerateQRCodeScreenState extends State<DemoGenerateQRCodeScreen> {
  TextEditingController qrCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    changeStatusColor(appStore.scaffoldBackground);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Generate QR Code', color: appStore.appBarColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            AppTextField(
              controller: qrCont,
              textFieldType: TextFieldType.OTHER,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                labelText: 'Write something',
                labelStyle: primaryTextStyle(),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: context.dividerColor, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: appStore.primaryColor, width: 1.0),
                ),
              ),
              onChanged: (v) {
                setState(() {});
              },
            ),
            16.height,
            QrImage(
              data: qrCont.text.validate(),
              version: QrVersions.auto,
              size: 220.0,
              foregroundColor: Colors.black,
            ).visible(qrCont.text.isNotEmpty),
          ],
        ).paddingAll(16),
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
  Color primaryColor = Color(0xFFFF4E54);
  Color iconColorPrimaryDark = Color(0xFF212121);
  Color scaffoldBackground = Color(0xFFEBF2F7);
  Color backgroundColor = Colors.black;
  Color backgroundSecondaryColor = Color(0xFF131d25);
  Color appColorPrimaryLightColor = Color(0xFFF9FAFF);
  Color textSecondaryColor = Color(0xFF5A5C5E);
  Color appBarColor = Colors.white;
  Color iconColor = Color(0xFF212121);
  Color iconSecondaryColor = Color(0xFFA8ABAD);
  Color cardColor = Colors.white;
  Color appColorPrimary = Color(0xFF1157FA);
  Color scaffoldBackgroundColor = Color(0xFFEFEFEF);

  AppStore();

}