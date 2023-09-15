import 'package:bionixapp/textHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SignUpPage.dart';
import 'forgetPassword.dart';
import 'httpReqs.dart';
import 'logo.dart';
import 'main.dart';

bool loggedIn = false;

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Color iconColor = Colors.red;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool wrong = false;

  void setToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('token', token);
  }

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
              width: 900.w,
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
                                  height: 0.05.sh,
                                ),
                                SizedBox(
                                  height: 0.1.sh,
                                  width: 0.2.sw,
                                  child: textBox(
                                    text: "Username",
                                    icon: Icons.person,
                                    controller: user,
                                    wrong: wrong,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.07.sh,
                                  width: 0.2.sw,
                                  child: textBox(
                                    text: "Password",
                                    icon: Icons.lock,
                                    isPassword: true,
                                    controller: pass,
                                    wrong: wrong,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const forgetPassword(),
                                                ),
                                              );
                                            },
                                            child: GilroyText(
                                                text: "Forget password ?    ",
                                                size: 11,
                                                color:
                                                    const Color(0xFF1D262D)))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: TextButton(
                                            onPressed: () {
                                              // Navigate to sign-up page
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      signUpPage(),
                                                ),
                                              );
                                            },
                                            child: GilroyText(
                                                text: "    Sign Up",
                                                size: 11,
                                                color:
                                                    const Color(0xFF1D262D)))),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.01.sh, horizontal: 0.03.sw),
                                  height: 0.1.sh,
                                  width: 0.2.sw,
                                  child: TextButton(
                                    onPressed: () async {
                                      final result =
                                          await login(user.text, pass.text);
                                      if (result.length == 1) {
                                        print(result['message']);
                                        setState(() {
                                          wrong = true;
                                        });
                                      } else if (result.keys
                                          .contains('token')) {
                                        print('Logged in');
                                        setToken(result['token']);
                                        sessionToken = result['token'];
                                        setState(() {
                                          wrong = false;
                                          loggedIn = true;
                                          movetoHome();
                                        });
                                      }
                                    },
                                    child: Container(
                                        height: 0.05.sh,
                                        width: 0.15.sw,
                                        color: const Color(0xFF39B54A),
                                        child: Center(
                                            child: GilroyText(
                                                text: "Login",
                                                size: 17,
                                                color: Colors.white))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  Container(
                    height: 500.h,
                    width: 0.35.sw,
                    color: const Color(0xFF1D262D),
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
    });
  }
}
