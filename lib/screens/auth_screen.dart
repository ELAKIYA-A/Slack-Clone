import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'dashboard.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "images/logo.svg",
              height: 30,
            ),
            SizedBox(height: 25),
            Text("First, enter your email",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900)),
            SizedBox(height: 12),
            Text("We suggest using the email address you use at work.",
                style: TextStyle(
                    color: Color(0xff454245),
                    fontWeight: FontWeight.w400,
                    fontSize: 15)),
            SizedBox(height: 15),
            Container(
              height: 80,
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "name@work-email.com",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            //SizedBox(height: 20),
            Container(
              height: 45,
              //top: -50,
              child: AnimatedButton(
                onPress: () {
                  Get.off(DashboardScreen());
                },
                width: 400,
                height: 50,
                text: 'Continue',

                ///              selectedTextColor: Color(0xff611F69),
                backgroundColor: Color(0xff611F69),
                //transitionType: TransitionType.,
                textStyle: TextStyle(
                    fontSize: 15,
                    // letterSpacing: 5,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 2,
                  width: 200,
                  color: Colors.grey.shade400,
                ),
                SizedBox(width: 10),
                Text("OR", style: TextStyle(color: Colors.black)),
                SizedBox(width: 10),
                Container(
                  height: 2,
                  width: 200,
                  color: Colors.grey.shade400,
                )
              ],
            ),
            SizedBox(height: 30),
            socialSignInButton(
                Image.asset(
                  "images/google.webp",
                  height: 25,
                ),
                "Continue With Google"),
            SizedBox(height: 10),
            socialSignInButton(
                SvgPicture.asset(
                  "images/apple.svg",
                  height: 25,
                ),
                "Continue With Apple"),
            SizedBox(height: 24),
            Text("Already using Slack?",
                style: TextStyle(
                    color: Color(0xff616570),
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            SizedBox(height: 5),
            InkWell(
              onTap: () {},
              child: Text("Sign in to an existing workspace",
                  style: TextStyle(
                      color: Color(0xff1264A3),
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text("Privacy & Terms",
                      style: TextStyle(
                          color: Color(0xff616570),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(width: 15),
                InkWell(
                  onTap: () {},
                  child: Text("Contact Us",
                      style: TextStyle(
                          color: Color(0xff616570),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                )
              ],
            )
          ],
        )
      ],
    ));
  }

  Widget socialSignInButton(Widget image, String title) {
    return InkWell(
      onTap: () {
        Get.off(DashboardScreen());
      },
      child: Container(
          height: 43,
          width: 400,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: BorderRadius.circular(2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image,
              SizedBox(width: 10),
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17))
            ],
          )),
    );
  }
}
