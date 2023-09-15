import 'package:bionixapp/homePage.dart';
import 'package:bionixapp/loginPage.dart';

import 'package:bionixapp/textHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProfilePage.dart';
import 'SettingPage.dart';
import 'dashboard.dart';

import 'editProfile.dart';
import 'httpReqs.dart';

Widget currentPage = const Center(
  child: CircularProgressIndicator(
    color: Colors.red,
  ),
);

Widget currentDashboardPage =
    const dashBoard(); // Initialize with the dashboard page

Widget currentProfilePage =
    const ProfilePage(); // Initialize with the profile page

Function movetoHome = () {};
Function moveToLogin = () {};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1536, 747),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const ProfilePage(),
      // child: const MyHomePage(),
      // child: const SettingsFourPage(),
      // child: const editProfile(),
      // child: const homePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Function sessionExpired = () {};
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  void checkPrefs() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.containsKey('token')) {
      if (await checkToken(prefs.getString('token'))) {
        setState(() {
          currentPage = const homePage();
          sessionToken = prefs.getString('token')!;
        });
        return;
      } else {
        setState(() {
          currentPage = const loginPage();
          sessionExpired();
        });
        return;
      }
    }
    setState(() {
      currentPage = const loginPage();
    });
  }

  @override
  void initState() {
    super.initState();
    movetoHome = () {
      setState(() {
        currentPage = const homePage();
      });
    };
    moveToLogin = () {
      setState(() {
        currentPage = const loginPage();
      });
    };

    sessionExpired = () async {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFE6E7E8),
            title: const Text('Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GilroyText(text: 'Your Session has Expired.', size: 12),
                  GilroyText(text: 'Please Log In Again', size: 12),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Log In'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    };
    WidgetsBinding.instance.addPostFrameCallback((_) => checkPrefs());
  }

  @override
  Widget build(BuildContext context) {
    return currentPage;
  }
}
