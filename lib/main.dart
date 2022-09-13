import 'package:categoryapp/api_to_local.dart';
import 'package:categoryapp/view/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(backgroundColor: Colors.white, primaryColor: Colors.white),
      home: MyHomePage(storage: ApiToLocal()),
    );
  }
}
