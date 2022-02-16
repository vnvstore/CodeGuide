import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/Db7Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard7TodayTopic extends StatefulWidget {
  static String tag = '/DemoDashboard7TodayTopic';

  @override
  DemoDashboard7TodayTopicState createState() => DemoDashboard7TodayTopicState();
}

class DemoDashboard7TodayTopicState extends State<DemoDashboard7TodayTopic> {
  late List<DB7Topic> mList;

  @override
  void initState() {
    super.initState();
    mList = getDB7TodayData();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      //Today's Topic
                      Text(db7_lbl_today_s_topic, style: boldTextStyle(size: 20)),
                      SizedBox(height: 8),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Topic(mList[index], index);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),

      //Footer
      bottomNavigationBar: Text(""),
    );
  }


}

// ignore: must_be_immutable
class Topic extends StatelessWidget {
  late DB7Topic model;

  Topic(DB7Topic model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.topicName, style: primaryTextStyle(fontFamily: 'Medium')),
                Text(model.topicInfo, style: primaryTextStyle(color: db7_textColorSecondary)),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: model.topicLike.toString(), style: primaryTextStyle(size: 16, color: db7_textColorSecondary)),
                          WidgetSpan(
                            child: Padding(padding: EdgeInsets.only(left: 8), child: SvgPicture.asset(db7_ic_like, height: 20, width: 20, color: db7_textColorSecondary)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: model.topicCount.toString(), style: primaryTextStyle(size: 16, color: db7_textColorSecondary)),
                          WidgetSpan(
                            child: Padding(padding: EdgeInsets.only(left: 8), child: SvgPicture.asset(db7_ic_document, height: 20, width: 20, color: db7_textColorSecondary)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(model.topicImg, width: width * 0.2, height: width * 0.2, fit: BoxFit.fill),
            ),
          )
        ],
      ),
    );
  }
}

