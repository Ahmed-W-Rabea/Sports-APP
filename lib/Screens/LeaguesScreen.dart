import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/teamsScreen.dart';
import 'package:flutter_application_1/cubits/get_league/get_league_cubit.dart';
import 'package:flutter_application_1/cubits/get_team/get_team_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_country/get_country_cubit.dart';
import '../cubits/get_topScorers/get_top_scorers_cubit.dart';
import 'contriesScreen.dart';

class LeaguesScreen extends StatelessWidget {
  int? countryKey;
  int index1;
  LeaguesScreen({super.key, this.countryKey, required this.index1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 10.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const CountriesScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  color: const Color.fromARGB(255, 237, 179, 97),
                ),
              ),
            ),
            BlocBuilder<GetCountryCubit, GetCountryState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 160.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                state.response.result?[index1].countryLogo ??
                                    'https://media.istockphoto.com/id/1264074047/vector/breaking-news-background.jpg?s=612x612&w=0&k=20&c=C5BryvaM-X1IiQtdyswR3HskyIZCqvNRojrCRLoTN0Q=',
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: GradientText(
                          state.response.result?[index1].countryName ??
                              'Null Nmae',
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
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.h, bottom: 23.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '- select the league -',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'RaceSport',
                      color: Colors.white),
                ),
              ),
            ),
            BlocBuilder<GetLeagueCubit, GetLeagueState>(
              builder: (context, state) {
                if (state is GetLeagueLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetLeagueSuccess) {
                  return Padding(
                    padding: EdgeInsets.only(right: 20.w, left: 20.w),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 352.h,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (int i = 0;
                                  i < state.response.result!.length;
                                  i++) ...[
                                if (state.response.result?[i].countryKey ==
                                    countryKey)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Container(
                                      height: 45.h,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 225, 154, 55),
                                            Color.fromARGB(255, 207, 156, 84),
                                          ],
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          context.read<GetTeamCubit>().getTeam(
                                              id: state.response.result![i]
                                                  .leagueKey!);
                                          context
                                              .read<GetTopScorersCubit>()
                                              .getTopScorers(
                                                  id2: state.response.result![i]
                                                      .leagueKey!);

                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  TeamsScreen(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${i}',
                                              style: TextStyle(
                                                  shadows: const [
                                                    Shadow(
                                                      color: Colors.black,
                                                      offset: Offset(1.0, 1.0),
                                                    ),
                                                  ],
                                                  fontSize: 9.sp,
                                                  fontFamily: 'RaceSport'),
                                            ),
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Container(
                                              height: 45.h,
                                              width: 45.w,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    state.response.result?[i]
                                                            .leagueLogo ??
                                                        'https://media.istockphoto.com/id/1264074047/vector/breaking-news-background.jpg?s=612x612&w=0&k=20&c=C5BryvaM-X1IiQtdyswR3HskyIZCqvNRojrCRLoTN0Q=',
                                                  ),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                            Spacer(
                                              flex: 5,
                                            ),
                                            Text(
                                              state.response.result?[i]
                                                      .leagueName ??
                                                  'Null Name',
                                              style: TextStyle(
                                                  shadows: const [
                                                    Shadow(
                                                      color: Colors.black,
                                                      offset: Offset(1.0, 1.0),
                                                    ),
                                                  ],
                                                  fontSize: 9.sp,
                                                  fontFamily: 'RaceSport'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No Result'),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
