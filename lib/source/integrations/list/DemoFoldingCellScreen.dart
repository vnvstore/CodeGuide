import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/folding_cell_widget.dart';

class DemoFoldingCellScreen extends StatefulWidget {
  static String tag = '/DemoFoldingCellScreen';

  @override
  DemoFoldingCellScreenState createState() => DemoFoldingCellScreenState();
}

class DemoFoldingCellScreenState extends State<DemoFoldingCellScreen> {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  Color appColorPrimary = Color(0xFF1157FA);

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 16),
        alignment: Alignment.topCenter,
        child: SimpleFoldingCell(
          key: _foldingCellKey,
          frontWidget: _buildFrontWidget(),
          innerTopWidget: _buildInnerTopWidget(),
          innerBottomWidget: _buildInnerBottomWidget(),
          cellSize: Size(MediaQuery.of(context).size.width, 125),
          padding: EdgeInsets.all(15),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 10,
          onOpen: () => print('cell opened'),
          onClose: () => print('cell closed'),
        ),
      ),
    );
  }

  Widget _buildFrontWidget() {
    return Container(
      color: Color(0xFFffcd3c),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("CARD", style: TextStyle(fontSize: 20.0), ),
          TextButton(
            onPressed: () => _foldingCellKey.currentState?.toggleFold(),
            child: Text("Open", style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
              overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.5)),
            ),
            //splashColor: Colors.white.withOpacity(0.5),
          )
        ],
      ),
    );
  }

  Widget _buildInnerTopWidget() {
    return Container(
        color: Color(0xFFff9234), alignment: Alignment.center, child: Text("TITLE", style: TextStyle(color: Color(0xFF2e282a), fontFamily: 'OpenSans', fontSize: 20.0, fontWeight: FontWeight.w800)));
  }

  Widget _buildInnerBottomWidget() {
    return Container(
      color: Color(0xFFecf2f9),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextButton(
          onPressed: () => _foldingCellKey.currentState?.toggleFold(),
          child: Text("Close"),
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: Colors.white),
            primary: Colors.indigoAccent,

          ),
          //splashColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}
