import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class updateProfile extends StatelessWidget {
  const updateProfile({super.key});

  Widget buttomClick() {
    return Container(
      height: 100,
      width: 200,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: const Icon(
                  LineAwesomeIcons.camera,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  LineAwesomeIcons.image,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: ((builder) => buttomClick()));
                                  },
                                  child: const Icon(
                                    LineAwesomeIcons.camera,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          const SizedBox(height: 10),
                          Form(
                              child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('fullname'),
                                    prefixIcon: Icon(LineAwesomeIcons.user)),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('email'),
                                    prefixIcon:
                                        Icon(LineAwesomeIcons.envelope_1)),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('Farm\'s Name'),
                                    prefixIcon:
                                        Icon(LineAwesomeIcons.fruit_apple)),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('Location'),
                                    prefixIcon: Icon(LineAwesomeIcons.map_1)),
                              ),
                            ],
                          ))
                        ]),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
