import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/get_player/get_player_cubit.dart';
import 'package:flutter_application_1/used%20widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../cubits/get_playerAnalytics/get_player_analytics_cubit.dart';

class PlayersScreen extends StatelessWidget {
  PlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetPlayerCubit>(context);
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
              BlocBuilder<GetPlayerCubit, GetPlayerState>(
                builder: (context, state) {
                  if (state is GetPlayerLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetPlayerSuccess) {
                    return Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: SizedBox(
                        height: 300.h,
                        child: Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            children: [
                              for (int i = 0;
                                  i < cubit.response.result!.length;
                                  i++)
                                InkWell(
                                  onTap: () async {
                                    await context
                                        .read<GetPlayerAnalyticsCubit>()
                                        .getPlayerAnalytics(
                                            id: cubit.response.result![i]
                                                .playerKey!);

                                    showPlayerAnaliticsdialog(i, context);
                                  },
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                          height: 200.h,
                                          width: 200.w,
                                          child: Image.asset(
                                              'assets/images/player_card.png')),
                                      Positioned(
                                        top: 43,
                                        left: 77,
                                        child: Container(
                                          height: 55.h,
                                          width: 55.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                cubit.response.result![i]
                                                        .playerImage ??
                                                    'https://media.istockphoto.com/id/1264074047/vector/breaking-news-background.jpg?s=612x612&w=0&k=20&c=C5BryvaM-X1IiQtdyswR3HskyIZCqvNRojrCRLoTN0Q=',
                                              ),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 95.h,
                                        left: 70.w,
                                        child: SizedBox(
                                          width: 65,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cubit.response.result![i]
                                                        .playerName ??
                                                    'Null Name',
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 123, 79, 19),
                                                    fontFamily: 'RaceSport',
                                                    fontSize: 6.sp),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 3.h),
                                                child: Text(
                                                  cubit.response.result![i]
                                                          .playerType ??
                                                      'Null Name',
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 123, 79, 19),
                                                      fontFamily: 'RaceSport',
                                                      fontSize: 6.sp),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('data not found'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
