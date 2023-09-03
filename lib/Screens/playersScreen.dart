import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/playerinfo.dart';
import 'package:flutter_application_1/used%20widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 27, 25, 25),
            Color.fromARGB(255, 32, 33, 43),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 27, 25, 25),
                Color.fromARGB(255, 32, 33, 43),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                        height: 180.h,
                        width: 180.w,
                        child: Image.asset('assets/images/league logo.png')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: GradientText(
                      'TEAM NAME',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: 'MxRegular',
                          color: Colors.white),
                      colors: const [
                        Color.fromARGB(255, 221, 156, 64),
                        Color.fromARGB(255, 254, 217, 164),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '- SEARCH FOR SPECIFIC PLAYER -',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: 'RaceSport',
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 40.h,
                      width: 300.w,
                      child: const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 221, 156, 64),
                          )),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: ' Search..',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '- team\'s  players -',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'RaceSport',
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 8.h),
                  child: SizedBox(
                    height: 300.h,
                    child: Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 5 / 4,
                        crossAxisSpacing: 17,
                        mainAxisSpacing: 17,
                        children: [
                          for (int i = 0; i < 21; i++)
                            InkWell(
                              onTap: () {
                                showdialog2(i, context);
                              },
                              child: playerCard(),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
