import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/LoginScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../Screens/contriesScreen.dart';
import '../resources/auth_methods.dart';

Widget container(
    {required String name,
    required String image,
    required Function() onPresed}) {
  return InkWell(
    onTap: onPresed,
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: GradientText(
              name,
              style: TextStyle(fontFamily: 'MxRegular', fontSize: 14.sp),
              colors: const [
                Color.fromARGB(255, 221, 156, 64),
                Color.fromARGB(255, 254, 217, 164),
              ],
            )),
      ),
    ),
  );
}

Future showdialog(int index, context) async {
  return index == 0
      ? Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => CountriesScreen(),
          ),
        )
      : showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              backgroundColor: const Color.fromARGB(255, 27, 25, 25),
              title: const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'COMING SOON',
                    style: TextStyle(
                        fontFamily: 'MxRegular',
                        color: Colors.white,
                        fontSize: 22),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: TextButton(
                      child: const Text(
                        'Okay',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 247, 176, 78),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        );
}

Widget playerCard() {
  return Stack(
    children: [
      SizedBox(
          height: 200.h,
          width: 200.w,
          child: Image.asset('assets/images/player_card.png')),
      Positioned(
        top: 43,
        left: 77,
        child: SizedBox(
            height: 55.h,
            width: 55.w,
            child: Image.asset('assets/images/Cricket.jpg')),
      ),
      Positioned(
        top: 95.h,
        left: 70.w,
        child: SizedBox(
          width: 65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'C.ronaldo',
                style: TextStyle(
                    color: const Color.fromARGB(255, 123, 79, 19),
                    fontFamily: 'RaceSport',
                    fontSize: 6.sp),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Text(
                  '- ST -',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 123, 79, 19),
                      fontFamily: 'RaceSport',
                      fontSize: 6.sp),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

// showPlayerAnaliticsdialog

List playerAnalitics = [
  "- Name:",
  "- Number:",
  "- Country:",
  "- Position:",
  "- Age:",
  "- Yellow cards:",
  "- Red cards:",
  "- Goals:",
  "- Assits:",
];
List<dynamic> data = [
  "ronaldo",
  10,
  "portugal",
  "st",
  33,
  26,
  12,
  633,
  10,
];

Future showPlayerAnaliticsdialog(int index, context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        backgroundColor: const Color.fromARGB(255, 27, 25, 25),
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              "PLAYER'S ANALITICS",
              style: TextStyle(
                  fontFamily: 'MxRegular',
                  color: Colors.white,
                  fontSize: 17.sp),
            ),
          ),
        ),
        content: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.h, top: 10.h),
              child: SizedBox(
                  height: 150.h,
                  width: 150.h,
                  child: Image.asset('assets/images/logo2.png')),
            ),
            for (int i = 0; i < 9; i++)
              Padding(
                padding: EdgeInsets.only(top: 22.h),
                child: Row(
                  children: [
                    GradientText(
                      playerAnalitics[i],
                      style:
                          TextStyle(fontFamily: 'RaceSport', fontSize: 10.sp),
                      colors: const [
                        Color.fromARGB(255, 221, 156, 64),
                        Color.fromARGB(255, 254, 217, 164),
                      ],
                    ),
                    Text(
                      '\t\t${data[i]}',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'RaceSport',
                          fontSize: 10.sp),
                    ),
                  ],
                ),
              )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Center(
              child: TextButton(
                child: const Text(
                  'Okay',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 247, 176, 78),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Center(
            child: TextButton(
                onPressed: () async {
                  await Share.share("follow this player : salah , liverpool");
                },
                child: Text(
                  "Share",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 247, 176, 78),
                  ),
                )),
          )
        ],
      );
    },
  );
}

Widget drawer(context) {
  return Drawer(
    backgroundColor: Color.fromARGB(255, 13, 13, 16),
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        SizedBox(
          height: 100.h,
        ),
        ListTile(
          leading: const Icon(
            Icons.phone_android,
            color: Colors.white,
          ),
          title: Text(
            userphoneController.text,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          title: Text(
            FirebaseAuth.instance.currentUser?.displayName.toString() ?? "",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.email,
            color: Colors.white,
          ),
          title: Text(
            FirebaseAuth.instance.currentUser?.email.toString() ?? "",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: const Text(
            'LogOut',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () async {
            AuthMethods().signOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => loginSceren()));
          },
        ),
      ],
    ),
  );
}
