import 'package:flutter/material.dart';

class DemoMWAppBarScreen extends StatefulWidget {
  @override
  DemoMWAppBarScreenState createState() => DemoMWAppBarScreenState();
}

class DemoMWAppBarScreenState extends State<DemoMWAppBarScreen> {
  final Color textPrimaryColor = Color(0xFF212121);
  final Color backgroundColor = Colors.white;
  late TextStyle style;

  FocusNode focusNode = FocusNode();
  bool isSearching = false;
  late Widget appBarTitle;

  Icon actionIcon = Icon(Icons.search,color: Colors.white,);
  @override
  void initState() {
    super.initState();
    isSearching = false;
    style = TextStyle(color:textPrimaryColor);
    appBarTitle = Text("Search Toolbar", style: style);

  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget leadingWidget() {
      return BackButton(
        color: textPrimaryColor,
        onPressed: () {
          print('Back button');
        },
      );
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 16,
              spacing: 8,
              direction: Axis.horizontal,
              children: [
                // Simple AppBar without actions and back button
                AppBar(
                  title: Text('Without Back Button & Actions', style: style),
                  backgroundColor: backgroundColor,
                  automaticallyImplyLeading: false,
                ),
                AppBar(
                  title: Text('Center Title', style: style),
                  // Center the title in AppBar with setting center title property to true.
                  centerTitle: true,
                  backgroundColor: backgroundColor,
                  leading: leadingWidget(),
                ),
                AppBar(
                  leading: leadingWidget(),
                  title: Text('With Back Button', style: style),
                  backgroundColor: backgroundColor,
                ),
                AppBar(
                  title: Text('With Single Action', style: style),
                  leading: leadingWidget(),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.settings, color: textPrimaryColor),
                      onPressed: () {
                        print('Settings');
                      },
                    )
                  ],
                  backgroundColor: backgroundColor,
                ),
                AppBar(
                  title: appBarTitle,
                  leading: leadingWidget(),
                  actions: [
                    IconButton(
                      icon: Icon(actionIcon.icon, color: textPrimaryColor),
                      onPressed: () {
                        if (this.actionIcon.icon == Icons.search) {
                          this.actionIcon = Icon(Icons.close, color: textPrimaryColor);
                          this.appBarTitle = TextField(
                            focusNode: focusNode,
                            onChanged: (value) {
                              setState(() {});
                            },
                            style: TextStyle(color: textPrimaryColor, fontSize: 20),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search, color: textPrimaryColor),
                              hintText: "Search",
                              hintStyle: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.normal),
                            ),
                          );
                          setState(() {
                            isSearching = true;
                          });
                        } else {
                          setState(() {
                            this.actionIcon = Icon(Icons.search, color: textPrimaryColor);
                            this.appBarTitle = Text("Search Toolbar", style: style);
                            isSearching = false;
                          });
                        }
                        FocusScope.of(context).requestFocus(focusNode);
                      },
                    ),
                  ],
                  backgroundColor: backgroundColor,
                ),
                AppBar(
                  backgroundColor: backgroundColor,
                  leading: IconButton(
                    icon: Icon(Icons.menu, color: textPrimaryColor),
                    onPressed: () {
                      print( 'Drawer');
                    },
                  ),
                  title: Text('Page Title', style: style),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.share, color: textPrimaryColor),
                      onPressed: () {
                        print( 'Share');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.search, color: textPrimaryColor),
                      onPressed: () {
                        print( 'Search');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert, color: textPrimaryColor),
                      onPressed: () {
                        print('Menu');
                      },
                    ),
                  ],
                ),
                AppBar(
                  leading: leadingWidget(),
                  title: Text('With Custom Image', style: style),
                  backgroundColor: backgroundColor,
                  actions: [
                    IconButton(
                      onPressed: () {
                        print('Profile');
                      },
                      icon: Image.network('https://tecake.com/wp-content/uploads/2018/07/student-profile-gabriela-mills-college.jpg'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
