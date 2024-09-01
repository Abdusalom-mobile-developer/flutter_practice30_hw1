import 'package:flutter/material.dart';
import 'package:flutter_practice30_hw1/models/get_storage.dart';
import 'package:flutter_practice30_hw1/models/utils.dart';
import 'package:flutter_practice30_hw1/pages/home_page.dart';
import 'package:flutter_practice30_hw1/pages/login_page.dart';
import 'package:flutter_practice30_hw1/pages/sign_up_page.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    Utils.d(GetStorageClass.getUser("signInInfo"));
    if (GetStorageClass.getData("isLoggedIn") == "true") {
      _currentPageIndex = 2;
    }
    Utils.d(GetStorageClass.getUser("signUpInfo"));
    Utils.d(GetStorageClass.getData("isLoggedIn"));
  }

  final pages = [
    LoginPage(),
    SignUpPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pages[_currentPageIndex],
      routes: {
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        SignUpPage.id: (context) => SignUpPage(),
      },
    );
  }
}
