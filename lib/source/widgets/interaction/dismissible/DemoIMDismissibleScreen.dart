import 'package:flutter/material.dart';
import '../../../Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';    //https://pub.dev/packages/nb_utils

class DemoIMDismissibleScreen extends StatefulWidget {
  static String tag = '/DemoIMDismissibleScreen';

  @override
  _DemoIMDismissibleScreenState createState() => _DemoIMDismissibleScreenState();
}

class _DemoIMDismissibleScreenState extends State<DemoIMDismissibleScreen> {


  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  List<ListModel> example = [
    ListModel(name: 'Dismissible with Both Side'),
    ListModel(name: 'Dismissible with One Side'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.scaffoldBackgroundColor,
          body: ListView.builder(
              itemCount:  example.length,
              itemBuilder: (BuildContext context, index) {
                return ExampleItemWidget(example[index], onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => example[index].widget!));
                });
              })),
    );
  }
}

Widget mDismissibleList(UserModel mUserModel) {
  Color appColorPrimary = Color(0xFF1157FA);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(radius: 20, backgroundColor: appColorPrimary, child: Text(mUserModel.tag!, style: primaryTextStyle(color: Colors.white))),
        10.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mUserModel.name!,
                  style: boldTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  mUserModel.duration!,
                  style: secondaryTextStyle(),
                )
              ],
            ),
            Text(
              lipsum.createParagraph(numSentences: 1),
              style: primaryTextStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            4.height,
            Text(
              lipsum.createParagraph(numSentences: 1),
              style: secondaryTextStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ).expand()
      ],
    ),
  );
}

class UserModel {
  String? tag;
  String? name;
  String? duration;

  UserModel({
    this.tag,
    this.name,
    this.duration,
  });
}

List<UserModel> userList = [
  UserModel(
    tag: 'L',
    name: 'Lee',
    duration: '8:43 am',
  ),
  UserModel(
    tag: 'J',
    name: 'John Smith',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'P',
    name: 'Paul',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'D',
    name: 'Dribble',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'I',
    name: 'Indeed',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'A',
    name: 'Adward',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'B',
    name: 'Bella',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'L',
    name: 'Lee',
    duration: '8:43 am',
  ),
  UserModel(
    tag: 'J',
    name: 'John Smith',
    duration: '2 min ago',
  ),
];

class ListModel {
  String? name;
  bool? isNew;
  Widget? widget;

  ListModel({this.name, this.widget,this.isNew});
}
class ExampleItemWidget extends StatelessWidget {
  final ListModel tabBarType;
  final Function onTap;
  final bool showTrailing;

  ExampleItemWidget(this.tabBarType, {required this.onTap, this.showTrailing = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
      elevation: 2.0,
      shadowColor: Colors.black,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(tabBarType.name!, style: TextStyle(fontWeight:FontWeight.bold)),
        trailing: showTrailing
            ? Icon(Icons.arrow_forward_ios, size: 15, color: Color(0xFF212121))
            : tabBarType.isNew??false
            ? Text('New', style: TextStyle(fontSize:14,color: Colors.red))
            : null,
      ),
    );
  }
}