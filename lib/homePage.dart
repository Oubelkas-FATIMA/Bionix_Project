import 'package:bionixapp/dashboard.dart';
import 'package:bionixapp/httpReqs.dart';
import 'package:bionixapp/loginPage.dart';
import 'package:bionixapp/main.dart';
import 'package:bionixapp/textHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ProfilePage.dart';
import 'logo.dart';

String currentPageName = "";

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  void switchToDashboardPage() {
    setState(() {
      currentDashboardPage = const dashBoard();
      currentPageName = 'Dashboard';
    });
  }

  void switchToProfilePage() {
    setState(() {
      currentProfilePage = const ProfilePage();
      currentPageName = 'Profile';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPageName = "Dashboard";
  }

  @override
  Widget build(BuildContext context) {
    Widget textButtonWithIcon({
      required String text,
      required IconData iconData,
      required VoidCallback onPressed,
    }) {
      return SizedBox(
        width: 1.sw,
        height: 0.1.sh,
        child: TextButton(
          onPressed: () {
            onPressed;
            setState(() {
              currentPageName = text;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 0.025.sw),
              Container(
                  color: Colors.transparent,
                  child: Icon(
                    iconData,
                    color: (currentPageName == text)
                        ? const Color(0xFF39B54A)
                        : Colors.white,
                    size: 24.sp,
                  )),
              SizedBox(width: 0.013.sw),
              Container(
                  margin: EdgeInsets.only(top: 0.007.sh),
                  color: Colors.transparent,
                  child: GilroyThin(
                      text: text,
                      size: 16,
                      color: (currentPageName == text)
                          ? const Color(0xFF39B54A)
                          : Colors.white)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: const Color(0xFF617688),
        child: Center(
          child: Container(
            width: 0.95.sw,
            height: 0.9.sh,
            color: const Color(0xFFE6E7E8),
            child: Row(
              children: [
                Container(
                  width: 0.15.sw,
                  height: 0.9.sh,
                  color: const Color(0xFF1D262D),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          width: 0.2.sw,
                          height: 0.15.sh,
                          color: const Color(0xFF222C33),
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Positioned(
                                left: 0.015.sw,
                                top: 0.025.sh,
                                child: SizedBox(
                                  height: 0.1.sh,
                                  width: 0.05.sw,
                                  child: LogoSvg(
                                    height: 0.1.sh,
                                    width: 0.05.sw,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.06.sh,
                                left: 0.06.sw,
                                child: Text(
                                  "BIONIX\nAPP",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontFamily: "Gilroy",
                                    fontWeight: FontWeight.w100,
                                    color: const Color(0xFF939598),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        textButtonWithIcon(
                            text: 'Dashboard',
                            iconData: Icons.dashboard,
                            onPressed: switchToDashboardPage),
                        textButtonWithIcon(
                            text: 'Robot Overview',
                            iconData: Icons.bar_chart,
                            onPressed: () {}),
                        textButtonWithIcon(
                            text: 'Profil',
                            iconData: Icons.person,
                            onPressed: () {
                              switchToProfilePage();
                            }),
                        textButtonWithIcon(
                            text: 'Settings',
                            iconData: Icons.settings,
                            onPressed: () {}),
                        textButtonWithIcon(
                            text: 'Support',
                            iconData: Icons.support_agent_rounded,
                            onPressed: () {}),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF222C33)),
                          ),
                          onPressed: () {
                            logout();
                            loggedIn = false;
                            moveToLogin();
                          },
                          child: SizedBox(
                            height: 0.05.sh,
                            child: Center(
                              child: GilroyText(text: "Sign Out", size: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Display the current page based on the selected option
                if (currentPageName == 'Dashboard') currentDashboardPage,

                if (currentPageName == 'Profile') currentProfilePage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
