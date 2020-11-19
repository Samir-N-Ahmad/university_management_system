import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 4
                            : 2,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x77B2B2B2),
                                    blurRadius: 10,
                                    spreadRadius: 3)
                              ]),
                        )))
          ],
        ));
  }
}
