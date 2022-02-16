import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'DemoChatBubbleMessageWidget.dart';
import 'modal/DemoChatBubbleModal.dart';
import 'utils.dart';

class DemoChatBubbleScreen extends StatefulWidget {
  @override
  DemoChatBubbleScreenState createState() => DemoChatBubbleScreenState();
}

class DemoChatBubbleScreenState extends State<DemoChatBubbleScreen> {
  ScrollController controller = ScrollController();

  TextEditingController msgController = TextEditingController();

  FocusNode msgFocusNode = FocusNode();

  List<DemoChatBubbleModal> msgList = getChatBubbleMessageData();

  String personName = '';
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Chat Bubble Screen', color: context.scaffoldBackgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              decoration: BoxDecoration(),
              child: ListView.separated(
                separatorBuilder: (_, i) => Divider(color: Colors.transparent),
                shrinkWrap: true,
                reverse: true,
                controller: controller,
                itemCount: msgList.length,
                itemBuilder: (_, index) {
                  DemoChatBubbleModal data = msgList[index];
                  bool isMe = data.senderId == CHBSender_id;

                  return DemoChatBubbleMessageWidget(isMe: isMe, data: data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
