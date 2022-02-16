import 'package:flutter/material.dart';
import 'utils/widget.dart';

class DemoSimpleHeaders extends StatelessWidget {
  static String tag = '/DemoSimpleHeaders';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return StickyHeader(
              header: Container(
                height: 50.0,
                color: Colors.blueGrey[700],
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #$index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              content: Container(
                child: Image.network('https://killerattitudestatus.in/wp-content/uploads/2019/12/gud-night-images.jpg', fit: BoxFit.cover, width: double.infinity, height: 200.0),
              ),
            );
          },
        ),
      ),
    );
  }
}
