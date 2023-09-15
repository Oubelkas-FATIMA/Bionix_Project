import 'package:bionixapp/resetPassword.dart';
import 'package:bionixapp/textHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'httpReqs.dart';
import 'logo.dart';
import 'main.dart';

bool loggedIn = false;

class verifyCode extends StatefulWidget {
  const verifyCode({Key? key}) : super(key: key);

  @override
  State<verifyCode> createState() => _verifyCodeState();
}

class _verifyCodeState extends State<verifyCode> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Color iconColor = Colors.red;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
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
                                GilroyText(
                                  text: "Verification code",
                                  size: 25,
                                  color: const Color(0xFF1D262D),
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                const Text(
                                  "Check code ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                const Text(
                                  " Please enter the digit sent to provided mail ",
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                OtpTextField(
                                  borderRadius: BorderRadius.circular(20),
                                  enabledBorderColor: Colors.black,
                                  numberOfFields: 5,
                                  borderColor: Color(0xFF512DA8),
                                  //set to true to show as box or false to show as dash
                                  showFieldAsBox: true,
                                  //runs when a code is typed in
                                  onCodeChanged: (String code) {
                                    //handle validation or checks here
                                  },
                                  //runs when every textfield is filled
                                  onSubmit: (String verificationCode) async {
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (context) {
                                    //       return AlertDialog(
                                    //         title: Text("Verification Code"),
                                    //         content: Text(
                                    //             'Code entered is $verificationCode'),
                                    //       );
                                    //     });

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const resetPassword(),
                                      ),
                                    );
                                  }, // end onSubmit
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.01.sh, horizontal: 0.03.sw),
                                  height: 0.1.sh,
                                  width: 0.2.sw,
                                  child: TextButton(
                                    onPressed: () async {},
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
