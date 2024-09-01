import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_practice30_hw1/models/get_storage.dart';
import 'package:flutter_practice30_hw1/pages/home_page.dart';
import 'package:flutter_practice30_hw1/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  static final String id = "sign_up_page";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
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
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Create Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
                textFieldMaker(
                    content: "Username",
                    icon: Icons.person_2_outlined,
                    controller: _usernameController),
                textFieldMaker(
                    content: "E-mail",
                    icon: Icons.email_outlined,
                    controller: _emailController),
                textFieldMaker(
                    content: "Phone Number",
                    icon: Icons.phone_outlined,
                    controller: _phoneNumberController),
                textFieldMaker(
                    content: "Password",
                    icon: Icons.lock_open,
                    controller: _passwordController),
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
                            GetStorageClass.storeUser2(
                                _usernameController.text.trim(),
                                _emailController.text.trim(),
                                _phoneNumberController.text.trim(),
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
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey[500], fontSize: 15),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: Text(
                      "SIGN IN",
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
        ),
      ]),
    );
  }
}
