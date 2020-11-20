import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_management_system/view/screen/announcements_screen.dart';
import 'package:university_management_system/view/screen/lectures_screen.dart';
import 'package:university_management_system/view/widgets/main_section_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFEEEEEE),
        appBar: AppBar(
          title: Text(
            "Hi, Samir",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: null,
              icon: SvgPicture.asset("assets/icons/notifications.svg"),
            ),
            IconButton(
              onPressed: null,
              icon: SvgPicture.asset("assets/icons/download.svg"),
            ),
            IconButton(
              onPressed: null,
              icon: SvgPicture.asset("assets/icons/search.svg"),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
                flex: 9,
                child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: _mainSections(context).length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 4
                            : 2,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) =>
                        _mainSections(context)[index]))
          ],
        ));
  }

  List<Widget> _mainSections(BuildContext context) => [
        MainSectionWidget(
            iconAsset: "assets/icons/lectures.svg",
            title: "Lectures",
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LecturesScreen()));
            }),
        MainSectionWidget(
            iconAsset: "assets/icons/announcement.svg",
            title: "Announcements",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AnnouncementsScreen()));
            }),
        MainSectionWidget(
            iconAsset: "assets/icons/exam_results.svg",
            title: "Exams Results",
            onPressed: () {}),
        MainSectionWidget(
            iconAsset: "assets/icons/correction_ladders.svg",
            title: "correction Ladders",
            onPressed: () {}),
        MainSectionWidget(
            iconAsset: "assets/icons/management.svg",
            title: "management",
            onPressed: () {}),
      ];
}
