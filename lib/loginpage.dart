import 'dart:developer';
import 'dart:ffi';

import 'package:designapp/constant.dart';
import 'package:designapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool istyping = false;
TextEditingController usercontroller = TextEditingController();
TextEditingController _passwordcontroller = TextEditingController();
bool showpassword = true;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          body: Container(
        color: colorwhite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 20,
                top: 60,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ))
                  ],
                )),
            Positioned(
                top: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/appbar.png"),
                          fit: BoxFit.cover),
                      color: colorblue,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                )),
            Positioned(
                top: 50,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/welcome.png",
                  ),
                )),
            Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.24,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/bluerect.png"),
                          fit: BoxFit.cover),
                      color: colorblue,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.22,
                left: MediaQuery.of(context).size.height * 0.05,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  elevation: 10,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: colorwhite,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                color: colorblue,
                                fontWeight: FontWeight.w500,
                                fontSize: 28),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: usercontroller,
                              onChanged: (newQuery) {
                                setState(() {
                                  istyping = true;
                                });
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(17)),
                                  ),
                                  // filled: true,
                                  // fillColor: Colors.white,
                                  labelText: "UserName",
                                  floatingLabelStyle: TextStyle(
                                    fontSize: 20,
                                    color: colorblue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: colorblue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  suffixIcon: istyping
                                      ? IconButton(
                                          icon: Icon(Icons.close,
                                              color: colorblue),
                                          onPressed: () {
                                            usercontroller.clear();
                                            setState(() {
                                              istyping = !istyping;
                                            });
                                          },
                                        )
                                      : Icon(
                                          Icons.edit,
                                          color: colorblue,
                                        )),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _passwordcontroller,
                              onChanged: (newQuery) {
                                setState(() {
                                  istyping = true;
                                });
                              },
                              obscureText: showpassword,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(17)),
                                  ),
                                  // filled: true,
                                  // fillColor: Colors.white,
                                  labelText: "Password",
                                  floatingLabelStyle: TextStyle(
                                    fontSize: 20,
                                    color: colorblue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: colorblue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye,
                                        color: colorblue),
                                    onPressed: () {
                                      setState(() {
                                        showpassword = !showpassword;
                                      });
                                    },
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  log(usercontroller.text);
                                  if (usercontroller.text.isEmpty) {
                                    Fluttertoast.showToast(
                                      msg: "Please enter the Username",
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage(
                                                username:
                                                    "Welcome ${usercontroller.text}",
                                              )),
                                    ).then((value) => nologintoast(
                                        "Welcome ${usercontroller.text}"));
                                  }
                                },
                                style: loginbuttonstyle,
                                child: Text(
                                  "   Login   ",
                                  style: buttontextstyle,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  log(usercontroller.text);
                                  if (usercontroller.text.isEmpty) {
                                    return nologintoast(
                                        "Please enter the Username");
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage(
                                                username: "Welcome",
                                              )),
                                    ).then((value) => nologintoast(
                                        "Welcome ${usercontroller.text}"));
                                  }
                                },
                                style: loginbuttonstyle,
                                child: Text(
                                  "Skip Login",
                                  style: buttontextstyle,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text("Login using"),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/google.png"),
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/fb.png"),
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/skype.png"),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      )),
    );
  }

  void nologintoast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
