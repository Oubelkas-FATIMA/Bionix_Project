import 'package:flutter/material.dart';
import 'package:bionixapp/textHandler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:http/http.dart';

import 'httpReqs.dart';

import 'loginPage.dart';
import 'logo.dart'; // Import your logo widget here
// import 'httpReqs.dart'; // Import your HTTP requests handling file here

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

var formKey = GlobalKey<FormState>();
TextEditingController user = TextEditingController();
TextEditingController pass = TextEditingController();
TextEditingController email = TextEditingController();

class _signUpPageState extends State<signUpPage> {
  bool wrong = false;

  String? userError;
  String? emailError;
  String? passError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        color: const Color(0xFF617688),
        child: Center(
          child: Container(
            width: 800.w,
            height: 600.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE6E7E8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0.01.sh,
                  blurRadius: 0.05.sh,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.01.sw, horizontal: 0.01.sw),
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LogoSvg(
                          height: 100.h,
                          width: 100.w,
                        ),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        GilroyText(
                            text: "Bionix Dashboard",
                            size: 20,
                            color: const Color(0xFF1D262D)),
                        SizedBox(
                          height: 0.04.sh,
                        ),
                        Form(
                          key:
                              formKey, // Use the GlobalKey<FormState> you already have
                          child: Column(
                            children: [
                              SizedBox(
                                height: 0.1.sh,
                                width: 0.2.sw,
                                child: TextFormField(
                                  controller: user,
                                  decoration: InputDecoration(
                                    labelText: 'Username',
                                    icon: Icon(Icons.person),
                                    errorText: userError,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Username can't be empty";
                                    }
                                    if (!GetUtils.isUsername(value)) {
                                      return "Not a valid username";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 0.1.sh,
                                width: 0.2.sw,
                                child: TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    icon: Icon(Icons.email),
                                    errorText: emailError,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email can't be empty";
                                    }
                                    if (!GetUtils.isEmail(value)) {
                                      return "Not a valid email";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 0.06.sh,
                                width: 0.2.sw,
                                child: TextFormField(
                                  controller: pass,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    icon: Icon(Icons.lock),
                                    errorText: passError,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password can't be empty";
                                    }
                                    if (value.length < 8) {
                                      return "Password must be at least 8 characters long";
                                    }
                                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                      return "Password must contain at least one uppercase letter";
                                    }
                                    if (!RegExp(r'\d').hasMatch(value)) {
                                      return "Password must contain at least one digit";
                                    }
                                    return null;
                                  },
                                  obscureText: true, // Hide the password text
                                ),
                              ),
                              SizedBox(
                                height: 0.03.sh,
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            setState(() {
                              userError = null;
                              emailError = null;
                              passError = null;

                              if (user.text.isEmpty ||
                                  !GetUtils.isUsername(user.text)) {
                                userError = "Not a valid username";
                              }
                              if (email.text.isEmpty ||
                                  !GetUtils.isEmail(email.text)) {
                                emailError = "Not a valid email";
                              }

                              // Check if password meets the requirements
                              if (pass.text.isEmpty) {
                                passError = "Password can't be empty";
                              } else if (pass.text.length < 8) {
                                passError =
                                    "Password must be at least 8 characters long";
                              } else if (!RegExp(r'[A-Z]')
                                  .hasMatch(pass.text)) {
                                passError =
                                    "Password must contain at least one uppercase letter";
                              } else if (!RegExp(r'\d').hasMatch(pass.text)) {
                                passError =
                                    "Password must contain at least one digit";
                              }

                              // Check if all fields are valid
                              if (userError == null &&
                                  emailError == null &&
                                  passError == null) {
                                // All fields are valid, you can proceed with further actions.
                              }
                            });

                            // Handle sign-up logic here
                            if (formKey.currentState!.validate()) {
                              // Email validation passed, proceed with sign-up
                              await validateUserEmail();
                              // Additional sign-up logic here
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.01.sh, horizontal: 0.03.sw),
                            child: Container(
                              height: 0.05.sh,
                              width: 0.15.sw,
                              color: const Color(0xFF39B54A),
                              child: Center(
                                child: GilroyText(
                                  text: "Sign Up",
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("Already have an account ?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const loginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Login Here",
                                  style: TextStyle(
                                    color: Color(0xFF8ABA64),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 600.h,
                  width: 0.30.sw,
                  // color: const Color(0xFF1D262D),
                  child: Center(
                    child: Image.asset(
                      'images/robot.png',
                      height: 0.5.sh,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
