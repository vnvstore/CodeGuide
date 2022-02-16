import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import '../../Lipsum.dart' as lipsum;

class DemoMWCardScreen extends StatefulWidget {
  static String tag = '/DemoMWCardScreen';

  @override
  DemoMWCardScreenState createState() => DemoMWCardScreenState();
}

class DemoMWCardScreenState extends State<DemoMWCardScreen> {
  List<String> images = [
    "images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/face1.jpg",
    "images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/face2.jpg",
    "images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/face3.jpg",
  ];

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            getCard2(),
            40.height,
            getCard1(),
            16.height,
            getCard3(),
            16.height,
            getCard4(),
            16.height,
            getCard5(),
            32.height,
            getCard6(),
            50.height,
            getCard7(),
            20.height,
            getCard8(),
            16.height,
            getCard9(),
            16.height,
            getCard10(),
            16.height,
            getCard11(),
            16.height,
            getCard12(),
            16.height,
          ],
        ),
      ),
    );
  }

  Widget getCard1() {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: [
        Container(
          width: context.width(),
          decoration: boxDecorationDefault(borderRadius: radius(40), color: context.cardColor),
          padding: EdgeInsets.only(top: 80, bottom: 16, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tesla Inc.', style: boldTextStyle(size: 20)),
              8.height,
              Text('last update Aug 14, 6 PM', style: secondaryTextStyle()),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('2.014,20', style: primaryTextStyle(size: 20)),
                  4.width,
                  Icon(Icons.euro),
                ],
              ),
              4.height,
              Text('-35.78(-1.75%)', style: secondaryTextStyle(color: Colors.green))
            ],
          ),
        ),
        Positioned(
          top: -26,
          child: Container(
            decoration: boxDecorationDefault(
              borderRadius: radius(16),
            ),
            height: 80,
            width: 80,
            child: Icon(Icons.title, size: 50, color: Colors.red),
          ),
        )
      ],
    );
  }

  Widget getCard2() {
    return Container(
      decoration: boxDecorationDefault(borderRadius: radius(32), color: context.cardColor),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/joker.jpg', height: 130).cornerRadiusWithClipRRect(16),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Joker Put on a Happy Face ', style: boldTextStyle(size: 18, weight: FontWeight.w500)),
                  8.height,
                  Text('CGV Cinemas', style: primaryTextStyle(color: Colors.blue, size: 14)),
                  8.height,
                  Text('Thus 05 Nov - 13 : 00', style: primaryTextStyle(size: 14))
                ],
              ).expand(),
            ],
          ),
          16.height,
          AppButton(
            text: 'Select Your Seats to continue',
            textStyle: primaryTextStyle(size: 15),
            color: Colors.amber,
            shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget getCard3() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: boxDecorationDefault(color: context.cardColor, borderRadius: radius(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/diamond.jpg',
          ).cornerRadiusWithClipRRect(16),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Amazing Digital Art', style: primaryTextStyle()),
              Container(
                padding: EdgeInsets.all(4),
                child: Text('2.45 ETH', style: secondaryTextStyle(color: Colors.green, size: 10)),
                decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 2), borderRadius: radius(8)),
              ).onTap(
                () {
                  return toast('2.45 ETH');
                },
              )
            ],
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: EdgeInsets.only(left: (36 * index).toDouble()),
                    decoration: BoxDecoration(
                      border: Border.all(color: context.iconColor, width: 3),
                      borderRadius: radius(100),
                    ),
                    child: CircleAvatar(backgroundImage: AssetImage(images[index]), radius: 20),
                  ),
                ),
              ),
              Text('3 in Stack', style: secondaryTextStyle(size: 10, color: Colors.white))
            ],
          ),
          Divider(color: Colors.grey, height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.bar_chart, size: 15, color: Colors.white54),
                  4.width,
                  Text('Highest bid', style: secondaryTextStyle(size: 12)),
                  4.width,
                  Text('0.001 ETH', style: secondaryTextStyle(color: Colors.white, size: 12)),
                ],
              ),
              Row(
                children: [
                  Text('New Bid', style: secondaryTextStyle(size: 12)),
                  Icon(Icons.local_fire_department, color: Colors.amber, size: 15),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getCard4() {
    return Container(
      height: 210,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              color: context.cardColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.wine_bar_outlined, color: Colors.amber, size: 40),
                8.height,
                Text('Padawan Collector', style: boldTextStyle(size: 20)),
                8.height,
                Text('Collect 10 Zambezi Cards', style: secondaryTextStyle()),
                8.height,
                TextIcon(
                  edgeInsets: EdgeInsets.only(left: 0, right: 8, bottom: 4, top: 4),
                  prefix: Icon(Icons.call, size: 14),
                  text: "+91 8657458214",
                  textStyle: primaryTextStyle(size: 14),
                ),
                TextIcon(
                  edgeInsets: EdgeInsets.only(left: 0, right: 8, bottom: 4, top: 4),
                  prefix: Icon(Icons.web, size: 14),
                  text: "WWW.COMPANY.COM",
                  textStyle: primaryTextStyle(size: 14),
                ),
                TextIcon(
                  edgeInsets: EdgeInsets.only(left: 0, right: 8, bottom: 4, top: 4),
                  prefix: Icon(Icons.location_on_outlined, size: 14),
                  text: "FIND US HERE",
                  textStyle: primaryTextStyle(size: 14),
                ),
              ],
            ),
          ).expand(),
          Container(
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }

  Widget getCard5() {
    return Stack(
      alignment: Alignment.bottomRight,
      overflow: Overflow.visible,
      children: [
        Container(
          height: 150,
          width: context.width(),
          decoration: boxDecorationDefault(borderRadius: radius(32), color: Color(0xFFFF9973)),
          padding: EdgeInsets.only(left: 32, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Emas Saya', style: primaryTextStyle(size: 20, color: Colors.white54)),
              16.height,
              Text('Rp 14.600.000', style: primaryTextStyle(size: 20, color: Colors.white, weight: FontWeight.w500)),
            ],
          ),
        ),
        Positioned(
          right: 10,
          bottom: 20,
          child: Image.asset('images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/ruby.png', height: 140),
        ),
        Positioned(
          bottom: -20,
          right: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            decoration: boxDecorationDefault(borderRadius: radius(16), color: context.cardColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kenutungan', style: primaryTextStyle()),
                8.width,
                Text('Rp 2.430.500', style: primaryTextStyle(color: orange)),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget getCard6() {
    return Container(
      width: context.width(),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                width: context.width(),
                decoration: boxDecorationDefault(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: Color(0xFF846AFF),
                ),
              ),
              Container(
                height: 80,
                width: context.width(),
                decoration: boxDecorationDefault(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Color(0xFF9CC5FF),
                ),
              )
            ],
          ),
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              height: 250,
              width: 250,
              color: Color(0xFFFF9973),
            ).cornerRadiusWithClipRRect(200),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MisterCard', style: primaryTextStyle(color: Colors.white, size: 20)),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 26),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: radius(100),
                          color: Colors.white54,
                        ),
                      ),
                      Positioned(
                        right: 1,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: radius(100),
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              16.height,
              Text('****    ****    ****   4241', style: primaryTextStyle(color: Colors.white, size: 20)),
              32.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Balance', style: primaryTextStyle(color: Colors.white70, size: 18)),
                      8.height,
                      Text('\$2.432,864', style: primaryTextStyle(color: Colors.white, size: 20)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expired', style: primaryTextStyle(color: Colors.white70, size: 18)),
                      8.height,
                      Text('06/24', style: primaryTextStyle(color: Colors.white, size: 20)),
                    ],
                  ),
                  Image.asset('images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/visa.png', width: 50)
                ],
              )
            ],
          ).paddingAll(16)
        ],
      ),
    );
  }

  Widget getCard7() {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: [
        Container(
          width: context.width(),
          decoration: boxDecorationDefault(
            borderRadius: radius(32),
            color: Color(0xFF52392E),
          ),
          padding: EdgeInsets.only(left: 32, right: 32, top: 46, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              32.height,
              Text('Hot Noodles', style: boldTextStyle(color: Colors.red, size: 26)),
              4.height,
              Text('Ingredients', style: secondaryTextStyle(color: Colors.white)),
              16.height,
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: secondaryTextStyle(),
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 16),
              16.height,
              RatingBarWidget(
                onRatingChanged: null,
                disable: true,
                itemCount: 5,
                size: 20,
                activeColor: Colors.yellow,
                rating: 3,
              ),
              8.height,
              Text('\$8,90', style: boldTextStyle(color: Colors.red, size: 26)),
              16.height,
              AppButton(
                text: 'Buy Now',
                color: context.cardColor,
                textStyle: boldTextStyle(color: Colors.red, size: 15),
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
                onTap: () {},
              )
            ],
          ),
        ),
        Positioned(
          top: -36,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5),
              borderRadius: radius(100),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/face1.jpg'),
              radius: 50,
            ),
          ),
        ),
      ],
    );
  }

  Widget getCard8() {
    return Container(
      height: 200,
      width: context.width(),
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.amber, Colors.purpleAccent, Color(0xFF846AFF), Color(0xFF755EE8)],
          ),
          borderRadius: radius(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Family Card', style: boldTextStyle(color: Colors.white, size: 20)),
                  Spacer(),
                  Stack(
                    children: List.generate(
                      2,
                      (index) => Container(
                        margin: EdgeInsets.only(left: (15 * index).toDouble()),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(borderRadius: radius(100), color: Colors.white54),
                      ),
                    ),
                  )
                ],
              ),
              Text('5578 7679 8689 9700', style: secondaryTextStyle(color: Colors.white))
            ],
          ),
          Text('\$8,230', style: boldTextStyle(size: 30, color: Colors.white))
        ],
      ),
    );
  }

  Widget getCard9() {
    return Card(
      color: appStore.appBarColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: Image.network('https://picsum.photos/seed/picsum/200/300', height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
              ),
              10.height,
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  lipsum.createWord(numWords: 2),
                  style: boldTextStyle(size: 20, color: appStore.textPrimaryColor),
                ),
              ),
              10.height,
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  lipsum.createParagraph(numSentences: 1),
                  style: secondaryTextStyle(size: 16, color: appStore.textSecondaryColor),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard10() {
    return Card(
      color: appStore.appBarColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  'images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/widget_card1.jpg',
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.bookmark, color: appStore.iconColor, size: 28),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.favorite, color: appStore.iconColor, size: 28),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.share, color: appStore.iconColor, size: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard11() {
    return Container(
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.only(top: 16),
            color: Colors.blueGrey,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Container(
              margin: EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lipsum.createWord(numWords: 1),
                    style: boldTextStyle(size: 18, color: Colors.white),
                  ),
                  10.height,
                  Text(
                    lipsum.createParagraph(numSentences: 1),
                    style: secondaryTextStyle(size: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: appStore.appBarColor, offset: Offset(0, 3)),
              ],
            ),
            padding: EdgeInsets.all(8),
            child: Icon(Icons.close, color: appStore.iconColor),
          )
        ],
      ),
    );
  }

  Widget getCard12() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Card(
            color: Colors.deepOrangeAccent,
            shadowColor: Colors.deepOrangeAccent,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Activity", style: boldTextStyle(size: 16, color: Colors.white)),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/run.png',
                    color: Colors.white,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomRight,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              onTap: () {},
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                      child: Text(
                        lipsum.createWord(numWords: 9),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: primaryTextStyle(
                          color: appStore.textPrimaryColor,
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Feb 27, 2020',
                            style: secondaryTextStyle(color: appStore.textSecondaryColor),
                          ),
                          Icon(Icons.date_range, color: appStore.iconColor),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
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