import 'package:flutter/material.dart';
import 'package:flutter_practice30_hw1/models/get_storage.dart';
import 'package:flutter_practice30_hw1/pages/home_page.dart';
import 'package:flutter_practice30_hw1/pages/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  static final String id = "login_page";
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Widget textFieldMaker(
      {required String content,
      required IconData icon,
      required TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[500]!, width: 2))),
      child: TextField(
        style: TextStyle(
          color: Colors.grey[500]!,
        ),
        controller: controller,
        decoration: InputDecoration(
            hintText: content,
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
                gapPadding: BouncingScrollSimulation.maxSpringTransferVelocity,
                borderSide: BorderSide.none),
            prefixIcon: Icon(
              icon,
              color: Colors.grey[500],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191B32),
      body: Container(
        margin: EdgeInsets.only(bottom: 35),
        child: Stack(
          children: [
            // Top content part
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/thinking_man.png"),
                      height: 90,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    textFieldMaker(
                        content: "Username",
                        controller: _usernameController,
                        icon: Icons.person_2_outlined),
                    textFieldMaker(
                        content: "Password",
                        controller: _passwordController,
                        icon: Icons.lock_open),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF155FFD)),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                Colors.white.withOpacity(0.137),
                                Colors.white.withOpacity(0.17),
                                Colors.white.withOpacity(0.24),
                                Colors.white.withOpacity(0.28),
                                Colors.white.withOpacity(0.28),
                                Colors.white.withOpacity(0.3),
                              ], begin: Alignment.center)),
                          child: TextButton(
                              onPressed: () {
                                GetStorageClass.storeUser(
                                    _usernameController.text.trim(),
                                    _passwordController.text.trim());
                                GetStorageClass.storeData("isLoggedIn", "true");
                                Navigator.pushReplacementNamed(
                                    context, HomePage.id);
                              },
                              child: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.white,
                                size: 39,
                              )),
                        ))
                  ],
                ),
              ),
            ),
            // Bottom text part
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey[500], fontSize: 15),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpPage.id);
                        },
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
