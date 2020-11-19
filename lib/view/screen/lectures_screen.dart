import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_management_system/common/settings.dart'
    as app_settings;
import 'package:university_management_system/view/widgets/chip_widget.dart';

class LecturesScreen extends StatefulWidget {
  _LecturesScreenState createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: NestedScrollView(
        reverse: false,
        headerSliverBuilder: (context, innerBoxScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: null),
            title: Text(
              "Electronic Lectures",
              style: app_settings.TextStyles.TEXT_MEDIUM_BOLD_DARK,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                tooltip: 'Open shopping cart',
                onPressed: () {
                  // handle the press
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(5),
              height: 45,
              color: Colors.white,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => ChipWidget(
                      onPress: () {},
                      label: "Study Year",
                      icon: Icons.add_circle)),
            ),
          )
        ],
        body: Container(
          color: Color(0xFFEEEEEE),
        ),
      ),
    );
  }
}
