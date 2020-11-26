import 'package:flutter/material.dart';
import 'package:university_management_system/view/screen/main_screen.dart';
import 'package:university_management_system/service/download_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DownloadManger.instance().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
