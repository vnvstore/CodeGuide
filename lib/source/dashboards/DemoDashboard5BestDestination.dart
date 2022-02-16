import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/Db5Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard5BestDestination extends StatefulWidget {
  static String tag = '/DemoDashboard5BestDestination';

  @override
  DemoDashboard5BestDestinationState createState() => DemoDashboard5BestDestinationState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard5BestDestinationState extends State<DemoDashboard5BestDestination> {
  late List<Db6BestDestinationData> mListings1;

  @override
  void initState() {
    super.initState();
    mListings1 = generateBestDestination();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(db5_colorPrimary);
    return Scaffold(
      backgroundColor: db5_white,

      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            //Header
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  //Best Destination
                  SizedBox(height: 8),
                  Divider(height: 4, color: db5_viewColor, thickness: 2),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(db5_best_destination, style: primaryTextStyle(color: db5_colorPrimary, size: 24)),
                        Text(db5_see_All.toUpperCase(), style: primaryTextStyle(color: db5_textColorSecondary)),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      primary: false,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                      itemCount: mListings1.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => Container(
                        margin: EdgeInsets.only(left: 4, bottom: 4, top: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Image.asset(mListings1[index].image),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(mListings1[index].name, style: primaryTextStyle(color: white)),
                                    Container(
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                                          child: RichText(
                                            text: TextSpan(
                                              style: Theme.of(context).textTheme.bodyText2,
                                              children: [
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                                                    child: Icon(Icons.star_border, color: db5_yellow, size: 16),
                                                  ),
                                                ),
                                                TextSpan(text: mListings1[index].rating, style: secondaryTextStyle(size: 14, color: db5_white, fontFamily: fontMedium)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(color: db5_black_trans, borderRadius: BorderRadius.all(Radius.circular(12)))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //    SizedBox(height: 50,)
                ],
              ),
            )
          ],
        ),
      ),
      //Footer
      bottomNavigationBar: Text(""),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}

