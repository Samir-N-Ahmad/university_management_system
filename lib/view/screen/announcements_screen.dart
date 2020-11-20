import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_management_system/common/settings.dart'
    as app_settings;
import 'package:university_management_system/view/widgets/item_with_image.dart';

class AnnouncementsScreen extends StatefulWidget {
  _AnnouncementsScreenState createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: NestedScrollView(
        reverse: false,
        headerSliverBuilder: (context, innerBoxScrolled) => [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            centerTitle: true,
            title: Text(
              "Announcements",
              style: app_settings.TextStyles.TEXT_LARGE_BOLD_DARK,
            ),
          ),
        ],
        body: Container(
          child: ListView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: _mainSections.length,
              itemBuilder: (context, index) => _mainSections[index]),
          color: Color(0xFFEEEEEE),
        ),
      ),
    );
  }

  List<Widget> _mainSections = [
    ItetmWithImage(
      title: "Announcement 1",
      onClick: () {},
      body:
          "Lorem ipsum dolor sit amet,consectetur adipiscing elit. Lobortis lacus eget facilisis at cras eget venenatis.",
    ),
    ItetmWithImage(
      title: "Announcement 2",
      onClick: () {},
      image: "assets/images/announcement2.jpeg",
      body:
          "Lorem ipsum dolor sit amet,consectetur adipiscing elit. Lobortis lacus eget facilisis at cras eget venenatis.",
    ),
  ];
}
