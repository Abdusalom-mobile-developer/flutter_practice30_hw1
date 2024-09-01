import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191B32),
      body: Center(
        child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          fontWeight: FontWeight.bold),
                    ),
      ),
    );
  }
}