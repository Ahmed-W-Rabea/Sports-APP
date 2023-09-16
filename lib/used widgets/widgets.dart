import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/Screens/LoginScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../Screens/contriesScreen.dart';
import '../cubits/get_playerAnalytics/get_player_analytics_cubit.dart';

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

Future showPlayerAnaliticsdialog(int index, context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BlocBuilder<GetPlayerAnalyticsCubit, GetPlayerAnalyticsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<GetPlayerAnalyticsCubit>(context);
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 3,
            backgroundColor: const Color.fromARGB(255, 27, 25, 25),
            title: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: GradientText(
                  'PLAYER ALALYTICTS',
                  style: TextStyle(fontFamily: 'MxRegular', fontSize: 17.sp),
                  colors: const [
                    Color.fromARGB(255, 221, 156, 64),
                    Color.fromARGB(255, 254, 217, 164),
                  ],
                ),
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h, top: 9.h),
                    child: Container(
                      height: 150.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            cubit.response!.result![0].playerImage ??
                                'https://media.istockphoto.com/id/1264074047/vector/breaking-news-background.jpg?s=612x612&w=0&k=20&c=C5BryvaM-X1IiQtdyswR3HskyIZCqvNRojrCRLoTN0Q=',
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GradientText(
                              '- Name:  ',
                              style: TextStyle(
                                  fontFamily: 'RaceSport', fontSize: 10.sp),
                              colors: const [
                                Color.fromARGB(255, 221, 156, 64),
                                Color.fromARGB(255, 254, 217, 164),
                              ],
                            ),
                            Text(
                              cubit.response!.result![0].playerName ?? 'Null',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'RaceSport',
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Row(
                            children: [
                              GradientText(
                                '- Number:  ',
                                style: TextStyle(
                                    fontFamily: 'RaceSport', fontSize: 10.sp),
                                colors: const [
                                  Color.fromARGB(255, 221, 156, 64),
                                  Color.fromARGB(255, 254, 217, 164),
                                ],
                              ),
                              Text(
                                cubit.response!.result![0].playerNumber ??
                                    'Null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RaceSport',
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Row(
                            children: [
                              GradientText(
                                '- Country:  ',
                                style: TextStyle(
                                    fontFamily: 'RaceSport', fontSize: 10.sp),
                                colors: const [
                                  Color.fromARGB(255, 221, 156, 64),
                                  Color.fromARGB(255, 254, 217, 164),
                                ],
                              ),
                              Text(
                                cubit.response!.result![0].playerCountry ??
                                    'Null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RaceSport',
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Row(
                            children: [
                              GradientText(
                                '- Position:  ',
                                style: TextStyle(
                                    fontFamily: 'RaceSport', fontSize: 10.sp),
                                colors: const [
                                  Color.fromARGB(255, 221, 156, 64),
                                  Color.fromARGB(255, 254, 217, 164),
                                ],
                              ),
                              Text(
                                cubit.response!.result![0].playerType ?? 'Null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RaceSport',
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Row(
                            children: [
                              GradientText(
                                '- Age:  ',
                                style: TextStyle(
                                    fontFamily: 'RaceSport', fontSize: 10.sp),
                                colors: const [
                                  Color.fromARGB(255, 221, 156, 64),
                                  Color.fromARGB(255, 254, 217, 164),
                                ],
                              ),
                              Text(
                                cubit.response!.result![0].playerAge ?? 'Null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RaceSport',
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Row(
                            children: [
                              GradientText(
                                '- Yellow Cards:  ',
                                style: TextStyle(
                                    fontFamily: 'RaceSport', fontSize: 10.sp),
                                colors: const [
                                  Color.fromARGB(255, 221, 156, 64),
                                  Color.fromARGB(255, 254, 217, 164),
                                ],
                              ),
                              Text(
                                cubit.response!.result![0].playerYellowCards ??
                                    'Null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RaceSport',
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Row(
                            children: [
                              GradientText(
                                '- Red Cards:  ',
                                style: TextStyle(
                                    fontFamily: 'RaceSport', fontSize: 10.sp),
                                colors: const [
                                  Color.fromARGB(255, 221, 156, 64),
                                  Color.fromARGB(255, 254, 217, 164),
                                ],
                              ),
                              Text(
                                cubit.response!.result![0].playerRedCards ??
                                    'Null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RaceSport',
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Row(
                            children: [
                              GradientText(
                                '- Goals:  ',
                                style: TextStyle(
                                    fontFamily: 'RaceSport', fontSize: 10.sp),
                                colors: const [
                                  Color.fromARGB(255, 221, 156, 64),
                                  Color.fromARGB(255, 254, 217, 164),
                                ],
                              ),
                              Text(
                                cubit.response!.result![0].playerGoals ??
                                    'Null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RaceSport',
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Row(
                            children: [
                              GradientText(
                                '- Assists:  ',
                                style: TextStyle(
                                    fontFamily: 'RaceSport', fontSize: 10.sp),
                                colors: const [
                                  Color.fromARGB(255, 221, 156, 64),
                                  Color.fromARGB(255, 254, 217, 164),
                                ],
                              ),
                              Text(
                                cubit.response!.result![0].playerAssists ??
                                    'Null',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RaceSport',
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
              Center(
                child: TextButton(
                    onPressed: () async {
                      await Share.share(
                          "follow this player : ${cubit.response!.result![0].playerName ?? "null"} , ${cubit.response!.result![0].teamName ?? "null"}");
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
