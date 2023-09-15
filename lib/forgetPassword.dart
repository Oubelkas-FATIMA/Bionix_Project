import 'package:bionixapp/textHandler.dart';
import 'package:bionixapp/verifyCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'httpReqs.dart';
import 'logo.dart';
import 'main.dart';

bool loggedIn = false;

class forgetPassword extends StatefulWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

var formKey2 = GlobalKey<FormState>();
TextEditingController email2 = TextEditingController();

class _forgetPasswordState extends State<forgetPassword> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Color iconColor = Colors.red;

  bool wrong = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: const Color(0xFF617688),
          child: Center(
            child: Container(
              width: 700.w,
              height: 500.h,
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
                  loggedIn
                      ? Expanded(
                          child: SizedBox(
                              width: 0.1.sw,
                              height: 0.1.sw,
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: Color(0xFF7d7e7e),
                              ))))
                      : Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.01.sw, horizontal: 0.01.sw),
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                const Text(
                                  "forget password ",
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                const Text(
                                  "Check mail ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                const Text(
                                  " Please enter your mail address to receive a verification code",
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                Form(
                                  key: formKey2,
                                  child: SizedBox(
                                    height: 0.1.sh,
                                    width: 0.2.sw,
                                    child: textBox(
                                      text: " Enter your mail",
                                      icon: Icons.person,
                                      controller: email2,
                                      wrong: wrong,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.01.sh, horizontal: 0.03.sw),
                                  height: 0.1.sh,
                                  width: 0.2.sw,
                                  child: TextButton(
                                    onPressed: () async {
                                      // // Navigate to sign-up page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const verifyCode(),
                                        ),
                                      );

                                      // if (formKey2.currentState!.validate()) {
                                      //   // Email validation passed, proceed with sign-up
                                      //   await forgetUserPassword();
                                      //   // Additional sign-up logic here
                                      // }
                                    },
                                    child: Container(
                                        height: 0.05.sh,
                                        width: 0.15.sw,
                                        color: const Color(0xFF39B54A),
                                        child: Center(
                                            child: GilroyText(
                                                text: "Check email",
                                                size: 17,
                                                color: Colors.white))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
