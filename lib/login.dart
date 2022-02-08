// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:latihan_firebase/constants.dart';
import 'package:latihan_firebase/firebase_service.dart';
import 'package:latihan_firebase/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  final auth = Firebase_service();
  String? _password;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    padding: lebar >= 800
                        ? EdgeInsets.fromLTRB(15, 30, 0, 0)
                        : EdgeInsets.fromLTRB(15, 150, 0, 0),
                    child: Text(
                      "Hello!",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor),
                    ),
                  ),
                  Container(
                    padding: lebar >= 800
                        ? EdgeInsets.fromLTRB(15, 85, 0, 0)
                        : EdgeInsets.fromLTRB(15, 210, 0, 0),
                    child: Text(
                      "Welcome To",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor),
                    ),
                  ),
                  Container(
                    padding: lebar >= 800
                        ? EdgeInsets.fromLTRB(15, 140, 0, 0)
                        : EdgeInsets.fromLTRB(15, 270, 0, 0),
                    child: Text(
                      "Peduli Sayangi",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: lebar >= 800
                  ? EdgeInsets.only(top: 40.0, left: 15.0, right: 20.0)
                  : EdgeInsets.only(top: 80.0, left: 15.0, right: 20.0),
              child: Column(
                children: [
                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    alignment: Alignment(1, 0),
                    padding: EdgeInsets.only(top: 15),
                    child: InkWell(
                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: kPrimaryColor,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      shadowColor: kPrimaryColor.withOpacity(0.5),
                      color: kPrimaryColor,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          auth.login(email.text, password.text, context);
                        },
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: kTextLightColor, fontSize: 15),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Register();
                              },
                            ),
                          );
                  },
                  child: Text(
                    "Click Here",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: kPrimaryColor, fontSize: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
