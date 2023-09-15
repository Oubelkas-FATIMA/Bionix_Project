import 'package:bionixapp/UpdateProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        color: Color.fromARGB(255, 242, 244, 246),
        child: Center(
          child: Container(
            width: 900.w,
            height: 650.h,
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Container(
                width: 900.w,
                height: 500.h,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align children to the start (left)

                        children: <Widget>[
                          const Text(
                            'Profile',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.green),
                          ),
                          Stack(children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(
                                    image:
                                        AssetImage("../images/OUBELKAS.jpg")),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xFF1F571E)),
                                child: const Icon(
                                  LineAwesomeIcons.alternate_pencil,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ]),

                          const SizedBox(height: 10),
                          const Text(
                            'Oubelkas fatima',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const Text(
                            'oubalkassf@gmail.com',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const updateProfile(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1F571E),
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text(
                                'Edit Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 20),

                          // Menu

                          ProfileMenuWidget(
                            title: 'Setting',
                            icon: LineAwesomeIcons.cog,
                            onPresse: () {},
                          ),
                          ProfileMenuWidget(
                            title: 'Farm Informations',
                            icon: LineAwesomeIcons.fruit_apple,
                            onPresse: () {},
                          ),

                          ProfileMenuWidget(
                            title: 'Historical Data',
                            icon: LineAwesomeIcons.history,
                            onPresse: () {},
                          ),

                          ProfileMenuWidget(
                            title: 'Help and Support',
                            icon: LineAwesomeIcons.hand_holding,
                            onPresse: () {},
                          ),

                          ProfileMenuWidget(
                            title: 'User management',
                            icon: LineAwesomeIcons.info,
                            onPresse: () {},
                          ),
                        ])),
              ),
            ),
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            // BoxShadow(
            //     offset: Offset(0, 5),
            //     // color: Color(0xFF1F571E),
            //     spreadRadius: 2,
            //     blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPresse,
    this.textcolor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPresse;

  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPresse,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blue.withOpacity(0.1)),
        child: Icon(
          icon,
          color: Color(0xFF1F571E),
        ),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodySmall?.apply(color: textcolor)),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blue.withOpacity(0.1)),
        child: const Icon(
          LineAwesomeIcons.angle_right,
        ),
      ),
    );
  }
}
