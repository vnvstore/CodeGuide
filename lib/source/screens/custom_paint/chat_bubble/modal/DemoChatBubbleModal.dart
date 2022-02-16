import '../utils.dart';

class DemoChatBubbleModal {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  DemoChatBubbleModal({this.senderId, this.receiverId, this.msg, this.time});
}

List<DemoChatBubbleModal> getChatBubbleMessageData() {
  List<DemoChatBubbleModal> list = [];

  list.add(DemoChatBubbleModal(msg: "Hello", receiverId: CHBReceiver_id, senderId: CHBSender_id, time: "1:30 pm"));
  list.add(DemoChatBubbleModal(msg: "How are you? What are you doing?", receiverId: CHBReceiver_id, senderId: CHBSender_id, time: "1:32 pm"));
  list.add(DemoChatBubbleModal(msg: "I am good. Can you do something for me? I need your help", receiverId: CHBSender_id, senderId: CHBReceiver_id, time: "1:35 pm"));
  list.add(DemoChatBubbleModal(msg: "Yes of Course", receiverId: CHBReceiver_id, senderId: CHBSender_id, time: "1:30 pm"));
  return list;
}
