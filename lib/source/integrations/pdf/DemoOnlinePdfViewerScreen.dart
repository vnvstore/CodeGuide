import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart'; //https://pub.dev/packages/syncfusion_flutter_pdfviewer

class DemoOnlinePdfViewerScreen extends StatefulWidget {
  @override
  DemoOnlinePdfViewerScreenState createState() => DemoOnlinePdfViewerScreenState();
}

class DemoOnlinePdfViewerScreenState extends State<DemoOnlinePdfViewerScreen> {
  String pdfURL = 'https://file-examples-com.github.io/uploads/2017/10/file-sample_150kB.pdf';

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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Online PDF Viewer', style: boldTextStyle(size: 22)),
            backgroundColor: appStore.appBarColor,
            leading: BackButton(
              color: appStore.textPrimaryColor,
              onPressed: () {
                finish(context);
              },
            ),
          ),
          body: SfPdfViewer.network(pdfURL)),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
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